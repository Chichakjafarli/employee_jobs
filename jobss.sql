SELECT * FROM public.employees1;
SELECT * FROM public.jobs2;
SELECT * FROM public.employees1 as e JOIN public.jobs2 as j ON e.job_id = j.job_id;
select  e.first_name,e.last_name,min(e.salary),j.min_salary,j.max_salary,e.job_id,j.job_title
from public.employees1 as e
JOIN public.jobs2 as j ON e.job_id = j.job_id group by e.first_name,e.last_name,j.min_salary,j.max_salary,e.job_id,j.job_title;
select min(e.salary),
j.job_title,
e.job_id from public.employees1 as e JOIN public.jobs2 as j ON e.job_id = j.job_id
group by e.job_id,j.job_title order by e.job_id 
select max(e.salary),
j.job_title,
e.job_id from public.employees1 as e JOIN public.jobs2 as j ON e.job_id = j.job_id
group by e.job_id,j.job_title order by e.job_id 
select avg(e.salary),
j.job_title,
e.job_id from public.employees1 as e JOIN public.jobs2 as j ON e.job_id = j.job_id
group by e.job_id,j.job_title order by e.job_id 