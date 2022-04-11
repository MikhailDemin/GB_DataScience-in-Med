-- 12_lesson_6_my_solution

/*
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”.
Работаем с БД vk и данными, которые вы сгенерировали ранее: 
 */

/*
1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался
с выбранным пользователем (написал ему сообщений).
 */
-- **************************************************************************************************************

-- ALTER TABLE messages ADD COLUMN is_read BIT DEFAULT FALSE;

SELECT
	from_user_id,
	CONCAT(
		(SELECT firstname
		FROM users
		WHERE id = messages.from_user_id),
		' ',
		(SELECT lastname
		FROM users
		WHERE id = messages.from_user_id) 
	) AS most_frequent_contact, 
	COUNT(id) AS message_count 
FROM messages 
WHERE to_user_id = 12
GROUP BY from_user_id
ORDER BY message_count DESC
LIMIT 1
;

/*
|from_user_id|most_frequent_contact|message_count|
|------------|---------------------|-------------|
|29          |Gisselle Pagac       |2            |

 */

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
-- **************************************************************************************************************

SELECT COUNT(*) AS total_likes_to_kids
FROM likes
WHERE user_id IN (
	SELECT user_id
	FROM profiles
	WHERE age < 10)
;

/*
|total_likes_to_kids|
|-------------------|
|11                 |

 */

-- Не знаю почему, но запрос с функцией TIMESTAMPDIFF возвращает на 2 лайка больше:
SELECT COUNT(*) AS likes
FROM likes
WHERE user_id IN (
	SELECT user_id
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10)
;

/*
|likes|
|-----|
|13   |

 */

SELECT * 
FROM likes 
WHERE user_id IN (
	SELECT user_id
	FROM profiles
	WHERE age < 10)
ORDER BY user_id
;

/*
|id |user_id|media_id|created_at         |
|---|-------|--------|-------------------|
|14 |13     |18      |2021-06-13 23:31:54|
|47 |13     |24      |2021-05-05 08:21:55|
|20 |21     |11      |2021-09-28 15:42:28|
|25 |21     |11      |2021-10-23 23:07:06|
|42 |21     |14      |2021-06-12 20:14:47|
|23 |22     |39      |2021-10-05 13:58:28|
|48 |22     |29      |2021-12-16 01:18:48|
|15 |25     |33      |2021-11-06 18:40:34|
|1  |29     |31      |2021-12-15 13:11:28|
|27 |29     |27      |2021-07-25 05:42:44|
|33 |29     |8       |2021-08-30 22:36:06|

 */

 
-- 3.	Определить кто больше поставил лайков (всего): мужчины или женщины.
-- **************************************************************************************************************

SELECT total_likes 
FROM (
	SELECT COUNT(*) AS total_likes
	FROM likes
	WHERE user_id IN (
		SELECT user_id
		FROM profiles
		WHERE gender = 'f')
	UNION ALL
	SELECT COUNT(*) AS total_likes
	FROM likes
	WHERE user_id IN (
		SELECT user_id
		FROM profiles
		WHERE gender = 'm')
) AS tbl
GROUP BY total_likes
ORDER BY MAX(total_likes) DESC
LIMIT 1
;

/*
|total_likes|
|-----------|
|37         |
 */

SELECT gender 
FROM (
	SELECT gender, COUNT((
		SELECT COUNT(*) 
		FROM likes 
		AS lik 
		WHERE lik.user_id = prof.user_id)) 
	AS total_likes 
	FROM profiles AS prof
	WHERE gender = 'm'
	GROUP BY gender
	UNION ALL
	SELECT gender, COUNT((
		SELECT COUNT(*) 
		FROM likes 
		AS lik 
		WHERE lik.user_id = prof.user_id)) 
	FROM profiles AS prof
	WHERE gender = 'f'
	GROUP BY gender
) AS tab
GROUP BY gender
ORDER BY MAX(total_likes) DESC
LIMIT 1
;

/*
|gender|
|------|
|m     |

 */

-- Как склеить эти два запроса, чтобы была колонка gender и количество не понял к сожалению.

/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов・Преподаватель
Хорошо, что научились использовать группировку, агрегирующие фунции, ограничения (LIMIT),
решение предполагало использование именно этих функций.
Хорошо, что попробовали альтернативные варианты решения. Не у многих хватает на это инициативы.
В решении можно было обойтись без фунции MAX(). В материалах к уроку 10 есть разбор этого ДЗ.
*/