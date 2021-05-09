mysql> CREATE DATABASE college;
Query OK, 1 row affected (1.01 sec)

mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.75 sec)

mysql> use college;
Database changed

mysql> create table employee(
    -> emp_no int(20),
    -> emp_name varchar(30),
    -> DOB DATE,
    -> address varchar(50),
    -> doj DATE,
    -> mobile_no varchar(20),
    -> dept_no varchar(30),
    -> salary int(10),
    -> PRIMARY KEY(emp_no)
    -> );
Query OK, 0 rows affected, 2 warnings (2.23 sec)

mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_no    | int         | NO   | PRI | NULL    |       |
| emp_name  | varchar(30) | YES  |     | NULL    |       |
| DOB       | date        | YES  |     | NULL    |       |
| address   | varchar(50) | YES  |     | NULL    |       |
| doj       | date        | YES  |     | NULL    |       |
| mobile_no | varchar(20) | YES  |     | NULL    |       |
| dept_no   | varchar(30) | YES  |     | NULL    |       |
| salary    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.33 sec)

mysql> create table department(
    -> dept_no int(20),
    -> dept_name varchar(30),
    -> location varchar(50)
    -> );
Query OK, 0 rows affected, 1 warning (1.02 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | int         | YES  |     | NULL    |       |
| dept_name | varchar(30) | YES  |     | NULL    |       |
| location  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> show tables;
+-------------------+
| Tables_in_college |
+-------------------+
| department        |
| employee          |
+-------------------+
2 rows in set (0.26 sec)

mysql> alter table employee add designation varchar(50);
Query OK, 0 rows affected (1.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_no      | int         | NO   | PRI | NULL    |       |
| emp_name    | varchar(30) | YES  |     | NULL    |       |
| DOB         | date        | YES  |     | NULL    |       |
| address     | varchar(50) | YES  |     | NULL    |       |
| doj         | date        | YES  |     | NULL    |       |
| mobile_no   | varchar(20) | YES  |     | NULL    |       |
| dept_no     | varchar(30) | YES  |     | NULL    |       |
| salary      | int         | YES  |     | NULL    |       |
| designation | varchar(50) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
9 rows in set (0.20 sec)

mysql> alter table department drop column location;
Query OK, 0 rows affected (1.91 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | int         | YES  |     | NULL    |       |
| dept_name | varchar(30) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> drop table department;
Query OK, 0 rows affected (0.80 sec)

mysql> drop table employee;
Query OK, 0 rows affected (1.54 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.09 sec)

mysql> drop database college;
Query OK, 0 rows affected (0.51 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.00 sec)