create or replace PACKAGE employee_managemant_pkg AS 
    PROCEDURE add_employee(
        p_first_name IN VARCHAR2 DEFAULT NULL,
        p_last_name IN VARCHAR2 DEFAULT NULL,
        p_birth_date IN DATE DEFAULT NULL,
        p_hire_date IN DATE DEFAULT NULL,
        p_position_id IN NUMBER DEFAULT NULL,
        p_department_id IN NUMBER DEFAULT NULL,
        p_phone IN VARCHAR2 DEFAULT NULL,
        p_email IN VARCHAR2 DEFAULT NULL,
        p_address IN VARCHAR2 DEFAULT NULL,
        p_salary IN NUMBER DEFAULT 0,
        p_status IN VARCHAR2 DEFAULT 'Active' 
    );
    PROCEDURE edit_employee(
        p_id IN NUMBER,
        p_first_name IN VARCHAR2 DEFAULT NULL,
        p_last_name IN VARCHAR2 DEFAULT NULL,
        p_birth_date IN DATE DEFAULT NULL,
        p_hire_date IN DATE DEFAULT NULL,
        p_position_id IN NUMBER DEFAULT NULL,
        p_department_id IN NUMBER DEFAULT NULL,
        p_phone IN VARCHAR2 DEFAULT NULL,
        p_email IN VARCHAR2 DEFAULT NULL,
        p_address IN VARCHAR2 DEFAULT NULL,
        p_salary IN NUMBER DEFAULT 0,
        p_status IN VARCHAR2 DEFAULT 'Active' 
    );
    PROCEDURE get_employee_info_by_id(p_id IN NUMBER);
    PROCEDURE delete_employee(p_id IN NUMBER);
    PROCEDURE archive_employee(p_id IN NUMBER);
END employee_managemant_pkg;
/
create or replace PACKAGE BODY employee_managemant_pkg AS
    PROCEDURE add_employee(
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_birth_date IN DATE,
        p_hire_date IN DATE,
        p_position_id IN NUMBER,
        p_department_id IN NUMBER,
        p_phone IN VARCHAR2,
        p_email IN VARCHAR2,
        p_address IN VARCHAR2,
        p_salary IN NUMBER DEFAULT 0,
        p_status IN VARCHAR2 DEFAULT 'Active'
        ) IS
    BEGIN 
     DBMS_OUTPUT.PUT_LINE(p_first_name);
        IF p_first_name IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: First name kiritilmagan.');
            RETURN;
        END IF;
        IF p_last_name IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Last name kiritilmagan.');
            RETURN;
        END IF;
        IF p_birth_date IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Birth date kiritilmagan.');
            RETURN;
        END IF;
        IF p_hire_date IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Hire date kiritilmagan.');
            RETURN;
        END IF;

        INSERT INTO employees(first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status)
        VALUES(p_first_name, p_last_name, p_birth_date, p_hire_date, p_position_id, p_department_id, p_phone, p_email, p_address, p_salary, p_status);

        DBMS_OUTPUT.PUT_LINE('Xodim muvaffaqiyatli qo`shildi.');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 
    END add_employee; 

    PROCEDURE edit_employee(
        p_id IN NUMBER,
        p_first_name IN VARCHAR2,
        p_last_name IN VARCHAR2,
        p_birth_date IN DATE,
        p_hire_date IN DATE,
        p_position_id IN NUMBER,
        p_department_id IN NUMBER,
        p_phone IN VARCHAR2,
        p_email IN VARCHAR2,
        p_address IN VARCHAR2,
        p_salary IN NUMBER DEFAULT 0,
        p_status IN VARCHAR2 DEFAULT 'Active' 
    ) IS
    BEGIN 
        UPDATE employees
        SET  
            first_name = NVL(p_first_name, first_name),
            last_name = NVL(p_last_name, last_name),
            birth_date = NVL(p_birth_date, birth_date),
            hire_date = NVL(p_hire_date, hire_date),
            position_id = NVL(p_position_id, position_id),
            department_id = NVL(p_department_id, department_id),
            phone = NVL(p_phone, phone),
            email = NVL(p_email, email),
            address = NVL(p_address, address),
            salary = NVL(p_salary, salary),
            status = NVL(p_status, status)
        WHERE EMPLOYEE_ID = p_id;

        DBMS_OUTPUT.PUT_LINE('Xodim muvaffaqiyatli o`zgartirildi');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 

    END edit_employee;

    PROCEDURE get_employee_info_by_id(p_id IN NUMBER) IS
        v_first_name VARCHAR2(50);
        v_last_name VARCHAR2(50);
        v_birth_date DATE;
        v_hire_date DATE;
        v_position_id NUMBER;
        v_department_id NUMBER;
        v_phone VARCHAR2(20);
        v_email VARCHAR2(100);
        v_address VARCHAR2(200);
        v_salary NUMBER;
        v_status VARCHAR2(20);
        v_department_name VARCHAR2(100);
        v_position_name VARCHAR2(100);  
    BEGIN 
        SELECT first_name, last_name, birth_date, hire_date, position_id, department_id, 
               phone, email, address, salary, status
        INTO v_first_name, v_last_name, v_birth_date, v_hire_date, v_position_id, v_department_id,
             v_phone, v_email, v_address, v_salary, v_status
        FROM employees
        WHERE employee_id = p_id;

        SELECT department_name INTO v_department_name
        FROM departments
        WHERE department_id = v_department_id;

        SELECT position_name INTO v_position_name
        FROM positions
        WHERE position_id = v_position_id;

        DBMS_OUTPUT.PUT_LINE('Xodim: ' || v_first_name || ' ' || v_last_name);
        DBMS_OUTPUT.PUT_LINE('Tug`ilgan sana: ' || TO_CHAR(v_birth_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Ishga qabul qilingan sana: ' || TO_CHAR(v_hire_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Lavozimi: ' || v_position_name); 
        DBMS_OUTPUT.PUT_LINE('Bo`lim: ' || v_department_name);
        DBMS_OUTPUT.PUT_LINE('Telefon: ' || v_phone);
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
        DBMS_OUTPUT.PUT_LINE('Manzili: ' || v_address);
        DBMS_OUTPUT.PUT_LINE('Maosh: ' || v_salary);
        DBMS_OUTPUT.PUT_LINE('Holati: ' || v_status);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Xato: Berilgan ID bo`yicha xodim topilmadi.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Xatolik yuz berdi: ' || SQLERRM);

    END get_employee_info_by_id;

    PROCEDURE delete_employee(p_id IN NUMBER) IS
    BEGIN 
        DELETE FROM employees WHERE EMPLOYEE_ID = p_id;
    END delete_employee;

    PROCEDURE archive_employee(p_id IN NUMBER) IS
    BEGIN 
        UPDATE employees SET status = 'Inactive' WHERE EMPLOYEE_ID = p_id;
    END archive_employee;    
END employee_managemant_pkg;
