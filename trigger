
SQL*Plus: Release 23.0.0.0.0 - Production on Wed Sep 10 14:51:11 2025
Version 23.9.0.25.07

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Wed Sep 10 2025 14:11:36 +05:30

Connected to:
Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.9.0.25.07

SQL>  create table clientMaster(SrNo INT, name varchar(30), adress varchar(80), salary number(6,4));
 create table clientMaster(SrNo INT, name varchar(30), adress varchar(80), salary number(6,4))
              *
ERROR at line 1:
ORA-00955: name is already used by an existing object
Help: https://docs.oracle.com/error-help/db/ora-00955/


SQL> create table audits as select * from clientMaster;

Table created.

SQL> desc audits
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SRNO                                               NUMBER(38)
 NAME                                               VARCHAR2(30)
 ADRESS                                             VARCHAR2(80)
 SALARY                                             NUMBER(6,4)

SQL> insert into clientmaster values(101,'Hitesh','new york st 123',800000);
insert into clientmaster values(101,'Hitesh','new york st 123',800000)
                                                               *
ERROR at line 1:
ORA-01438: value 800000 greater than specified precision (6, 4) for column
Help: https://docs.oracle.com/error-help/db/ora-01438/


SQL>  insert into clientmaster values(101,'Hitesh','new york st 123',8000);
 insert into clientmaster values(101,'Hitesh','new york st 123',8000)
                                                                *
ERROR at line 1:
ORA-01438: value 8000 greater than specified precision (6, 4) for column
Help: https://docs.oracle.com/error-help/db/ora-01438/


SQL> insert into clientmaster values(101,'Hitesh','new york st 123',80);

1 row created.

SQL> insert into clientmaster values(102,'Yash', 'columbo main st',55);

1 row created.

SQL> select * from clientMaster;

      SRNO NAME
---------- ------------------------------
ADRESS
--------------------------------------------------------------------------------
    SALARY
----------
       101 Hitesh
new york st 123
        80

       102 Yash
columbo main st
        55

      SRNO NAME
---------- ------------------------------
ADRESS
--------------------------------------------------------------------------------
    SALARY
----------


SQL> @pathC:\Users\System05\Downloads\trigger2.sql;
SP2-0310: unable to open file "pathC:\Users\System05\Downloads\trigger2.sql"
Help: https://docs.oracle.com/error-help/db/sp2-0310/
SQL> @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL> @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL>  @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL> @trigger.sql;
SP2-0310: unable to open file "trigger.sql"
Help: https://docs.oracle.com/error-help/db/sp2-0310/
SQL> @trigger2.sql;
SP2-0310: unable to open file "trigger2.sql"
Help: https://docs.oracle.com/error-help/db/sp2-0310/
SQL>  @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL> @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL> @C:\Users\System05\Downloads\trigger2.sql;

Warning: Trigger created with compilation errors.

SQL> desc clientMaster;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SRNO                                               NUMBER(38)
 NAME                                               VARCHAR2(30)
 ADRESS                                             VARCHAR2(80)
 SALARY                                             NUMBER(6,4)

SQL> desc audits;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SRNO                                               NUMBER(38)
 NAME                                               VARCHAR2(30)
 ADRESS                                             VARCHAR2(80)
 SALARY                                             NUMBER(6,4)

SQL>  @C:\Users\System05\Downloads\trigger2.sql;

Trigger created.

SQL> update clientMaster set name = 'karan' where SrNo = 101;

1 row updated.

SQL> select * from audits;

      SRNO NAME
---------- ------------------------------
ADRESS
--------------------------------------------------------------------------------
    SALARY
----------
       101 Hitesh




SQL> C:\Users\System05\Desktop\trigger3.sql;
SP2-0023: String not found.
Help: https://docs.oracle.com/error-help/db/sp2-0023/
SQL> @SQL> C:\Users\System05\Desktop\trigger4.sql;
SP2-0556: Invalid file name.
Help: https://docs.oracle.com/error-help/db/sp2-0556/
SQL> SP2-0023: String not found.
SP2-0734: unknown command beginning "SP2-0023: ..." - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0734/
SQL> @ C:\Users\System05\Desktop\trigger4.sql;

Warning: Trigger created with compilation errors.

SQL> @ C:\Users\System05\Desktop\trigger4.sql;

Warning: Trigger created with compilation errors.

SQL> @ C:\Users\System05\Desktop\trigger4.sql;

Warning: Trigger created with compilation errors.

SQL> @ C:\Users\System05\Desktop\trigger4.sql;

Trigger created.

SQL> DELETE FROM audits;
DELETE FROM audits
            *
ERROR at line 1:
ORA-04098: trigger 'SYSTEM.TRIGGERUPDATE' is invalid and failed re-validation
Help: https://docs.oracle.com/error-help/db/ora-04098/


SQL>





trigger program for backup:

CREATE OR REPLACE TRIGGER masterTrigger
BEFORE UPDATE OR DELETE
ON clientMaster
FOR EACH ROW
BEGIN
INSERT INTO audits(SrNo,name)
values(:old.SrNo,:old.name);
end;
/


trigger program for update and delete : 

create or replace trigger xyz
before delete or update on audits
begin
if rtrim(upper(To_char(sysdate,'day'))) = 'WEDNESDAY' then 
RAISE_APPLICATION_ERROR(-20011,'can not perform delete or update
 operation');
end if;
end;
/
