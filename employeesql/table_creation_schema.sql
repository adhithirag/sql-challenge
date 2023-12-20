-- Create the 6 tables from the CSV files 
create table departments(
	constraint pk_departments primary key(dept_no),	
	dept_no varchar not null,
	dept_name varchar not null
);

create table dept_emp(
		emp_no int not null,
		dept_no varchar not null
);
		
create table department_manager(
		dept_no varchar not null,
 		emp_no int not null
);		

--select * from departments	
--select * from dept_emp
--select * from department_manager
--select * from employee

create table employee (
    constraint pk_employee primary key(emp_no),
	emp_no int not null,
    emp_title varchar not null,
    birth_date varchar not null,
    first_name varchar not null,
    last_name varchar not null,
    sex varchar not null,
    hire_date varchar not null    
);

create table salaries (
    emp_no int not null,
    salary int not null
);

create table titles (
    constraint pk_titles primary key("title_id"),
	title_id varchar not null,
    title varchar not null    
);

--select * from salaries
--select * from titles

-- for every employee in the emp_no column of the employee table,
-- there are multiple departments that the employee can be in in the dept_emp table
alter table dept_emp 
add constraint fk_dept_emp_emp_no foreign key(emp_no)
references employee (emp_no);

-- the dept_no column in dept_emp is referencing the dept_no in the departments table
alter table dept_emp
add constraint fk_dept_emp_dept_no foreign key(dept_no)
references departments (dept_no);

-- the dept_no in department_manager is referencing dept_no in departments
alter table department_manager
add constraint fk_department_manager_dept_no foreign key(dept_no)
references departments (dept_no);

alter table department_manager
add constraint fk_department_manager_emp_no foreign key(emp_no)
references employee (emp_no);

alter table employee
add constraint fk_employee_emp_title foreign key(emp_title)
references titles (title_id);

alter table salaries
add constraint fk_salaries_emp_no foreign key(emp_no)
references employee (emp_no);

