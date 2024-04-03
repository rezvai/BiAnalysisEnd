update jobs set name = lower(name) --- Преобразуем поле nam  к нижнему регистру

update jobs set description  = lower(description) --- Преобразуем поле description к нижнему регистру

update jobs set region_name = lower(region_name) --- Преобразуем поле region_name к нижнему регистру

update jobs set employer = lower(employer) --- Преобразуем поле employer к нижнему регистру

update jobs set main_skills = lower(main_skills) --- Преобразуем поле main_skills к нижнему регистру

update jobs set work_schedule = lower(work_schedule) --- Преобразуем поле work_schedule к нижнему регистру

update jobs set publication_date  = trim(publication_date, '+0700 07') --- Удаляем не нужные элементы из каждого поля publication_date, для дальнейшего преобразования

update jobs set work_experience  = '0' where work_experience ='6-' --- Заменяем начения на 0, в строчках, где появилось значение 6-, вероятно ошибка при импорте

select count(case when nullif(name, '') is null then 1 end) as empty,
       count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля name до обработки

select count(case when nullif(description , '') is null then 1 end) as empty,
       count(case when nullif(description, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля description до обработки

select count(case when nullif(salary, 0) is null then 1 end) as empty,
       count(case when nullif(salary, 0) is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля salary до обработки

select count(case when nullif(publication_date, null) is null then 1 end) as empty,
       count(case when nullif(publication_date, null) is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля publication_date до обработки

select count(case when nullif(region_name, '') is null then 1 end) as empty,
       count(case when nullif(region_name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля region_name до обработки

select count(case when nullif(employer, '') is null then 1 end) as empty,
       count(case when nullif(employer, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля employer до обработки

select count(case when nullif(main_skills, '') is null then 1 end) as empty,
       count(case when nullif(main_skills, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля main_skills до обработки

select count(case when nullif(work_experience, '') is null then 1 end) as empty,
       count(case when nullif(work_experience, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля work_experience о обработки

select count(case when nullif(work_schedule, '') is null then 1 end) as empty,
       count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для work_schedule name до обработки

delete from jobs where salary = 0 --Удаление строк, где указан 0 в поле salary

select count(case when nullif(name, '') is null then 1 end) as empty,
       count(case when nullif(name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля name после обработки

select count(case when nullif(description , '') is null then 1 end) as empty,
       count(case when nullif(description, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля description до обработки

select count(case when nullif(salary, 0) is null then 1 end) as empty,
       count(case when nullif(salary, 0) is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля salary до обработки

select count(case when nullif(publication_date, null) is null then 1 end) as empty,
       count(case when nullif(publication_date, null) is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля publication_date до обработки

select count(case when nullif(region_name, '') is null then 1 end) as empty,
       count(case when nullif(region_name, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля region_name до обработки

select count(case when nullif(employer, '') is null then 1 end) as empty,
       count(case when nullif(employer, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля employer до обработки

select count(case when nullif(main_skills, '') is null then 1 end) as empty,
       count(case when nullif(main_skills, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля main_skills до обработки

select count(case when nullif(work_experience, '') is null then 1 end) as empty,
       count(case when nullif(work_experience, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для поля work_experience о обработки

select count(case when nullif(work_schedule, '') is null then 1 end) as empty,
       count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty
from jobs j --- Выводим результаты пустых значений для work_schedule name до обработки

select length(name) / (select avg(length(name)) from jobs) as name_analysis,
	   length(description) / (select avg(length(description)) from jobs) as description_analysis,
	   length(region_name) / (select avg(length(region_name)) from jobs) as regionname_analysis,
	   salary / (select avg(salary) from jobs) as salary_analysis
from jobs j limit 10 --- Анализ значимых атрибутов

select id,
	   name,
	   description,
	   salary,
	   publication_date,
	   region_name,
	   employer, 
	   main_skills,
	   work_experience,
	   work_schedule
from jobs j 
order by id --- Выводим получившиесю БД и сортируем по первичному ключу