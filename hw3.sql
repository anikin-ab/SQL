USE lesson3;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT * FROM staff;
SELECT * FROM activity_staff;
/*
Условие:
1. Выведите id сотрудников, которые напечатали более 500 страниц за всех дни
2. Выведите дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, 
которые работали в выбранные дни.
3. Выведите среднюю заработную плату по должностям, которая составляет более 30000
4. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
5.Выведите 5 максимальных заработных плат (salary)
6.Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
7.Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
8. Найдите количество специальностей
9. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

По таблице "staff" 3 семинар
*/

-- 1
SELECT staff_id, sum(count_pages) as total_page
FROM activity_staff
GROUP BY staff_id
HAVING total_page > 500;

-- 2
SELECT date_activity, count(DISTINCT(staff_id)) as day_count
FROM activity_staff
GROUP BY date_activity
HAVING day_count > 3;

-- 3
SELECT post, ROUND(AVG(salary),2) as mean_salary
FROM staff
GROUP BY post
HAVING mean_salary > 30000;

-- 4
SELECT salary 
FROM staff 
ORDER BY salary ASC;
-- ORDER BY salary DESC;

-- 5
SELECT salary 
FROM staff 
ORDER BY salary DESC
LIMIT 5;

-- 6
SELECT post, sum(salary) sum_salary
FROM staff
GROUP BY post;

-- 7
SELECT count(post), post
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 and 49;

-- 8
SELECT count(DISTINCT(post)) post_count
FROM staff;

-- 9
SELECT AVG(age) mean_age, post
FROM staff
GROUP BY post
HAVING mean_age < 30;
