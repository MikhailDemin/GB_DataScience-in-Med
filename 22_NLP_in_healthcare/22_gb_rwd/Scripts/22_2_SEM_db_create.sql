CREATE schema gb_rwd;

CREATE TABLE gb_rwd.person (
  person_id int, -- первичный ключ
  date_of_birth date,
  sex_concept_id int, -- вторичный ключ
  hospital_days int
);

CREATE TABLE gb_rwd.measurement (
  measurement_id int, -- первичный ключ
  measurement_concept_id int, -- вторичный ключ
  measurement_date date,
  value float,
  person_id int -- вторичный ключ
);

CREATE TABLE gb_rwd.vocabulary (
  concept_id int, -- первичный ключ
  concept_name varchar(255),
  domain varchar(150),
  code varchar(150)
);

CREATE TABLE gb_rwd.condition (
  condition_id int, -- первичный ключ
  condition_concept_id int, -- вторичный ключ
    condition_date date,
  person_id int -- вторичный ключ
);

CREATE TABLE gb_rwd.drug (
  drug_id int, -- первичный ключ
  drug_concept_id int, -- вторичный ключ
  drug_date date,
  person_id int -- вторичный ключ
);

CREATE TABLE gb_rwd.procedure (
  procedure_id int, -- первичный ключ
  procedure_concept_id int, -- вторичный ключ
  procedure_date date,
  person_id int -- вторичный ключ
);