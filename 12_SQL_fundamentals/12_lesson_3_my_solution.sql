-- 12_lesson_3_my_solution
-- в таблице медиа это контент который генерят сами пользователи,
-- а здесь будут ссылки на сторонние ресурсы и медиа
DROP TABLE IF EXISTS links;
CREATE TABLE links (
	id SERIAL
);


-- таблица компаний, которые представлены в соц сети, а также пользователи сети могут быть
-- сотрудниками этих кампаний
DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	id SERIAL,
	created_at DATETIME DEFAULT NOW(),
	company_site BIGINT UNSIGNED NOT NULL,
	employee_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (employee_id) REFERENCES users(id),
	FOREIGN KEY (company_site) REFERENCES links(id)
);

ALTER TABLE profiles ADD COLUMN employee_of_company BIGINT UNSIGNED NOT NULL;
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_company_id
FOREIGN KEY (employee_of_company) REFERENCES companies(id)
;

ALTER TABLE links
ADD COLUMN media_id BIGINT UNSIGNED NOT NULL,
ADD COLUMN user_id BIGINT UNSIGNED NOT NULL,
ADD COLUMN body VARCHAR(255),
ADD COLUMN name VARCHAR(255),
ADD COLUMN created_at DATETIME DEFAULT NOW(),
ADD COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
ADD CONSTRAINT fk_links_media_id FOREIGN KEY (media_id) REFERENCES media(id),
ADD CONSTRAINT fk_links_user_id FOREIGN KEY (user_id) REFERENCES users(id)
;

-- таблица звонков пользователей
DROP TABLE IF EXISTS calls;
CREATE TABLE calls (
	id SERIAL,
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	finished_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id), 
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

/* Комментарии преподавателя:
Кирилл Иванов・Преподаватель
Для индексов, так же, как и для внешних ключей можно (но не обязательно) задавать имена при их определении.
Правильно, что используете механизм установки значения полей по умолчанию (DEFAULT).
Правильно, что используете механизм автообновления значения поля при операции UPDATE.
*/
