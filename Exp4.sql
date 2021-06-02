mysql> use employee;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_employee |
+--------------------+
| dept               |
| employee           |
+--------------------+
2 rows in set (0.94 sec)

mysql> describe dept;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | YES  |     | NULL    |       |
| location  | varchar(30) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.18 sec)

mysql> select * from dept;
+---------+-----------+--------------+
| dept_no | dept_name | location     |
+---------+-----------+--------------+
|     501 | Bsc       | third_floor  |
|     502 | BA        | first_floor  |
|     503 | BCom      | first_floor  |
|     504 | BBA       | second_floor |
|     505 | BCA       | third_floor  |
+---------+-----------+--------------+
5 rows in set (0.06 sec)

mysql> select * from employee;
+---------+-----------+--------+----------+----------+-------------+--------+
| dept_no | dept_name | emp_no | emp_name | mob_no   | designation | salary |
+---------+-----------+--------+----------+----------+-------------+--------+
|     501 | BSc       |    101 | john     | 98979695 | typist      |  20000 |
|     502 | BA        |    102 | rahul    | 70484374 | hr          |   7000 |
|     501 | BSc       |    103 | haritha  | 98955431 | cio         |   8000 |
|     505 | BCA       |    104 | arun     | 66697188 | sd          |   4000 |
|     504 | BBA       |    105 | praveen  | 86751438 | ssd         |   4500 |
+---------+-----------+--------+----------+----------+-------------+--------+
5 rows in set (0.00 sec)

mysql> create view Manager as SELECT emp_name,salary,location from employee,dept;
Query OK, 0 rows affected (0.44 sec)

mysql> select  distinct e.emp_name from employee e ,Manager m where e.salary >m.salary;
+----------+
| emp_name |
+----------+
| john     |
| rahul    |
| haritha  |
| praveen  |
+----------+
4 rows in set (0.07 sec)

mysql> DROP VIEW MANAGER;
Query OK, 0 rows affected (0.18 sec)

mysql> create view Manager as SELECT emp_name,salary,location from employee,dept;
Query OK, 0 rows affected (0.09 sec)

mysql> update Manager set salary=1.1 * salary where location="second_floor";
Query OK, 5 rows affected (0.24 sec)
Rows matched: 5  Changed: 5  Warnings: 0


mysql> create table deptsal as select dept_no , 0 as totalsalary from dept;
Query OK, 5 rows affected (2.47 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from deptsal;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
|     501 |           0 |
|     502 |           0 |
|     503 |           0 |
|     504 |           0 |
|     505 |           0 |
+---------+-------------+
5 rows in set (0.04 sec)

mysql> delimiter //
mysql> create procedure updatesal(IN Param1 int)
    -> begin
    -> update deptsal
    -> set totalsalary= (select sum(salary)from employee  where dept_no=Param1)
    -> where dept_no =param1;
    -> end; //
Query OK, 0 rows affected (0.90 sec)

mysql> call updatesal(502);
Query OK, 0 rows affected (0.00 sec)

mysql> call updatesal(504);
Query OK, 1 row affected (0.08 sec)

mysql> call updatesal(505);
Query OK, 0 rows affected (0.00 sec)

mysql> select * from deptsal;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
|     501 |       30800 |
|     502 |        7700 |
|     503 |           0 |
|     504 |        4950 |
|     505 |        4400 |
+---------+-------------+
5 rows in set (0.00 sec)

mysql> drop procedure updatesal;
Query OK, 0 rows affected (0.18 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE Getdetails()
    -> begin
    -> select * from employee;
    -> END //
Query OK, 0 rows affected (0.15 sec)

mysql> DELIMITER ;
mysql> CALL Getdetails();
+---------+-----------+--------+----------+----------+-------------+--------+
| dept_no | dept_name | emp_no | emp_name | mob_no   | designation | salary |
+---------+-----------+--------+----------+----------+-------------+--------+
|     501 | BSc       |    101 | john     | 98979695 | typist      |  22000 |
|     502 | BA        |    102 | rahul    | 70484374 | hr          |   7700 |
|     501 | BSc       |    103 | haritha  | 98955431 | cio         |   8800 |
|     505 | BCA       |    104 | arun     | 66697188 | sd          |   4400 |
|     504 | BBA       |    105 | praveen  | 86751438 | ssd         |   4950 |
+---------+-----------+--------+----------+----------+-------------+--------+
5 rows in set (0.08 sec)

Query OK, 0 rows affected (0.10 sec)