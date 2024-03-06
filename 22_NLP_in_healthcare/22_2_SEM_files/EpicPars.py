import warnings
warnings.filterwarnings("ignore")
import re
from re import sub, findall
import pandas as pd
from datetime import datetime
import numpy as np


class EpicPars:
    """Класс EpicPars предназначен для анализа и обработки данных медицинского эпикриза, облегчая извлечение, очистку
     и структурирование ключевой информации в удобный формат для анализа или вставки в базу данных. Далее
      описываются функциональные возможности, предоставляемые классом, и назначение каждого метода."""

    def __init__(self):
        pass

    def epi_dates_preparation(self, strng):
        """Метод преобразует даты внутри строки из формата «ДД.ММ.ГГГГ» или «ДД.ММ.ГГ» в «ДД-ММ-ГГГГ»,
        стандартизируя представление даты.
        Принимает параметры:
            :param strng: строка, содержащая даты, которые необходимо преобразовать.
        Возвращает:
            :return: Измененная строка со всеми датами в формате `ДД-ММ-ГГГГ`."""
        data_1 = re.sub(r'(0?[1-9]|[12]\d|30|31)[.](0?[1-9]|1[0-2])[.](\d{4})',
                        '\\1-\\2-\\3', strng)
        return re.sub(r'(0?[1-9]|[12]\d|30|31)[.](0?[1-9]|1[0-2])[.](\d{2})',
                      '\\1-\\2-20\\3', data_1)

    def get_gender(self, file_):
        """Метод кодирует пол пациента извлекая из текстового файла строковый признак пола.
         Принимает параметры:
             :param file_: предварительно обработанный текстовый файл эпикриза
         Возвращает:
             :return: Целочисленный код, обозначающий пол (25 для женщин, 26 для мужчин)."""
        file_ = re.sub('диагноз.*', '', file_)
        if 'вна' in file_:
            return 25
        else:
            return 26

    def remover(self, file_):
        """Метод убирает из текста эпикриза, либо заменяет некоторые элементы. В результате работы метода текст
        приводится к единому формату для облегчения дальнейшей обработки и анализа.
         Принимает параметры:
             :param file_: текстовый файл эпикриза подлежащий очистке
         Возвращает:
             :return: Очищенный текст."""
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
        """
        Метод извлекает из эпикризов информацию о пациентах (ИД пациента, дата рождения, пол,
        время проведенное в стационаре) и помещает её в pandas DataFrame.
        Принимает параметры:
            :param gender_list: список признака пола пациентов
            :param list_of_epi: список эпикризов, в которых содержится информация о пациентах
            :param patient_ids: список идентификаторов пациентов
            :param hospital_days: список времени нахождения в стационаре (создается внутри метода)
            :param date_of_birth: список с датами рождения пациента (создается внутри метода)
        Возвращает:
            :return: pandas DataFrame с информацией о пациентах"""
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
        """
        Метод извлекает из эпикризов информацию о различных измерениях (ИД пациента, ИД концепта (типа) измерения,
        дату измерения, значение измерения) и помещает её в pandas DataFrame.
        Принимает параметры:
            :param list_of_epicrisis: список эпикризов
            :param patient_ids: список идентификаторов пациентов
            :param measurements_map: словарь, сопоставляющий типы измерений с их идентификаторами
            :param measurement_id: список хранения идентификаторов измерений
            :param measurement_date: список хранения дат измерений
            :param measurement_concept_id: список хранения идентификаторов типов (концептов) измерений
            :param patient_id: список хранения идентификаторов пациентов (создается внутри метода)
            :param value: список хранения значений измерений
        Возвращает:
            :return: pandas DataFrame с информацией об измерениях"""
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
        """
        Метод извлекает из эпикризов информацию о назначенных лекарствах (ИД пациента, ИД концепта (типа) препарата,
        дату назначения препарата) и помещает её в pandas DataFrame.
        Принимает параметры:
            :param list_of_epicrisis: список эпикризов
            :param patient_ids: список идентификаторов пациентов
            :param treatment_map: словарь, сопоставляющий название лекарств с их идентификаторами
            :param drug_date: список хранения дат назначений лекарств
            :param drug_concept_id: список хранения идентификаторов типов (концептов) лекарств
            :param patient_id: список хранения идентификаторов пациентов (создается внутри метода)
        Возвращает:
            :return: pandas DataFrame с информацией о назначенных лекарствах"""
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
        """
        Метод извлекает из эпикризов информацию о состояниях пациентов (ИД пациента, ИД концепта (типа) состояния,
        дату состояния) и помещает её в pandas DataFrame.
        Принимает параметры:
            :param list_of_epicrisis: список эпикризов
            :param patient_ids: список идентификаторов пациентов
            :param condition_map: словарь, сопоставляющий название состояний с их идентификаторами
            :param condition_date: список хранения дат состояний
            :param condition_concept_id: список хранения идентификаторов типов (концептов) состояний
            :param patient_id: список хранения идентификаторов пациентов (создается внутри метода)
       Возвращает:
            :return: pandas DataFrame с информацией о состояниях пациентов"""
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
        return df

    def procedures_detection(
            self,
            list_of_epicrisis,
            patient_ids,
            procedure_map,
            procedure_date=[],
            procedure_concept_id=[],
            patient_id=[]
            ):
        """
        Метод извлекает из эпикризов информацию о проведенных медицинских процедурах (ИД пациента, ИД концепта (типа)
        процедуры, дату процедуры) и помещает её в pandas DataFrame.
            :param list_of_epicrisis: список эпикризов
            :param patient_ids: список идентификаторов пациентов
            :param procedure_map: словарь, сопоставляющий название процедур с их идентификаторами
            :param procedure_date: список хранения дат процедур
            :param procedure_concept_id: список хранения идентификаторов типов (концептов) процедур
            :param patient_id: список хранения идентификаторов пациентов (создается внутри метода)
       Возвращает:
            :return: pandas DataFrame с информацией о проведенных медицинских процедурах"""
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