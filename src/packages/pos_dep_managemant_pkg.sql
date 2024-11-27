create or replace PACKAGE pos_dep_managemant_pkg AS
    -- Position
    PROCEDURE add_position(
        p_position_name IN VARCHAR2 DEFAULT NULL,
        p_salary IN NUMBER DEFAULT NULL,
        p_description IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE edit_position(
        p_id IN NUMBER,
        p_position_name IN VARCHAR2 DEFAULT NULL,
        p_salary IN NUMBER DEFAULT NULL,
        p_description IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE get_position_info_by_id(p_id IN NUMBER);
    PROCEDURE delete_position(p_id IN NUMBER);

    -- Department
    PROCEDURE add_department(
        p_department_name IN VARCHAR2 DEFAULT NULL,
        p_description IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE edit_department(
        p_id IN NUMBER,
        p_department_name IN VARCHAR2 DEFAULT NULL,
        p_description IN VARCHAR2 DEFAULT NULL
    );
    PROCEDURE get_department_info_by_id(p_id IN NUMBER);
    PROCEDURE delete_department(p_id IN NUMBER);

END pos_dep_managemant_pkg;
/
create or replace PACKAGE BODY pos_dep_managemant_pkg AS
    PROCEDURE add_position(
        p_position_name IN VARCHAR2,
        p_salary IN NUMBER,
        p_description IN VARCHAR2
    ) IS
    BEGIN 
        IF p_position_name IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Position name kiritilmagan.');
            RETURN;
        END IF;
        IF p_salary IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Salary kiritilmagan.');
            RETURN;
        END IF; 
        INSERT INTO positions(position_name, salary, description)
        VALUES(p_position_name, p_salary, p_description);

        DBMS_OUTPUT.PUT_LINE('Lavozim muvaffaqiyatli qo`shildi.');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 
    END add_position;

    PROCEDURE edit_position(
        p_id IN NUMBER,
        p_position_name IN VARCHAR2,
        p_salary IN NUMBER,
        p_description IN VARCHAR2 
    ) IS
    BEGIN 
        UPDATE positions
        SET  
            position_name = NVL(p_position_name, position_name),
            salary = NVL(p_salary, salary),
            description = NVL(p_description, description) 
        WHERE POSITION_ID = p_id;

        DBMS_OUTPUT.PUT_LINE('Lavozim muvaffaqiyatli o`zgartirildi');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 

    END edit_position;

    PROCEDURE get_position_info_by_id(p_id NUMBER) IS
        v_position_name VARCHAR2(50);
        v_salary NUMBER;
        v_description VARCHAR2(255);
    BEGIN 
        SELECT position_name, salary, description
        INTO v_position_name, v_salary, v_description
        FROM positions
        WHERE POSITION_ID = p_id;

        DBMS_OUTPUT.PUT_LINE('Lavozim nomi: ' || v_position_name);
        DBMS_OUTPUT.PUT_LINE('Maosh: ' || v_salary);
        DBMS_OUTPUT.PUT_LINE('Tavsif: ' || v_description);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Xato: Berilgan ID bo`yicha lavozim topilmadi.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Xatolik yuz berdi: ' || SQLERRM);

    END get_position_info_by_id;

    PROCEDURE delete_position(p_id IN NUMBER) IS
    BEGIN 
        DELETE FROM positions WHERE POSITION_ID = p_id;
    END delete_position;

    PROCEDURE add_department(
        p_department_name IN VARCHAR2, 
        p_description IN VARCHAR2
    ) IS
    BEGIN 
        IF p_department_name IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Department name kiritilmagan.');
            RETURN;
        END IF; 
        INSERT INTO departments(department_name, description)
        VALUES(p_department_name, p_description);

        DBMS_OUTPUT.PUT_LINE('Bo`lim muvaffaqiyatli qo`shildi.');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 
    END add_department;

    PROCEDURE edit_department(
        p_id IN NUMBER,
        p_department_name IN VARCHAR2,
        p_description IN VARCHAR2 
    ) IS
    BEGIN 
        UPDATE departments
        SET  
            department_name = NVL(p_department_name, department_name), 
            description = NVL(p_description, description) 
        WHERE DEPARTMENT_ID = p_id;

        DBMS_OUTPUT.PUT_LINE('Bo`lim muvaffaqiyatli o`zgartirildi');

        EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM); 

    END edit_department;

    PROCEDURE get_department_info_by_id(p_id NUMBER) IS
        v_department_name VARCHAR2(50); 
        v_description VARCHAR2(255);
    BEGIN 
        SELECT department_name, description
        INTO v_department_name, v_description
        FROM departments
        WHERE DEPARTMENT_ID = p_id;

        DBMS_OUTPUT.PUT_LINE('Bo`lim nomi: ' || v_department_name);
        DBMS_OUTPUT.PUT_LINE('Tavsif: ' || v_description);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Xato: Berilgan ID bo`yicha bo`lim topilmadi.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Xatolik yuz berdi: ' || SQLERRM);

    END get_department_info_by_id;

    PROCEDURE delete_department(p_id IN NUMBER) IS
    BEGIN 
        DELETE FROM departments WHERE DEPARTMENT_ID = p_id;
    END delete_department;

END pos_dep_managemant_pkg;
