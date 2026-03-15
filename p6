SQL> CREATE TABLE Sailors ( 
        sid     NUMBER       PRIMARY KEY, 
        sname   VARCHAR2(14) NOT NULL, 
       rating  NUMBER, 
       age     NUMBER   ); 
 
Table created. 
 
SQL> CREATE TABLE Boats ( 
        bid     NUMBER       PRIMARY KEY, 
        bname   VARCHAR2(15) NOT NULL, 
      color   VARCHAR2(10)    ); 
 
Table created. 
 
SQL> CREATE TABLE Reserves ( 
        sid     NUMBER, 
        bid     NUMBER, 
        day     DATE, 
        PRIMARY KEY (sid, bid, day), 
        FOREIGN KEY (sid) REFERENCES Sailors(sid), 
        FOREIGN KEY (bid) REFERENCES Boats(bid)  ); 
 
Table created. 
 
 
SQL> --INSERT Records into Boats 
SQL> INSERT INTO Boats (bid, bname, color) VALUES (101, 'Ocean Queen', 'Red'); 
 
1 row created. 
 
SQL> INSERT INTO Boats (bid, bname, color) VALUES (102, 'Sea Rider', 'Blue'); 
 
1 row created. 
 
SQL> INSERT INTO Boats (bid, bname, color) VALUES (103, 'Wave Master', 'Green'); 
KG College of Arts and Science (Autonomous)  
Lab Manual-2024 Batch Onwards 
1 row created. 
SQL> INSERT INTO Boats (bid, bname, color) VALUES (104, 'Sunset Cruiser', 'Yellow'); 
1 row created. 
SQL> INSERT INTO Boats (bid, bname, color) VALUES (105, 'Storm Runner', 'Black'); 
1 row created. 
SQL>  
SQL> --INSERT Records into Reserves 
SQL> INSERT INTO Reserves (sid, bid, day)  
2  VALUES (1, 101, TO_DATE('2025-01-10', 'YYYY-MM-DD')); 
1 row created. 
SQL>  
SQL> INSERT INTO Reserves (sid, bid, day)  
2  VALUES (1, 102, TO_DATE('2025-01-12', 'YYYY-MM-DD'));
1 row created. 
SQL>  
SQL> INSERT INTO Reserves (sid, bid, day)  
2  VALUES (2, 103, TO_DATE('2025-01-11', 'YYYY-MM-DD')); 
1 row created. 
SQL>  
SQL> INSERT INTO Reserves (sid, bid, day)  
2  VALUES (3, 101, TO_DATE('2025-01-15', 'YYYY-MM-DD')); 
1 row created. 
SQL>  
SQL> INSERT INTO Reserves (sid, bid, day)  
2  VALUES (4, 104, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
1 row created. 
SQL> commit; 
Commit complete.
SQL> select * from SAILORS; 
 
       SID SNAME               RATING        AGE ---------- --------------- ---------- ---------- 
         1 John                     7         25 
         2 Mary                     5         30 
         3 Alex                     8         22 
         4 Ravi                     6         28 
         5 Sita                     9         27 
 
SQL>  select * from Boats; 
 
       BID BNAME           COLOR ---------- --------------- -------------------- 
       101 Ocean Queen     Red 
       102 Sea Rider       Blue 
       103 Wave Master     Green 
       104 Sunset Cruiser  Yellow 
       105 Storm Runner    Black 
 
SQL>  select * from RESERVES; 
 
       SID        BID DAY ---------- ---------- --------- 
         1        101 10-JAN-25 
         1        102 12-JAN-25 
         2        103 11-JAN-25 
         3        101 15-JAN-25 
         4        104 16-JAN-25 
 
INNER JOIN   : Shows only rows that match in all tables.
SQL> SELECT S.sid, S.sname, B.bname, R.day 
  2  FROM Sailors S 
  3  INNER JOIN Reserves R ON S.sid = R.sid 
  4  INNER JOIN Boats B ON B.bid = R.bid; 
 
       SID SNAME           BNAME           DAY ---------- --------------- --------------- --------- 
         3 Alex            Ocean Queen     15-JAN-25 
         1 John            Ocean Queen     10-JAN-25 
         1 John            Sea Rider       12-JAN-25 
         2 Mary            Wave Master     11-JAN-25
          Ravi            Sunset Cruiser  16-JAN-25 
 
 
LEFT OUTER JOIN : Shows all sailors, even those who never reserved a boat. 
 
SQL> SELECT S.sid, S.sname, B.bname, R.day 
  2  FROM Sailors S 
  3  LEFT JOIN Reserves R ON S.sid = R.sid 
  4  LEFT JOIN Boats B ON B.bid = R.bid; 
 
       SID SNAME           BNAME           DAY ---------- --------------- --------------- --------- 
         3 Alex            Ocean Queen     15-JAN-25 
         1 John            Ocean Queen     10-JAN-25 
         1 John            Sea Rider       12-JAN-25 
         2 Mary            Wave Master     11-JAN-25 
         4 Ravi            Sunset Cruiser  16-JAN-25 
         5 Sita 
 
 RIGHT OUTER JOIN : Shows all boats even if no sailor reserved them. 
 
SQL> SELECT S.sname, B.bname, R.day 
  2  FROM Sailors S 
  3  RIGHT JOIN Reserves R ON S.sid = R.sid 
  4  RIGHT JOIN Boats B ON B.bid = R.bid; 
 
SNAME           BNAME           DAY --------------- --------------- --------- 
John            Sea Rider       12-JAN-25 
John            Ocean Queen     10-JAN-25 
Mary            Wave Master     11-JAN-25 
Alex            Ocean Queen     15-JAN-25 
Ravi            Sunset Cruiser  16-JAN-25 
                   Storm Runner 
 
FULL OUTER JOIN : Returns all sailors and all boats, with matching and non-matching rows.
SQL> SELECT S.sid, S.sname, B.bid, B.bname, R.day 
  2  FROM Sailors S 
  3  FULL OUTER JOIN Reserves R ON S.sid = R.sid 
  4  FULL OUTER JOIN Boats B ON B.bid = R.bid; 
 
       SID SNAME                  BID BNAME           DAY
        Alex                   101 Ocean Queen     15-JAN-25 
         1 John                   101 Ocean Queen     10-JAN-25 
         1 John                   102 Sea Rider       12-JAN-25 
         2 Mary                   103 Wave Master     11-JAN-25 
         4 Ravi                   104 Sunset Cruiser  16-JAN-25 
         5 Sita 
                                  105 Storm Runner 
 
NATURAL JOIN  :  
Oracle will join using columns with identical names automatically  
 
 
SQL> SELECT sid, S.sname, R.day 
  2  FROM Sailors S 
  3  NATURAL JOIN Reserves R; 
 
       SID SNAME           DAY ---------- --------------- --------- 
         1 John            10-JAN-25 
         1 John            12-JAN-25 
         2 Mary            11-JAN-25 
         3 Alex            15-JAN-25 
         4 Ravi            16-JAN-25
