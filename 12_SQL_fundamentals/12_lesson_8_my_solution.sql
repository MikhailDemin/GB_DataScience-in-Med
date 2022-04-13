-- 12_lesson_8_my_solution

/*
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”.
Работаем с БД vk и данными, которые вы сгенерировали ранее: 
!!!Задачи необходимо решить с использованием объединения таблиц (JOIN)
*/

/*
1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался
с выбранным пользователем (написал ему сообщений).
 */
-- **************************************************************************************************************

SELECT
	u1.firstname, 
	u1.lastname,
	m.from_user_id,
	CONCAT(u2.firstname, ' ', u2.lastname) AS most_frequent_contact,
	COUNT(m.id) AS message_count
FROM messages m
JOIN users u1 ON u1.id = m.to_user_id
JOIN users u2 ON u2.id = m.from_user_id
WHERE m.to_user_id = 12
GROUP BY m.from_user_id
ORDER BY message_count DESC
LIMIT 1
;


/*
|firstname|lastname|from_user_id|most_frequent_contact|message_count|
|---------|--------|------------|---------------------|-------------|
|Jordon   |Rath    |29          |Gisselle Pagac       |2            |

 */

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
-- **************************************************************************************************************

SELECT COUNT(l.id) AS total_likes_to_kids
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
WHERE p.age < 10
;

/*
|total_likes_to_kids|
|-------------------|
|11                 |

 */
 
-- 3.	Определить кто больше поставил лайков (всего): мужчины или женщины.
-- **************************************************************************************************************

SELECT p.gender, COUNT(l.id) AS total_likes
FROM likes l
JOIN profiles p ON l.user_id = p.user_id
GROUP BY gender -- DESC
-- ORDER BY MAX(total_likes) DESC
-- LIMIT 1
;

/*
|gender|total_likes|
|------|-----------|
|m     |37         |
|f     |13         |

 */

/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов・Преподаватель
*/