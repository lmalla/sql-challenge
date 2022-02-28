select * from department;
select * from dept_emp;
select * from dept_manager;
select * from employees limit 10;
select * from salaries;
select * from titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.

select x.emp_no, x.last_name, x.first_name, x.sex, y.salary 
from employees x inner join salaries y on x.emp_no = y.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name,  hire_date
from employees where EXTRACT(YEAR FROM (hire_date)) = 1986;

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

select x.dept_no, x.dept_name, z.emp_no as "manager employee number" , y.last_name, y.first_name
from department x inner join dept_manager z on x.dept_no = z.dept_no 
inner join employees y on z.emp_no = y.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select x.emp_no, x.last_name, x.first_name, y.dept_name 
from dept_emp z inner join department y on z.dept_no = z.dept_no
inner join employees x on x.emp_no = z.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--select distinct(dept_name) from department;

select distinct(x.emp_no), x.last_name, x.first_name, y.dept_name 
from dept_emp z inner join department y on z.dept_no = z.dept_no
inner join employees x on x.emp_no = z.emp_no and y.dept_name = 'Sales'; 

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select distinct(x.emp_no), x.last_name, x.first_name, y.dept_name 
from dept_emp z inner join department y on z.dept_no = z.dept_no
inner join employees x on x.emp_no = z.emp_no and y.dept_name in ('Sales','Development') ; 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--select * from employees limit 20;

select last_name, count(*) from employees group by last_name order by count(*) desc;



