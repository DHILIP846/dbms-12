1.CREATE A TABLE AS INVENTORY:  
SQL> create table inventory(prono number primary key,  
2  pronamevarchar(20),  
3  rate number);  
Table created.  
2.INSERT VALUES INTO INVENTORY TABLE:  
SQL> insert into inventory values(&prono,'&proname',&rate);  
Enter value for prono: 1001  
Enter value for proname: soap  
Enter value for rate: 30  
old   1: insert into inventory values(&prono,'&proname',&rate)  
new   1: insert into inventory values(1001,'soap',30)  
1 row created.  
SQL> /  
Enter value for prono: 1002  
Enter value for proname: horlicks 
16  
Enter value for rate: 100  
old   1: insert into inventory values(&prono,'&proname',&rate)  
new   1: insert into inventory values(1002,'horlicks',100)  
1 row created.  
SQL> /  
Enter value for prono: 1003  
Enter value for proname: milkybar 
Enter value for rate: 50  
old   1: insert into inventory values(&prono,'&proname',&rate)  
new   1: insert into inventory values(1003,'milkybar',50)  
1 row created.  
SQL> /  
Enter value for prono: 1004  
Enter value for proname: chocobar 
Enter value for rate: 40  
old   1: insert into inventory values(&prono,'&proname',&rate)  
new   1: insert into inventory values(1004,'chocobar',40)  
 
1 row created.  
 
3.SELECT ALL THE ROWS IN INVENTORY TABLE:  
SQL> select * from inventory;  
 
     PRONO PRONAME       RATE                                   ---------- -------------------- ----------                                   
      1001 soap                         30                                       
      1002 horlicks                  100                            
      1003 milkybar                  50                                  
      1004 chocobar                  40                                   
 
4.UPDATE THE COLUMN AS RATE:  
SQL>   begin 
   update inventory set rate=rate+(rate*20/100);  
  commit;  
end; 
/ 
 
PL/SQL procedure successfully completed.  
 
5. SELECT ALL THE ROWS IN INVENTORY TABLE:  
SQL> select * from inventory;  
     PRONO PRONAME      RATE                                   ---------- -------------------- ----------                                   
      1001 soap                         36                                             
      1002 horlicks                   120                                
      1003 milkybar                   60                               
      1004 chocobar                   48                                   
 
6.ADDING ANEW COLUMN AS NO_OF_ITEMS IN INVENTORY TABLE: 
SQL> alter table inventory add no_of_items number;  
 
Table altered.  
 
7.DESCRIBEA INVENTORY TABLE:  
 
 
SQL>desc inventory;  
 Name                                     Null?    Type 
  --------------------------------------  -------- --------------------------  
 PRONO                                   NOT    NULL NUMBER  
 PRONAME                                          VARCHAR2(20)  
 RATE                                                   NUMBER  
 NO_OF_ITEMS                                  NUMBER  
 
8.UPDATE AN EXISTING COLUMNS IN INVENTORY TABLE:  
SQL> update inventory set no_of_items=case prono 
  when 1001 then 10  
  when 1002 then 8  
  when 1003 then 6  
  when 1004 then 4  
 end;  
 
4 rows updated.  
 
9. SELECT ALL THE ROWS IN INVENTORY TABLE:  
SQL> select * from inventory;  
 
PRONO PRONAME         RATE NO_OF_ITEMS                       ---------- -------------------- ---------- -------------------                       
      1001 soap                         36          10                      
      1002 horlicks                  120           8                       
      1003 milkybar                  60            6                           
      1004 chocobar                  48            4                       
 
