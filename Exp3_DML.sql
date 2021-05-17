mysql> create database employee;
Query OK, 1 row affected (1.43 sec)


(i) Add 5 rows in the employee and dept tables


mysql> use employee;
Database changed
mysql> create table dept(
    -> dept_no int(20),
    -> dept_name varchar(30),
    -> location varchar(30),
    -> PRIMARY KEY(dept_no)
    -> );
Query OK, 0 rows affected, 1 warning (2.77 sec)

mysql> create table employee(
    -> dept_no int(20),
    -> dept_name varchar(30),
    -> emp_no int(20),
    -> emp_name varchar(30),
    -> mob_no int(15),
    -> designation varchar(30),
    -> salary int(20),
    -> PRIMARY KEY(emp_no)
    -> );
Query OK, 0 rows affected, 4 warnings (0.82 sec)

mysql> insert into dept values(501,"Bsc","third_floor");
Query OK, 1 row affected (0.25 sec)

mysql> insert into dept values(502,"BA","first_floor");
Query OK, 1 row affected (0.11 sec)

mysql> insert into dept values(503,"BCom","first_floor");
Query OK, 1 row affected (0.10 sec)

mysql> insert into dept values(504,"BBA","second_floor");
Query OK, 1 row affected (0.13 sec)

mysql> insert into dept values(505,"BCA","third_floor");
Query OK, 1 row affected (0.09 sec)


mysql> insert into employee values(501,"BSc",101,"john",98979695,"typist",20000);
Query OK, 1 row affected (0.16 sec)

mysql> insert into employee values(502,"BA",102,"rahul",70484374,"hr",7000);
Query OK, 1 row affected (0.14 sec)

mysql> insert into employee values(501,"BSc",103,"haritha",98955431,"cio",8000);
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values(505,"BCA",104,"arun",66697188,"sd",4000);
Query OK, 1 row affected (0.16 sec)

mysql> insert into employee values(504,"BBA",105,"praveen",86751438,"ssd",4500);
Query OK, 1 row affected (0.12 sec)

(ii) Display all the records from the above tables


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
5 rows in set (0.04 sec)

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

(iii) Display the empno and name of all the employees from department no2


mysql> select emp_name ,emp_no from employee where dept_no= 502;
+----------+--------+
| emp_name | emp_no |
+----------+--------+
| rahul    |    102 |
+----------+--------+
1 row in set (0.09 sec)


(iv) Display empno,name,designation,dept no and salary in the descending order of salary


mysql> select emp_no,emp_name,designation,dept_no,salary from employee order by salary desc;
+--------+----------+-------------+---------+--------+
| emp_no | emp_name | designation | dept_no | salary |
+--------+----------+-------------+---------+--------+
|    101 | john     | typist      |     501 |  20000 |
|    103 | haritha  | cio         |     501 |   8000 |
|    102 | rahul    | hr          |     502 |   7000 |
|    105 | praveen  | ssd         |     504 |   4500 |
|    104 | arun     | sd          |     505 |   4000 |
+--------+----------+-------------+---------+--------+
5 rows in set (0.06 sec)


(v) Display the empno and name of all employees whose salary is between 2000 and 5000


mysql> select emp_no,emp_name,salary from employee where salary between 2000 and 5000;
+--------+----------+--------+
| emp_no | emp_name | salary |
+--------+----------+--------+
|    104 | arun     |   4000 |
|    105 | praveen  |   4500 |
+--------+----------+--------+
2 rows in set (0.03 sec)


(vi) Display all designations without duplicate values.


mysql> select distinct designation from employee;
+-------------+
| designation |
+-------------+
| typist      |
| hr          |
| cio         |
| sd          |
| ssd         |
+-------------+
5 rows in set (0.11 sec)


(vii) Display the dept name and total salary of employees of each department.


mysql> select dept_name,sum(salary) from employee group by dept_name;
+-----------+-------------+
| dept_name | sum(salary) |
+-----------+-------------+
| BSc       |       28000 |
| BA        |        7000 |
| BCA       |        4000 |
| BBA       |        4500 |
+-----------+-------------+
4 rows in set (0.05 sec)


(viii) Change the salary of employees to 25000 whose designation is ‘Typist’


mysql> update employee set salary= 25000 where designation="typist";
Query OK, 1 row affected (0.15 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+---------+-----------+--------+----------+----------+-------------+--------+
| dept_no | dept_name | emp_no | emp_name | mob_no   | designation | salary |
+---------+-----------+--------+----------+----------+-------------+--------+
|     501 | BSc       |    101 | john     | 98979695 | typist      |  25000 |
|     502 | BA        |    102 | rahul    | 70484374 | hr          |   7000 |
|     501 | BSc       |    103 | haritha  | 98955431 | cio         |   8000 |
|     505 | BCA       |    104 | arun     | 66697188 | sd          |   4000 |
|     504 | BBA       |    105 | praveen  | 86751438 | ssd         |   4500 |
+---------+-----------+--------+----------+----------+-------------+--------+
5 rows in set (0.32 sec)


(ix) Change the mobile no of employee named ‘john’


mysql> update employee set mob_no=90723456 where emp_name="john";
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+---------+-----------+--------+----------+----------+-------------+--------+
| dept_no | dept_name | emp_no | emp_name | mob_no   | designation | salary |
+---------+-----------+--------+----------+----------+-------------+--------+
|     501 | BSc       |    101 | john     | 90723456 | typist      |  25000 |
|     502 | BA        |    102 | rahul    | 70484374 | hr          |   7000 |
|     501 | BSc       |    103 | haritha  | 98955431 | cio         |   8000 |
|     505 | BCA       |    104 | arun     | 66697188 | sd          |   4000 |
|     504 | BBA       |    105 | praveen  | 86751438 | ssd         |   4500 |
+---------+-----------+--------+----------+----------+-------------+--------+
5 rows in set (0.04 sec)


(x) Delete all employees whose salaries are equal to Rs.7000


mysql> delete from employee where salary=7000;
Query OK, 1 row affected (0.15 sec)

mysql> select * from employee;
+---------+-----------+--------+----------+----------+-------------+--------+
| dept_no | dept_name | emp_no | emp_name | mob_no   | designation | salary |
+---------+-----------+--------+----------+----------+-------------+--------+
|     501 | BSc       |    101 | john     | 90723456 | typist      |  25000 |
|     501 | BSc       |    103 | haritha  | 98955431 | cio         |   8000 |
|     505 | BCA       |    104 | arun     | 66697188 | sd          |   4000 |
|     504 | BBA       |    105 | praveen  | 86751438 | ssd         |   4500 |
+---------+-----------+--------+----------+----------+-------------+--------+
4 rows in set (0.00 sec)


(xi) Select the department that has total salary paid for its employees more than 25000


mysql> select dept_name from employee group by dept_no having sum(salary)>25000;
+-----------+
| dept_name |
+-----------+
| BSc       |
+-----------+
1 row in set (0.05 sec)


