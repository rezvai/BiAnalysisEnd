update jobs set name = lower(name) --- Приводим все поле name к нижнему регистру

update jobs set description  = lower(description) --- Приводим все поле description к нижнему регистру

update jobs set region_name = lower(region_name) --- Приводим все поле region_name к нижнему регистру

update jobs set employer = lower(employer) --- Приводим все поле employer к нижнему регистру

update jobs set main_skills = lower(main_skills) --- Приводим все поле main_skills к нижнему регистру

update jobs set work_schedule = lower(work_schedule) --- Приводим все поле work_schedule к нижнему регистру

update jobs set publication_date = trim(publication_date, '+0700 07') --- Удаляем не нужные символы из поля publication_date, для преобразования к другому формату

update jobs set work_experience = 0 where work_experience = '6-' --- Во время импорта данных произошла ошибка, "0" стал "6-", возвращаем прошлые значения

select count(case when nullif(name, '') is null then 1 end) as empty, count(case when nullif(name, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля name 

select count(case when nullif(description , '') is null then 1 end) as empty, count(case when nullif(description, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля description

select count(case when nullif(salary, 0) is null then 1 end) as empty, count(case when nullif(salary, 0) is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля salary

select count(case when nullif(publication_date, null) is null then 1 end) as empty, count(case when nullif(publication_date, null) is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля publication_date

select count(case when nullif(region_name, '') is null then 1 end) as empty, count(case when nullif(region_name, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля region_name

select count(case when nullif(employer, '') is null then 1 end) as empty, count(case when nullif(employer, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля employer

select count(case when nullif(main_skills, '') is null then 1 end) as empty, count(case when nullif(main_skills, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля main_skills

select count(case when nullif(work_experience, '') is null then 1 end) as empty, count(case when nullif(work_experience, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля work_experience

select count(case when nullif(work_schedule, '') is null then 1 end) as empty, count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля work_schedule

delete from jobs where salary = 0 --- Удаляем строки с пропущенными значениями в поле salary

select count(case when nullif(name, '') is null then 1 end) as empty, count(case when nullif(name, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля name 

select count(case when nullif(description , '') is null then 1 end) as empty, count(case when nullif(description, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля description

select count(case when nullif(salary, 0) is null then 1 end) as empty, count(case when nullif(salary, 0) is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля salary

select count(case when nullif(publication_date, null) is null then 1 end) as empty, count(case when nullif(publication_date, null) is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля publication_date

select count(case when nullif(region_name, '') is null then 1 end) as empty, count(case when nullif(region_name, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля region_name

select count(case when nullif(employer, '') is null then 1 end) as empty, count(case when nullif(employer, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля employer

select count(case when nullif(main_skills, '') is null then 1 end) as empty, count(case when nullif(main_skills, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля main_skills

select count(case when nullif(work_experience, '') is null then 1 end) as empty, count(case when nullif(work_experience, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля work_experience

select count(case when nullif(work_schedule, '') is null then 1 end) as empty, count(case when nullif(work_schedule, '') is not null then 1 end) as not_empty from jobs --- выводим информацию о пропущенных значениях из поля work_schedule

select length(name) / (select avg(length(name)) from jobs) as name_analysis,
	   length(description) / (select avg(length(description)) from jobs) as description_analysis,
	   salary / (select avg(salary) from jobs) as salary_analysis
from jobs limit 10 --- Выполняем анализ, выводя соотношение среднего к определенному значению в стобце

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
order by id --- Выводим всю таблицу





