SET SERVEROUTPUT ON; 

BEGIN
    employee_managemant_pkg.edit_employee(
        p_id => 1,
        p_first_name => 'Alisher',
        p_last_name => NULL,  
        p_birth_date => NULL,
        p_hire_date => NULL,
        p_position_id => 2,
        p_department_id => NULL,
        p_phone => '+998907654321',
        p_email => NULL,
        p_address => 'Tashkent, Uzbekistan',
        p_salary => 2500,
        p_status => 'Active'
    );
END;
/

SELECT * FROM employees WHERE employee_id = 1;
