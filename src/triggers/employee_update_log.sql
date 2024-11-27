CREATE OR REPLACE TRIGGER employee_update_log
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN 
    IF UPDATING('FIRST_NAME') THEN
        IF :OLD.FIRST_NAME <> :NEW.FIRST_NAME THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'FIRST NAME', :OLD.FIRST_NAME, :NEW.FIRST_NAME, SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20500, 'Yangi Ism oldingisi bilan bir xil!');
        END IF;
 
    ELSIF UPDATING('LAST_NAME') THEN
        IF :OLD.LAST_NAME <> :NEW.LAST_NAME THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'LAST NAME', :OLD.LAST_NAME, :NEW.LAST_NAME, SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20501, 'Yangi familiya oldingisi bilan bir xil!');
        END IF;
 
    ELSIF UPDATING('PHONE') THEN
        IF :OLD.PHONE <> :NEW.PHONE THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'PHONE', :OLD.PHONE, :NEW.PHONE, SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20502, 'Yangi raqam oldingisi bilan bir xil!');
        END IF;
 
    ELSIF UPDATING('EMAIL') THEN
        IF :OLD.EMAIL <> :NEW.EMAIL THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'EMAIL', :OLD.EMAIL, :NEW.EMAIL, SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20503, 'OLD EMAIL AND NEW EMAIL ARE SAME');
        END IF;
 
    ELSIF UPDATING('ADDRESS') THEN
        IF :OLD.ADDRESS <> :NEW.ADDRESS THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'ADDRESS', :OLD.ADDRESS, :NEW.ADDRESS, SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20504, 'Yangi elektron poschta oldingisi bilan bir xil!');
        END IF; 
 
    ELSIF UPDATING('SALARY') THEN
        IF :OLD.SALARY <> :NEW.SALARY THEN
            INSERT INTO employees_log (employee_id, column_changed, old_value, new_value, change_date, modified_by) 
            VALUES (:OLD.employee_id, 'SALARY', TO_CHAR(:OLD.SALARY), TO_CHAR(:NEW.SALARY), SYSDATE, USER);
        ELSE
            RAISE_APPLICATION_ERROR(-20507, 'Yangi maosh oldingisi bilan bir xil!');
        END IF;
   END IF;
END;
/
