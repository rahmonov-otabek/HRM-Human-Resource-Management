create or replace PACKAGE employee_statistics_pkg AS
     PROCEDURE get_employee_statistics;
     PROCEDURE group_employees_by_department;
END employee_statistics_pkg;
/
create or replace PACKAGE BODY employee_statistics_pkg AS
    PROCEDURE get_employee_statistics IS
        v_total_employees NUMBER; 
        v_average_age NUMBER;
        v_department_count NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_total_employees
        FROM employees WHERE status='Active';

        SELECT FLOOR(AVG(FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12))) INTO v_average_age
        FROM employees;

        SELECT COUNT(DISTINCT department_id) INTO v_department_count
        FROM employees;

        DBMS_OUTPUT.PUT_LINE('Umumiy xodimlar soni: ' || v_total_employees); 
        DBMS_OUTPUT.PUT_LINE('O`rtacha yosh: ' || v_average_age);
        DBMS_OUTPUT.PUT_LINE('Bo`limlar soni: ' || v_department_count); 
    END get_employee_statistics;

    PROCEDURE group_employees_by_department IS
        CURSOR dept_cursor IS
            SELECT department_id, COUNT(*) AS employee_count
            FROM employees
            GROUP BY department_id;

        v_department_name VARCHAR2(100);
        v_employee_count NUMBER;
    BEGIN
        FOR dept_record IN dept_cursor LOOP
            SELECT department_name INTO v_department_name
            FROM departments
            WHERE department_id = dept_record.department_id;

            v_employee_count := dept_record.employee_count;

            DBMS_OUTPUT.PUT_LINE('Bo''lim: ' || v_department_name || ' | Xodimlar soni: ' || v_employee_count);
        END LOOP;
    END group_employees_by_department;

END employee_statistics_pkg;