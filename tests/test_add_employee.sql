SET SERVEROUTPUT ON;
 
BEGIN
    employee_managemant_pkg.add_employee(
        p_first_name => 'Otabek',
        p_last_name => 'Rahmonov',
        p_birth_date => TO_DATE('2002-01-15', 'YYYY-MM-DD'),
        p_hire_date => TO_DATE('2024-11-27', 'YYYY-MM-DD'),
        p_position_id => 1,
        p_department_id => 1,
        p_phone => '+998901111111',
        p_email => 'test@example.com',
        p_address => 'Tashkent',
        p_salary => 1500,
        p_status => 'Active'
    );
END;
/
 
SELECT * FROM employees WHERE email = 'test@example.com';
