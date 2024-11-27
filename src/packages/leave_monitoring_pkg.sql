create or replace PACKAGE leave_monitoring_pkg AS 
    PROCEDURE get_leave_history(
        p_employee_id IN NUMBER
    );
    PROCEDURE leave_statistics;
END leave_monitoring_pkg;
/
create or replace PACKAGE BODY leave_monitoring_pkg AS
    PROCEDURE get_leave_history(
        p_employee_id IN NUMBER
    ) IS 
        CURSOR c_leave_history IS
            SELECT leave_id, leave_type, start_date, end_date, status
            FROM leave_requests
            WHERE employee_id = p_employee_id
            ORDER BY start_date DESC;

        v_leave_record c_leave_history%ROWTYPE;
        v_employee_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_employee_exists
        FROM employees
        WHERE employee_id = p_employee_id;

        IF v_employee_exists = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Xodim topilmadi.');
            RETURN;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Xodim ID: ' || p_employee_id || ' uchun ta''til tarixi:');
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');

        FOR v_leave_record IN c_leave_history LOOP
            DBMS_OUTPUT.PUT_LINE('Tatil ID: ' || v_leave_record.leave_id);
            DBMS_OUTPUT.PUT_LINE('Tatil turi: ' || v_leave_record.leave_type);
            DBMS_OUTPUT.PUT_LINE('Boshlanish sanasi: ' || v_leave_record.start_date);
            DBMS_OUTPUT.PUT_LINE('Tugash sanasi: ' || v_leave_record.end_date);
            DBMS_OUTPUT.PUT_LINE('Status: ' || v_leave_record.status);
            DBMS_OUTPUT.PUT_LINE('------------------------------------------');
        END LOOP;
    END get_leave_history;

    PROCEDURE leave_statistics IS
        CURSOR c_employee IS
            SELECT e.employee_id, e.first_name || ' ' || e.last_name AS full_name
            FROM employees e;

        v_employee c_employee%ROWTYPE;
        v_total_leaves NUMBER := 24; 
        v_used_leaves NUMBER;
        v_remaining_leaves NUMBER;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Barcha xodimlarning dam olish kunlari statistikasi:');
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');

        FOR v_employee IN c_employee LOOP
            SELECT SUM(end_date - start_date + 1) INTO v_used_leaves
            FROM leave_requests
            WHERE employee_id = v_employee.employee_id AND status = 'Approved';

            v_used_leaves := NVL(v_used_leaves, 0);
            v_remaining_leaves := v_total_leaves - v_used_leaves;

            DBMS_OUTPUT.PUT_LINE('Xodim: ' || v_employee.full_name || ' (ID: ' || v_employee.employee_id || ')');
            DBMS_OUTPUT.PUT_LINE('  Ishlatilgan ta''til kunlari: ' || v_used_leaves);
            DBMS_OUTPUT.PUT_LINE('  Qolgan ta''til kunlari: ' || v_remaining_leaves);
            DBMS_OUTPUT.PUT_LINE('------------------------------------------');
        END LOOP;
    END leave_statistics;

END leave_monitoring_pkg;