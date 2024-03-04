import warnings
warnings.filterwarnings("ignore")
import re
from re import sub, search, findall
import pandas as pd
from datetime import datetime
import numpy as np


class EpicPars:
    def __init__(self):
        pass

    def epi_dates_preparation(self, strng):
        data_1 = re.sub(r'(0?[1-9]|[12]\d|30|31)[.](0?[1-9]|1[0-2])[.](\d{4})',
                        '\\1-\\2-\\3', strng)
        return re.sub(r'(0?[1-9]|[12]\d|30|31)[.](0?[1-9]|1[0-2])[.](\d{2})',
                      '\\1-\\2-20\\3', data_1)

    def get_gender(self, file_):
        file_ = re.sub('диагноз.*', '', file_)
        if 'вна' in file_:
            return 25
        else:
            return 26

    def remover(self, file_):
        file_ = ''.join(file_.split()).lower()
        stop_element = [',', ':', '/t', 'менее']
        for elem in stop_element:
            if elem == ',':
                file_ = re.sub(elem, '.', file_)
            else:
                file_ = re.sub(elem, '', file_)
        return file_

    def prepare_person_table(
            self,
            gender_list,
            list_of_epi,
            patient_ids,
            hospital_days=[],
            date_of_birth=[]
            ):
        for file_ in list_of_epi:
            admission = re.findall('\d{2}-\d{2}-\d{4}', file_)[1]
            discharge = re.findall('\d{2}-\d{2}-\d{4}', file_)[-1]
            hospital_days.append(
                datetime.strptime(discharge, '%d-%m-%Y').date() -
                datetime.strptime(admission, '%d-%m-%Y').date())
            date_of_birth.append(re.findall('\d{2}-\d{2}-\d{4}', file_)[0])
            data_dct = {'person_id': patient_ids, 'date_of_birth': date_of_birth, 'hospital_days': hospital_days,
                        'sex_concept_id': gender_list}
        df = pd.DataFrame(data_dct)
        df = df.replace(r'', np.nan, regex=True)
        df['hospital_days'] = df['hospital_days'].dt.days.astype('int16')
        df['date_of_birth'] = pd.to_datetime(df.date_of_birth, dayfirst=True)
        return df


    def measurements_template(
            self,
            list_of_epicrisis,
            patient_ids,
            measurements_map,
            measurement_id=[],
            measurement_date=[],
            measurement_concept_id=[],
            patient_id=[],
            value=[]
    ):
        for measurement_name, sub_dict in measurements_map.items():
            for measurement_type, concept_id in sub_dict.items():
                for file_, patient_id_ in zip(list_of_epicrisis, patient_ids):
                    pattern0 = ''.join(['r(\d{2}-\d{2}-\d{4})(', measurement_type, ')'])
                    file_ = sub(pattern0, r'\2\1', file_)
                    pattern1 = ''.join(['(?<=', measurement_type, ')', '(\d{2}-\d{2}-\d{4}|)'])
                    for date in findall(pattern1, file_):
                        measurement_date.append(date)
                        patient_id.append(patient_id_)
                        measurement_concept_id.append(concept_id)
                    pattern2 = ''.join(['(', measurement_type, ')', '(\d{2}-\d{2}-\d{4}|)'])
                    file_1 = sub(pattern2, r'\2\1', file_)
                    pattern3 = ''.join(['(', measurement_type, '.*?)', '(?=\d{2}-\d{2}-\d{4})'])
                    for value_ in findall(pattern3, file_1):
                        value_ = sub(''.join(['(.*)(', measurement_name, ')', '(\d.\d*)']), r'\3\2\1', value_)
                        value_ = sub(''.join(['(', measurement_name, '|', measurement_type, ').*']), '', value_)
                        value_ = re.sub('[^0-9.]|х10|x10', '', value_)

                        if value_:
                            value.append(value_)
                        else:
                            value.append('NA')

        data_dct = {'person_id': patient_id, 'measurement_concept_id': measurement_concept_id,
                    'measurement_date': measurement_date, 'value': value}

        df = pd.DataFrame.from_dict(data_dct, orient='index')

        df = df.transpose()
        df['measurement_id'] = df.index + 1
        df = df[df.measurement_date != '']
        df = df[df.value != 'NA']
        df['measurement_date'] = pd.to_datetime(df.measurement_date)

        return df

    def treatment_detection(
            self,
            list_of_epicrisis,
            patient_ids,
            treatment_map,
            drug_date=[],
            drug_concept_id=[],
            patient_id=[]
    ):
        for drug_name, sub_dct in treatment_map.items():
            for variations, drug_id in sub_dct.items():
                for file_, patient_id_ in zip(list_of_epicrisis, patient_ids):
                    file_ = sub(variations, drug_name, file_)
                    if drug_name in file_:
                        drug_date.append(findall('\d{2}-\d{2}-\d{4}', file_)[-1])
                        drug_concept_id.append(drug_id)
                        patient_id.append(patient_id_)
            data_dct = {'person_id': patient_id, 'drug_concept_id': drug_concept_id,
                        'drug_date': drug_date}
        df = pd.DataFrame(data_dct)
        df['drug_id'] = df.index + 1
        df['drug_date'] = pd.to_datetime(df.drug_date)
        return df

    def condition_detection(
            self,
            list_of_epicrisis,
            patient_ids,
            condition_map,
            condition_date=[],
            condition_concept_id=[],
            patient_id=[]
    ):
        for concept_id, sub_dct in condition_map.items():
            if concept_id < 6:
                for condition, variations in sub_dct.items():
                    for file_, patient_id_ in zip(list_of_epicrisis, patient_ids):
                        file_ = sub(variations, condition, file_)
                        if condition in file_:
                            condition_date.append(findall('\d{2}-\d{2}-\d{4}', file_)[-1])
                            condition_concept_id.append(concept_id)
                            patient_id.append(patient_id_)
            data_dct = {'person_id': patient_id, 'condition_concept_id': condition_concept_id,
                        'condition_date': condition_date}
        df = pd.DataFrame(data_dct)
        df['condition_id'] = df.index + 1
        df['condition_date'] = pd.to_datetime(df.condition_date)
        return (df)

    def procedures_detection(
            self,
            list_of_epicrisis,
            patient_ids,
            procedure_map,
            procedure_date=[],
            procedure_concept_id=[],
            patient_id=[]
    ):
        for concept_id, sub_dct in procedure_map.items():
            if concept_id > 6:
                for procedure, variations in sub_dct.items():
                    for file_, patient_id_ in zip(list_of_epicrisis, patient_ids):
                        file_ = sub(variations, procedure, file_)
                        if procedure in file_:
                            procedure_date.append(findall('\d{2}-\d{2}-\d{4}', file_)[-1])
                            procedure_concept_id.append(concept_id)
                            patient_id.append(patient_id_)
            data_dct = {'person_id': patient_id, 'procedure_concept_id': procedure_concept_id,
                        'procedure_date': procedure_date}
        df = pd.DataFrame(data_dct)
        df['procedure_id'] = df.index + 1
        df['procedure_date'] = pd.to_datetime(df.procedure_date)
        return df




# Пример использования класса
epic_pars = EpicPars()
# Например, для вызова функции epi_dates_preparation:
date_prepared = epic_pars.epi_dates_preparation('01.01.2020')
print(date_prepared)