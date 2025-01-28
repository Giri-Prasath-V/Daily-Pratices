create or replace procedure abc()
language plpgsql
as $$
begin
	insert into employee (NAME, AGE, GENDER, SALARY, DESIGNATION, MRG_ID, EMAIL_ID, MARRIED)
values
('Riya', 25, 'FEMALE', 100000, 'MANAGER', null, 'riya@xyz.com', FALSE);
end;
$$

call abc();

create or replace procedure insert_emp_record(
e_name varchar(20),
e_age int,
e_gender varchar(10),
e_salary int,
e_designation varchar(10),
e_mrg_id int,
e_email_id varchar(20),
e_married boolean
)
language plpgsql
as $$
begin
	insert into employee (NAME, AGE, GENDER, SALARY, DESIGNATION, MRG_ID, EMAIL_ID, MARRIED)
values
(e_name, e_age, e_gender, e_salary, e_designation, e_mrg_id, e_email_id, e_married);
end;
$$

call insert_emp_record('Prasath',25,'MALE',100000,'PROGRAMMER',3,'prasath@xyz.com',FALSE);

create or replace procedure appraisal(
	id int,
	amount int
)
language plpgsql
as $$
begin
	update employee set salary=salary+amount where eid=id;
end;
$$

select * from employee;

call appraisal(1,2000);

create or replace function max_salary(desig varchar(20))
returns table (eid int,name varchar,salary decimal)
language plpgsql
as $$
begin
	return query
	select e.eid,e.name,e.salary from employee e where e.designation=desig
	and e.salary =(select max(e2.salary) from employee e2
	where e2.designation=desig);
end;
$$ 

drop function max_salary;

select * from max_salary('PROGRAMMER');

select name,salary,sum(salary) over(order by salary) from employee;

//find the employee whose salary is greater than average salary of his designation

SELECT e1.name,e1.salary,e1.designation
FROM employee e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.designation = e1.designation
);

