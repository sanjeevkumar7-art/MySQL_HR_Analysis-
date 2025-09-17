-- gender breakdown in company

select gender, count(*) as count from hr
where age>=18 and termdate=0000-00-00
group by gender;

-- race of the company
select race , count(*) as count from hr
where age>=18 and termdate=0000-00-00
group by race
order by count(*) desc;

-- age distribution

select 
min(age) as youngest,
max(age) as oldest
from hr
where age>=18 and termdate=0000-00-00;

select 
    case
    when age>=18 and age<=24 then '18-24'
    when age>=25 and age<=34 then '25-34'
    when age>=35 and age<=44 then '35-44'
    when age>=45 and age<=54 then '45-54'
    when age>=55 and age<=64 then '55-64'
    else '65+'
    end as age_group,gender
    , count(*)as count
    from hr 
    where age>=18 and termdate=0000-00-00
    group by age_group,gender
    order by age_group,gender;
    
    -- location = remote vs onsite
    
    select location , count(*) as count 
    from hr
    where age>=18 and termdate=0000-00-00
    group by location;
    
    -- what is the avg len of employment for the employee who have been terminated
    
    select round(avg(datediff(termdate,hire_date))/365,0)as Avg_len_employment
    from hr
    where termdate<=curdate() and termdate<>0000-00-00 and age>=18;
    
    -- gender distribution variuos across dep
    
    select gender,department,count(*) as count from hr
    where age>=18 and termdate=0000-00-00
    group by department,gender
    order by department;
    
-- distribution across jobtitle
    
    select jobtitle,count(*) as count from hr
    where age>=18 and termdate=0000-00-00
    group by jobtitle
    order by jobtitle desc;
    
-- which department has the highest turnover 
    
    select department,total_count,terminated_count,
    total_count/terminated_count as terminated_rate
    from (
          select department,count(*) as total_count,
          sum(case when termdate <> 0000-00-00 and termdate<=curdate() then 1 else 0 end) as terminated_count
          from hr
          where age>=18
          group by department
          ) as subquery
     order by terminated_rate desc;   
     
    -- distribution across states and city
    
       select location_state,count(*) as count from hr
       where age>=18 and termdate=0000-00-00
       group by location_state
       order by count desc; 
     
     -- emp count based on hire and term dates
     
       select 
           year,
           hires,
           term,
           hires-term as net_change,
           round(((hires-term)/hires)*100,2) as net_change_percentage
       from(
            select year(hire_date) as year,
            count(*) as hires,
            sum(case when termdate <> 0000-00-00 and termdate<=curdate() then 1 else 0 end) as term
            from hr
            where age>=18
            group by year(hire_date)
            ) as sq
            order by year asc;
            
       -- average tenure
        
        select department,round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
        from hr
        where termdate<=curdate() and termdate<>0000-00-00 and age>=18
        group by department;
        
        
            
           