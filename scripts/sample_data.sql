INSERT INTO positions (position_name, salary, description) VALUES
('Boshqaruvchi', 80000, 'Yuqori darajadagi menejer');
INSERT INTO positions (position_name, salary, description) VALUES
('Dasturchi', 60000, 'Veb sayt va tizimlar ishlab chiqish');
INSERT INTO positions (position_name, salary, description) VALUES
('Muhandis', 75000, 'Texnik yechimlar ishlab chiqish');
INSERT INTO positions (position_name, salary, description) VALUES
('Marketing mutaxassisi', 55000, 'Reklama va marketing faoliyatlari');
INSERT INTO positions (position_name, salary, description) VALUES
('Moliya mutaxassisi', 65000, 'Moliya va hisobotlar');
INSERT INTO positions (position_name, salary, description) VALUES
('HR menejeri', 70000, 'Kadrlar bilan ishlash');
INSERT INTO positions (position_name, salary, description) VALUES
('Texnik yordam', 45000, 'Texnik muammolarni hal qilish');
INSERT INTO positions (position_name, salary, description) VALUES
('Tashkiliy menejer', 72000, 'Ishlarni rejalashtirish va tashkil etish');
INSERT INTO positions (position_name, salary, description) VALUES
('Biznes tahlilchisi', 67000, 'Biznes jarayonlarini tahlil qilish');
INSERT INTO positions (position_name, salary, description) VALUES
('Ishlab chiqarish menejeri', 74000, 'Ishlab chiqarish jarayonlarini boshqarish');

select * from positions;

Commit;

INSERT INTO departments (department_name, description) VALUES
('IT Bo`limi', 'Axborot texnologiyalari bilan bog`liq ishlar');
INSERT INTO departments (department_name, description) VALUES
('Marketing Bo`limi', 'Reklama va marketing faoliyatlari');
INSERT INTO departments (department_name, description) VALUES
('Moliya Bo`limi', 'Moliya va hisob-kitoblar');
INSERT INTO departments (department_name, description) VALUES
('Kadrlar Bo`limi', 'Kadrlar siyosati va boshqaruvi');
INSERT INTO departments (department_name, description) VALUES
('Texnik Xizmat Bo`limi', 'Texnik yordam va qo`llab-quvvatlash');

select * from departments;

commit;

INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Ali', 'Toshmatov', TO_DATE('1985-05-15', 'YYYY-MM-DD'), TO_DATE('2010-06-01', 'YYYY-MM-DD'), 1, 1, '998901234567', 'ali.toshmatov@example.com', 'Tashkent, Yunusobod', 3500, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Sanjar', 'Usmonov', TO_DATE('1990-07-20', 'YYYY-MM-DD'), TO_DATE('2015-03-15', 'YYYY-MM-DD'), 2, 2, '998903456789', 'sanjar.usmonov@example.com', 'Tashkent, Chilonzor', 4000, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Madina', 'Shamsutdinova', TO_DATE('1992-10-10', 'YYYY-MM-DD'), TO_DATE('2018-08-25', 'YYYY-MM-DD'), 3, 3, '998907654321', 'madina.shamsutdinova@example.com', 'Samarkand, 22 ko`cha', 4500, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Zokir', 'Karimov', TO_DATE('1980-03-05', 'YYYY-MM-DD'), TO_DATE('2008-12-20', 'YYYY-MM-DD'), 4, 4, '998901234567', 'zokir.karimov@example.com', 'Bukhara, Alisher Navoiy', 5000, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Gulnoza', 'Rahmonova', TO_DATE('1987-11-13', 'YYYY-MM-DD'), TO_DATE('2012-05-11', 'YYYY-MM-DD'), 5, 5, '998906789012', 'gulnoza.rahmonova@example.com', 'Tashkent, Mirabad', 3800, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Bekzod', 'Saidov', TO_DATE('1993-09-07', 'YYYY-MM-DD'), TO_DATE('2020-02-10', 'YYYY-MM-DD'), 1, 2, '998907123456', 'bekzod.saidov@example.com', 'Tashkent, Shayhontohur', 4200, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Zarina', 'Ismailova', TO_DATE('1995-12-03', 'YYYY-MM-DD'), TO_DATE('2021-06-01', 'YYYY-MM-DD'), 2, 1, '998905678910', 'zarina.ismailova@example.com', 'Namangan, 4 kocha', 4000, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Doston', 'Murodov', TO_DATE('1988-01-15', 'YYYY-MM-DD'), TO_DATE('2016-10-15', 'YYYY-MM-DD'), 3, 3, '998907654321', 'doston.murodov@example.com', 'Tashkent, Uchtepa', 4600, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Otabek', 'Rakhimov', TO_DATE('1994-04-20', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), 4, 5, '998908123456', 'otabek.rakhimov@example.com', 'Fergana, 6 kocha', 4300, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Lola', 'Sultonova', TO_DATE('1992-06-28', 'YYYY-MM-DD'), TO_DATE('2019-11-21', 'YYYY-MM-DD'), 5, 2, '998904567890', 'lola.sultonova@example.com', 'Tashkent, Sergeli', 4700, 'Active');
INSERT INTO employees (employee_id, first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
(11, 'Shahzod', 'Abdullayev', TO_DATE('1984-01-30', 'YYYY-MM-DD'), TO_DATE('2013-04-18', 'YYYY-MM-DD'), 1, 4, '998909876543', 'shahzod.abdullayev@example.com', 'Andijan, Navoi', 5100, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Sevinch', 'Tursunova', TO_DATE('1989-09-22', 'YYYY-MM-DD'), TO_DATE('2014-01-09', 'YYYY-MM-DD'), 2, 3, '998902345678', 'sevinch.tursunova@example.com', 'Tashkent, Yakkasaray', 4500, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Komil', 'Jumayev', TO_DATE('1991-05-19', 'YYYY-MM-DD'), TO_DATE('2016-07-22', 'YYYY-MM-DD'), 3, 2, '998907890123', 'komil.jumayev@example.com', 'Khorezm, Urgench', 4900, 'Active');
INSERT INTO employees (employee_id, first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
(14, 'Ravshan', 'Mirzaev', TO_DATE('1982-08-03', 'YYYY-MM-DD'), TO_DATE('2009-06-12', 'YYYY-MM-DD'), 4, 4, '998909876543', 'ravshan.mirzaev@example.com', 'Tashkent, Bektemir', 5200, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Nodira', 'Gafurova', TO_DATE('1993-02-17', 'YYYY-MM-DD'), TO_DATE('2017-11-30', 'YYYY-MM-DD'), 5, 1, '998902233445', 'nodira.gafurova@example.com', 'Tashkent, Zangiota', 4400, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Farruh', 'Kasimov', TO_DATE('1986-06-14', 'YYYY-MM-DD'), TO_DATE('2013-09-05', 'YYYY-MM-DD'), 1, 3, '998909223344', 'farruh.kasimov@example.com', 'Tashkent, Yashnabad', 4600, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Shahnoza', 'Mansurova', TO_DATE('1990-02-22', 'YYYY-MM-DD'), TO_DATE('2016-04-10', 'YYYY-MM-DD'), 2, 2, '998906543210', 'shahnoza.mansurova@example.com', 'Jizzakh, Boston', 4800, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Javohir', 'Umarov', TO_DATE('1991-08-25', 'YYYY-MM-DD'), TO_DATE('2017-05-19', 'YYYY-MM-DD'), 3, 1, '998907987654', 'javohir.umarov@example.com', 'Samarqand, Registon', 4700, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Dilnoza', 'Babaeva', TO_DATE('1995-04-16', 'YYYY-MM-DD'), TO_DATE('2022-06-07', 'YYYY-MM-DD'), 4, 3, '998909345678', 'dilnoza.babaeva@example.com', 'Bukhara, Mirzo Ulugbek', 4600, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Olim', 'Shokirov', TO_DATE('1989-10-11', 'YYYY-MM-DD'), TO_DATE('2014-09-25', 'YYYY-MM-DD'), 5, 5, '998908234567', 'olim.shokirov@example.com', 'Tashkent, Sergeli', 4800, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Aziz', 'Xolmatov', TO_DATE('1987-02-01', 'YYYY-MM-DD'), TO_DATE('2015-03-22', 'YYYY-MM-DD'), 1, 2, '998905678901', 'aziz.xolmatov@example.com', 'Tashkent, Yunusabad', 5300, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Shirin', 'Rizayeva', TO_DATE('1993-01-10', 'YYYY-MM-DD'), TO_DATE('2020-12-05', 'YYYY-MM-DD'), 2, 4, '998905567890', 'shirin.rizayeva@example.com', 'Nukus, A. Navoi', 5100, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Dilya', 'Masharipova', TO_DATE('1986-12-08', 'YYYY-MM-DD'), TO_DATE('2014-04-11', 'YYYY-MM-DD'), 3, 5, '998907456789', 'dilya.masharipova@example.com', 'Tashkent, Zafarabad', 5000, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Rustam', 'Kadyrov', TO_DATE('1984-05-20', 'YYYY-MM-DD'), TO_DATE('2010-07-14', 'YYYY-MM-DD'), 4, 1, '998907123456', 'rustam.kadyrov@example.com', 'Samarqand, Islom Karimov', 5400, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Madina', 'Mamatova', TO_DATE('1996-02-28', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), 5, 2, '998902233445', 'madina.mamatova@example.com', 'Tashkent, Mirzo Ulugbek', 4600, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Azizbek', 'Saidov', TO_DATE('1994-11-01', 'YYYY-MM-DD'), TO_DATE('2019-06-30', 'YYYY-MM-DD'), 1, 4, '998909876543', 'azizbek.saidov@example.com', 'Samarkand, Bukhoro', 4700, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Sardor', 'Ibragimov', TO_DATE('1992-03-25', 'YYYY-MM-DD'), TO_DATE('2017-11-01', 'YYYY-MM-DD'), 2, 3, '998907123456', 'sardor.ibragimov@example.com', 'Tashkent, Mirabad', 4900, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Nodira', 'Jalilova', TO_DATE('1990-12-04', 'YYYY-MM-DD'), TO_DATE('2015-10-01', 'YYYY-MM-DD'), 3, 2, '998908765432', 'nodira.jalilova@example.com', 'Andijan, Yangi hayot', 5100, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Shahram', 'Ilyasov', TO_DATE('1985-09-13', 'YYYY-MM-DD'), TO_DATE('2011-02-18', 'YYYY-MM-DD'), 4, 4, '998902345678', 'shahram.ilyasov@example.com', 'Namangan, Yakkabog', 5300, 'Active');
INSERT INTO employees (first_name, last_name, birth_date, hire_date, position_id, department_id, phone, email, address, salary, status) VALUES
('Gulbahor', 'Mansuriy', TO_DATE('1988-04-12', 'YYYY-MM-DD'), TO_DATE('2016-07-05', 'YYYY-MM-DD'), 5, 1, '998907654321', 'gulbahor.mansuriy@example.com', 'Tashkent, Almazar', 5500, 'Active');

select * from employees;

commit;

INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(4, 'Yillik tatil', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(1, 'Kasallik tatili', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(3, 'Tuzilish tatili', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'Kutilyapti');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(4, 'Yillik tatil', TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(5, 'Kasallik tatili', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(4, 'Tuzilish tatili', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Kutilyapti');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(7, 'Yillik tatil', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(8, 'Kasallik tatili', TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'Kutilyapti');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(9, 'Tuzilish tatili', TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(1, 'Yillik tatil', TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(7, 'Kasallik tatili', TO_DATE('2024-05-25', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(12, 'Tuzilish tatili', TO_DATE('2024-08-15', 'YYYY-MM-DD'), TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'Kutilyapti');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(13, 'Yillik tatil', TO_DATE('2024-07-20', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Tasdiqlangan');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(15, 'Kasallik tatili', TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 'Kutilyapti');
INSERT INTO leave_requests (employee_id, leave_type, start_date, end_date, status) VALUES
(8, 'Tuzilish tatili', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Kutilyapti');

select * from leave_requests;

commit;

INSERT INTO salaries (employee_id, month, year, amount) VALUES
(1, 1, 2024, 80000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(2, 1, 2024, 60000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(3, 1, 2024, 75000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(4, 1, 2024, 55000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(5, 1, 2024, 65000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(6, 1, 2024, 70000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(7, 1, 2024, 45000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(8, 1, 2024, 72000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(9, 1, 2024, 67000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(10, 1, 2024, 74000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(11, 1, 2024, 80000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(12, 1, 2024, 60000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(13, 1, 2024, 75000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(14, 1, 2024, 55000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(15, 1, 2024, 65000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(16, 1, 2024, 70000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(17, 1, 2024, 45000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(18, 1, 2024, 72000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(19, 1, 2024, 67000);
INSERT INTO salaries (employee_id, month, year, amount) VALUES
(20, 1, 2024, 74000);

select * from salaries;

commit;

INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(1, 75000, 80000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(2, 55000, 60000, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(3, 70000, 75000, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(4, 50000, 55000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(5, 60000, 65000, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(6, 65000, 70000, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(7, 40000, 45000, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(8, 70000, 72000, TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(9, 65000, 67000, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(10, 72000, 74000, TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(11, 75000, 80000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(12, 60000, 65000, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(13, 70000, 75000, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(14, 50000, 55000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(15, 60000, 65000, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(16, 65000, 70000, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(17, 40000, 45000, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(18, 70000, 72000, TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(19, 65000, 67000, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO salary_history (employee_id, old_salary, new_salary, change_date) VALUES
(20, 72000, 74000, TO_DATE('2024-07-01', 'YYYY-MM-DD'));

select * from salary_history;

commit;

INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 5000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(2, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 4000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(3, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 4500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(4, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 3000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(5, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 3500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(6, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 3500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(7, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 2000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(8, TO_DATE('2024-08-15', 'YYYY-MM-DD'), 5500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(9, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 4000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(10, TO_DATE('2024-10-15', 'YYYY-MM-DD'), 4500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(11, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 5000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(12, TO_DATE('2024-12-15', 'YYYY-MM-DD'), 3000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(13, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 3500, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(14, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 4000, 'Yil yakunlari bonus');
INSERT INTO bonuses (employee_id, bonus_date, amount, reason) VALUES
(15, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 4500, 'Yil yakunlari bonus');

select * from bonuses;

commit;