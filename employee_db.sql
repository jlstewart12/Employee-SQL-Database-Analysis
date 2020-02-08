CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar (42)   NOT NULL,
    "last_name" varchar (42)  NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" int   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM dept_emp;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM dept_emp;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * from employees;

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

SELECT first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1986-12-31';

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN employees 
ON  dept_manager.emp_no = employees.emp_no
JOIN departments 
ON departments.dept_no = dept_manager.dept_no;

CREATE VIEW emp_group AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
ORDER BY emp_no ASC;

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM emp_group
WHERE dept_name = 'Sales';

SELECT * FROM emp_group
WHERE dept_name = 'Sales' OR dept_name = 'Development';

SELECT last_name, COUNT(last_name) AS "Name Count"
FROM employees
GROUP BY last_name
ORDER BY last_name;
