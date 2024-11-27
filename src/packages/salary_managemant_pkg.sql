create or replace PACKAGE salary_management_pkg AS
    PROCEDURE calculate_salary(
        p_employee_id IN NUMBER,
        p_month IN NUMBER,
        p_year IN NUMBER,
        p_base_salary IN NUMBER,
        p_bonus IN NUMBER DEFAULT 0
    );

    PROCEDURE add_bonus(
        p_employee_id IN NUMBER,
        p_amount IN NUMBER,
        p_reason IN VARCHAR2 DEFAULT NULL
    );

    PROCEDURE calculate_overtime(
        p_employee_id IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_rate_per_hour IN NUMBER
    );

    PROCEDURE salary_report(
        p_employee_id IN NUMBER DEFAULT NULL
    );  
END salary_management_pkg;
/
create or replace PACKAGE BODY salary_management_pkg AS 
    PROCEDURE calculate_salary(
        p_employee_id IN NUMBER,
        p_month IN NUMBER,
        p_year IN NUMBER,
        p_base_salary IN NUMBER,
        p_bonus IN NUMBER DEFAULT 0
    ) IS
        v_final_salary NUMBER(10,2);
    BEGIN 
        v_final_salary := p_base_salary + p_bonus;

        INSERT INTO salaries(employee_id, month, year, amount)
        VALUES (p_employee_id, p_month, p_year, v_final_salary);

        DBMS_OUTPUT.PUT_LINE('Xodim uchun ish haqi belgilandi: ' || v_final_salary);

        COMMIT;
    END calculate_salary;

    PROCEDURE add_bonus(
        p_employee_id IN NUMBER,
        p_amount IN NUMBER,
        p_reason IN VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN 
        INSERT INTO bonuses(employee_id, bonus_date, amount, reason)
        VALUES (p_employee_id, SYSDATE, p_amount, p_reason);

        DBMS_OUTPUT.PUT_LINE('Xodim uchun bonus qo`shildi: ' || p_amount);

        COMMIT;
    END add_bonus;

    PROCEDURE calculate_overtime(
        p_employee_id IN NUMBER,
        p_overtime_hours IN NUMBER,
        p_rate_per_hour IN NUMBER
    ) IS
        v_overtime_pay NUMBER(10, 2);
    BEGIN 
        v_overtime_pay := p_overtime_hours * p_rate_per_hour;

        add_bonus(p_employee_id, v_overtime_pay, 'Ortib ketgan ish vaqti uchun');

        DBMS_OUTPUT.PUT_LINE('Ortib ketgan ish vaqti uchun haq hisoblandi: ' || v_overtime_pay);
    END calculate_overtime;

    PROCEDURE salary_report(
        p_employee_id IN NUMBER DEFAULT NULL
    ) IS 
        CURSOR c_salary IS
            SELECT s.employee_id, s.month, s.year, s.amount, b.amount AS bonus_amount, b.bonus_date, b.reason
            FROM salaries s
            LEFT JOIN bonuses b ON s.employee_id = b.employee_id
            WHERE (p_employee_id IS NULL OR s.employee_id = p_employee_id)
            ORDER BY s.year DESC, s.month DESC;
        v_record c_salary%ROWTYPE;
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Ish haqi va bonuslar tarixi hisobot:');

        FOR v_record IN c_salary LOOP
            DBMS_OUTPUT.PUT_LINE('Xodim ID: ' || v_record.employee_id);
            DBMS_OUTPUT.PUT_LINE('Oy/Yil: ' || v_record.month || '/' || v_record.year);
            DBMS_OUTPUT.PUT_LINE('Ish haqi miqdori: ' || v_record.amount);

            IF v_record.bonus_amount IS NOT NULL THEN
                DBMS_OUTPUT.PUT_LINE('Bonus miqdori: ' || v_record.bonus_amount);
                DBMS_OUTPUT.PUT_LINE('Bonus sanasi: ' || v_record.bonus_date);
                DBMS_OUTPUT.PUT_LINE('Bonus sababi: ' || NVL(v_record.reason, 'Noma''lum'));
            END IF;

            DBMS_OUTPUT.PUT_LINE('---------------------------');
        END LOOP;
    END salary_report; 


END salary_management_pkg;