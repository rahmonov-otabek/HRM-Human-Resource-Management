create or replace PACKAGE leave_management_pkg AS
    PROCEDURE request_leave (
        p_employee_id IN NUMBER,
        p_leave_type IN VARCHAR2,
        p_start_date IN DATE,
        p_end_date IN DATE
    );

    PROCEDURE approve_leave_request (
        p_leave_id IN NUMBER
    );

    PROCEDURE reject_leave_request (
        p_leave_id IN NUMBER
    ); 

    PROCEDURE update_leave_request (
        p_leave_id IN NUMBER,
        p_new_start_date IN DATE,
        p_new_end_date IN DATE
    );

    PROCEDURE leave_balance (
        p_employee_id IN NUMBER
    );

END leave_management_pkg;
/
create or replace PACKAGE BODY leave_management_pkg AS
        PROCEDURE request_leave (
        p_employee_id IN NUMBER,
        p_leave_type IN VARCHAR2,
        p_start_date IN DATE,
        p_end_date IN DATE
    ) IS 
        v_employee_count NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_employee_count
        FROM employees
        WHERE employee_id = p_employee_id;

        IF v_employee_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Xodim topilmadi.');
            RETURN;
        END IF;

        INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status)
        VALUES (p_employee_id, p_leave_type, p_start_date, p_end_date, 'Pending');

        DBMS_OUTPUT.PUT_LINE('Tatil so`rovi muvaffaqiyatli yuborildi.');
    END request_leave;

    PROCEDURE approve_leave_request(
        p_leave_id IN NUMBER
    ) IS 
        v_leave_count NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO v_leave_count
        FROM leave_requests
        WHERE leave_id = p_leave_id;

        IF v_leave_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Tatil so`rovi topilmadi.');
            RETURN;
        END IF;

        UPDATE leave_requests
        SET status = 'Approved'
        WHERE leave_id = p_leave_id;

        DBMS_OUTPUT.PUT_LINE('Tatil so`rovi tasdiqlandi.');
    END approve_leave_request;

    PROCEDURE reject_leave_request(
        p_leave_id IN NUMBER
    ) IS
        v_leave_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_leave_count
        FROM leave_requests
        WHERE leave_id = p_leave_id;

        IF v_leave_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Tatil so`rovi topilmadi.');
            RETURN;
        END IF;

        UPDATE leave_requests
        SET status = 'Rejected'
        WHERE leave_id = p_leave_id;

        DBMS_OUTPUT.PUT_LINE('Tatil so`rovi rad etildi.');
    END reject_leave_request;

    PROCEDURE update_leave_request(
        p_leave_id IN NUMBER,
        p_new_start_date IN DATE,
        p_new_end_date IN DATE
    ) IS
        v_leave_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_leave_count
        FROM leave_requests
        WHERE leave_id = p_leave_id;

        IF v_leave_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Tatil so`rovi topilmadi.');
            RETURN;
        END IF;

        UPDATE leave_requests
        SET start_date = p_new_start_date, end_date = p_new_end_date, status = 'Pending'
        WHERE leave_id = p_leave_id;

        DBMS_OUTPUT.PUT_LINE('Tatil so`rovi muvaffaqiyatli yangilandi.');
    END update_leave_request;

    PROCEDURE leave_balance(
        p_employee_id IN NUMBER
    ) IS
        v_total_leaves NUMBER;
        v_used_leaves NUMBER;
        v_remaining_leaves NUMBER;
    BEGIN
        -- Xodim mavjudligini tekshirish
        SELECT COUNT(*) INTO v_total_leaves
        FROM employees
        WHERE employee_id = p_employee_id;

        IF v_total_leaves = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Xato: Xodim topilmadi.');
            RETURN;
        END IF;

        SELECT SUM(end_date - start_date + 1) INTO v_used_leaves
        FROM leave_requests
        WHERE employee_id = p_employee_id AND status = 'Approved';

        v_used_leaves := NVL(v_used_leaves, 0);

        v_total_leaves := 24;
        v_remaining_leaves := v_total_leaves - v_used_leaves;

        DBMS_OUTPUT.PUT_LINE('Xodim ID: ' || p_employee_id);
        DBMS_OUTPUT.PUT_LINE('Jami tatil kunlari: ' || v_total_leaves);
        DBMS_OUTPUT.PUT_LINE('Ishlatilgan tatil kunlari: ' || v_used_leaves);
        DBMS_OUTPUT.PUT_LINE('Qolgan tatil kunlari: ' || v_remaining_leaves);
    END leave_balance;

END leave_management_pkg;
