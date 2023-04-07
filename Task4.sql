CREATE DATABASE HR_Department;

USE HR_Department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS task;

CREATE TABLE IF NOT EXISTS department
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    code            INT          NOT NULL
);
INSERT INTO department(id, department_name, code)
VALUES (1, 'IT', 234),
       (2, 'Sales', 345),
       (3, 'accounting', 458);
CREATE TABLE IF NOT EXISTS task
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    task_name VARCHAR(100) NOT NULL,
    deadline  DATE         NOT NULL
);
INSERT INTO task(task_name, deadline)
VALUES ('task1', '2023-2-15'),
       ('task2', '2023-3-23'),
       ('task3', '2023-5-25'),
       ('task4', '2023-8-13');
CREATE TABLE IF NOT EXISTS position
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    position_name   VARCHAR(100),
    work_experience INT,
    salary          DOUBLE
);

INSERT INTO position
    (id, position_name, work_experience, salary)
VALUES (1, 'Manager', 5, 200.00),
       (2, 'Junior Java Developer', 2, 1000.00),
       (3, 'Full-Stack Java Developer (VS)', 3, 3000),
       (4, 'Manager', 5, 200.00),
       (5, 'Middle Java Developer', 2, 1000.00),
       (6, 'Senior Java Developer', 3, 3000);

CREATE TABLE IF NOT EXISTS employee
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    full_name     VARCHAR(100),
    passport      VARCHAR(50),
    address       VARCHAR(100),
    phone         VARCHAR(20),
    email         VARCHAR(50) UNIQUE NOT NULL,
    date_of_birth DATE,
    dep_id        INT                NOT NULL,
    task_id       INT                NOT NULL,
    posit_id      INT                NOT NULL,
    CONSTRAINT employee_id_department_id FOREIGN KEY (dep_id) REFERENCES department (id),
    CONSTRAINT employee_id_task_id FOREIGN KEY (task_id) REFERENCES task (id),
    CONSTRAINT employee_id_position_id FOREIGN KEY (posit_id) REFERENCES position (id)
);

INSERT INTO employee

(full_name, passport, address, phone, email, date_of_birth, dep_id, task_id, posit_id)
VALUES ('Andrey Samko', 'AO56565', 'Ivana str., 2', '0991213333', 'Samko@company.com', '1994-01-09', 3, 1, 1),
       ('Andrey Ivanov', 'AO554445', 'Mariupol str., 1', '09876545454', 'Ivanov@company.com', '1998-10-18', 1, 4, 2),
       ('Anna An', 'AA553322', 'Peremoga str.,73', '0962365678', 'Anna@company.com', '1999-11-06', 1, 2, 3),
       ('Alona Samko', 'AO56535', 'Ivana str., 2', '0991213333', 'Alona@company.com', '1977-01-09', 1, 3, 4),
       ('Sacha Sashko', 'AO551445', 'Mariupol str., 12', '09876548454', 'Sacha@company.com', '2002-10-18', 2, 4, 1),
       ('Lina An', 'AA553362', 'Peremoga str.,13', '0962345698', 'Lina@company.com', '1995-11-06', 1, 1, 2);





