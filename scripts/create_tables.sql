CREATE TABLE positions(
    position_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    position_name VARCHAR2(100) NOT NULL,
    salary NUMBER(10, 2) NOT NULL,
    description VARCHAR2(255)
); 
--DROP TABLE positions;

CREATE TABLE departments(
    department_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR2(100),
    description VARCHAR2(255)
);
--DROP TABLE departments;

CREATE TABLE department_positions (
    department_id NUMBER NOT NULL,
    position_id NUMBER NOT NULL,
    PRIMARY KEY (department_id, position_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);
--DROP TABLE department_positions;

CREATE TABLE employees (
    employee_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    position_id NUMBER,
    department_id NUMBER,
    phone VARCHAR2(20),
    email VARCHAR2(100) UNIQUE,
    address VARCHAR2(200),
    salary NUMBER(10, 2),
    status VARCHAR2(20),
    CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES positions(position_id),
    CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(department_id)  
);
--DROP TABLE employees;

CREATE TABLE leave_requests (
    leave_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    leave_type VARCHAR2(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'Pending',
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
--DROP TABLE leave_requests;

CREATE TABLE salaries(
    salary_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    month NUMBER(2) CHECK (month BETWEEN 1 AND 12),
    year NUMBER(4) CHECK (year >= 2000 AND year <= 2100),
    amount NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_employee_salary_id FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
--DROP TABLE salaries;

CREATE TABLE salary_history(
    history_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    old_salary NUMBER(10, 2),
    new_salary NUMBER(10, 2) NOT NULL,
    change_date DATE NOT NULL,
    CONSTRAINT fk_employee_history_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
--DROP TABLE salary_history;

CREATE TABLE bonuses(
    bonus_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    bonus_date DATE NOT NULL,
    amount NUMBER(10, 2) NOT NULL,
    reason VARCHAR2(255),
    CONSTRAINT fk_employee_bonus_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
--DROP TABLE bonuses;
