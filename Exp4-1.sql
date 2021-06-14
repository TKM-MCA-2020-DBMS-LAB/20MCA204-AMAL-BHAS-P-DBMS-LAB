mysql> use employee;
Database changed
mysql> create table emp(name varchar(30) not null,occupation varchar(30) not null,working_date date,working_hours varchar(15));
Query OK, 0 rows affected (1.93 sec)

mysql> insert into emp values('Yadhu','Scientist','2021-01-06',11);
Query OK, 1 row affected (0.26 sec)

mysql> insert into emp values('Albin','Engineer','2021-03-25',13);
Query OK, 1 row affected (0.10 sec)

mysql> insert into emp values('Fahad','Doctor','2021-02-16',12);
Query OK, 1 row affected (0.09 sec)

mysql> select * from emp;
+-------+------------+--------------+---------------+
| name  | occupation | working_date | working_hours |
+-------+------------+--------------+---------------+
| Yadhu | Scientist  | 2021-01-06   | 11            |
| Albin | Engineer   | 2021-03-25   | 13            |
| Fahad | Doctor     | 2021-02-16   | 12            |
+-------+------------+--------------+---------------+
3 rows in set (0.04 sec)

mysql> DELIMITER //
mysql> Create Trigger before_insert__empworkinghours
    -> BEFORE INSERT ON emp FOR EACH ROW
    -> BEGIN
    -> IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
    -> END IF;
    -> END //
Query OK, 0 rows affected (0.51 sec)

mysql> delimiter ;
mysql> insert into emp values('Gokul','Teacher','2021-02-18',10);
Query OK, 1 row affected (0.29 sec)

mysql> insert into emp values('Azif','Business','2021-03-10',14);
Query OK, 1 row affected (0.14 sec)

mysql> select * from emp;
+-------+------------+--------------+---------------+
| name  | occupation | working_date | working_hours |
+-------+------------+--------------+---------------+
| Yadhu | Scientist  | 2021-01-06   | 11            |
| Albin | Engineer   | 2021-03-25   | 13            |
| Fahad | Doctor     | 2021-02-16   | 12            |
| Gokul | Teacher    | 2021-02-18   | 10            |
| Azif  | Business   | 2021-03-10   | 14            |
+-------+------------+--------------+---------------+
5 rows in set (0.00 sec)

mysql> SHOW TRIGGERS;
+--------------------------------+--------+-------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                        | Event  | Table | Statement                                                                  | Timing | Created                | sql_mode                                   | Definer        | character_set_client | collation_connection | Database Collation |
+--------------------------------+--------+-------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| before_insert__empworkinghours | INSERT | emp   | BEGIN
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF;
END | BEFORE | 2021-06-14 23:19:58.48 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+--------------------------------+--------+-------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
1 row in set (0.25 sec)