create or replace PACKAGE pos_dep_relations_pkg AS
    PROCEDURE  assign_position_to_department(
        p_department_id IN NUMBER,
        p_position_id IN NUMBER
    );
    PROCEDURE get_positions_for_department(
        p_department_id IN NUMBER
    );
END pos_dep_relations_pkg;
/
create or replace PACKAGE BODY pos_dep_relations_pkg AS
    PROCEDURE  assign_position_to_department(
        p_department_id IN NUMBER,
        p_position_id IN NUMBER
    ) IS
        v_department_count NUMBER;
        v_position_count NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_department_count
        FROM departments
        WHERE department_id = p_department_id;

        SELECT COUNT(*) INTO v_position_count
        FROM positions
        WHERE position_id = p_position_id;

        IF v_department_count = 0 THEN 
            DBMS_OUTPUT.PUT_LINE('Xato: Bo`lim mavjud emas.');
            RETURN;
        END IF;

        IF v_position_count = 0 THEN
           DBMS_OUTPUT.PUT_LINE('Xato: Lavozim mavjud emas.');
           RETURN;
        END IF; 

        INSERT INTO department_positions(department_id, position_id)
        VALUES (p_department_id, p_position_id);

        DBMS_OUTPUT.PUT_LINE('Muffaqiyatli bajarildi!');

        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Xato: ' || SQLERRM);
    END assign_position_to_department;

    PROCEDURE get_positions_for_department(
        p_department_id IN NUMBER
    ) IS 
        CURSOR position_cursor IS 
            SELECT p.position_id, p.position_name
            FROM positions p
            JOIN department_positions dp ON p.position_id = dp.position_id
            WHERE dp.department_id = p_department_id;

            v_position_id NUMBER;
            v_position_name VARCHAR2(100); 
            v_department_name VARCHAR2(100);
            v_department_count NUMBER;
            v_employee_count NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_department_count
        FROM departments
        WHERE department_id = p_department_id;

        IF v_department_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Bo`lim mavjud emas.');
            RETURN;
        END IF;

        SELECT department_name INTO v_department_name
        FROM departments
        WHERE department_id = p_department_id;

        OPEN position_cursor;
        DBMS_OUTPUT.PUT_LINE('---- ' || v_department_name ||' ----');

        LOOP 
            FETCH position_cursor INTO v_position_id, v_position_name;
            EXIT WHEN position_cursor%NOTFOUND;
            SELECT COUNT(*) INTO v_employee_count 
            FROM employees
            WHERE position_id = v_position_id AND department_id = p_department_id;
            DBMS_OUTPUT.PUT_LINE('Lavozim ID: ' || v_position_id);
            DBMS_OUTPUT.PUT_LINE('Lavozim nomi: ' || v_position_name);
            DBMS_OUTPUT.PUT_LINE('Xodimlar soni: ' || v_employee_count); 
            DBMS_OUTPUT.PUT_LINE('--------------------------------');

        END LOOP;
        CLOSE position_cursor;
    END get_positions_for_department;

END pos_dep_relations_pkg;
