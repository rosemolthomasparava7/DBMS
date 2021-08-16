CREATE TABLE SAILORS
 (
 SID INT,
 SNAME VARCHAR(10),
 RATING INT,
 AGE INT
 );
 
 DESCRIBE TABLE SAILORS; 
 INSERT INTO SAILORS(SID,SNAME,RATING,AGE)VALUES(22, 'Dustin', 7, 45),
 (29, 'Brutas', 1, 33),
 (31, 'Lubber', 8, 55),
 (32, 'Andy', 8, 25),(58, 'Rusty', 10, 35),
 (64, 'Horatio', 7, 35),
 (71, 'Zorba', 10, 16),(74, 'Horatio', 9, 35),
 (85, 'Art', 3, 26),(95, 'Bob', 3, 64);
 
 SELECT * FROM SAILORS;
 
 CREATE TABLE BOATS
(
BID  INT,
BNAME  VARCHAR(10),
COLOR VARCHAR(10)
);

DESCRIBE TABLE BOATS;

INSERT INTO BOATS(BID,BNAME,COLOR)VALUES(101,'INTERLAKE','BLUE'),
(102,'INTERLAKE','RED'),(103,'CLIPPER','GREEN'),(104,'MARINE','RED');

SELECT * FROM BOATS;

CREATE TABLE RESERVES
(
SID  INT,
BID  INT,
DAY DATE
);

INSERT INTO RESERVES(SID,BID,DAY)VALUES(22,101,'98-10-10'),
(22,102,'98-10-10'),(22,103,'98-08-10'),(22,104,'98-07-10'),
(31,102,'98-10-11'),(31,103,'98-06-11'),(31,104,'98-12-11'),
(64,101,'98-05-09'),(64,102,'98-08-09'),(74,103,'98-08-09');
 
SELECT * FROM RESERVES;

SELECT SNAME,AGE FROM SAILORS;

SELECT * FROM SAILORS,RESERVES WHERE SAILORS.SID = RESERVES.SID AND BID = 101;

SELECT SNAME FROM SAILORS WHERE RATING>7;
 
SELECT SNAME FROM SAILORS,RESERVES,BOATS WHERE BOATS.BID = 103 AND
 BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID;
 
 SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE COLOR = 'RED' AND BOATS.BID = RESERVES.BID 
 AND SAILORS.SID = RESERVES.SID ORDER BY AGE ASC;
 
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE ( COLOR = 'RED' OR COLOR = 'GREEEN') AND 
BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID ;

SELECT DISTINCT COLOR FROM SAILORS,RESERVES,BOATS WHERE SNAME = 'LUBBER'AND
 BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID;
 
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE COLOR = 'RED'AND
BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.BID UNION
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE color = 'GREEN' AND
 BOATS.BID = RESERVES.BID AND SAILORS.SID= RESERVES.SID;
 
 SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE SAILORS.SID=RESERVES.SID;
 
 SELECT SNAME,RESERVES.SID FROM RESERVES,SAILORS WHERE SAILORS.SID =RESERVES.SID
 GROUP BY DAY,RESERVES.SID,SNAME HAVING COUNT(DAY)>1 ;
 
 SELECT SNAME,AGE FROM SAILORS WHERE AGE=(SELECT MIN(AGE) FROM SAILORS);
 
 SELECT SNAME,RATING FROM SAILORS WHERE RATING>(SELECT MAX(RATING) FROM SAILORS WHERE SNAME='horatio');
 
  SELECT sname FROM(SELECT sname,reserves.sid,COUNT(bid) AS id FROM RESERVES,SAILORS
WHERE reserves.sid = sailors.sid GROUP BY reserves.SID,sname) a WHERE id =( SELECT COUNT(bid) FROM BOATS);

  SELECT DISTINCT SNAME FROM SAILORS WHERE NOT EXISTS(SELECT * FROM BOATS 
  WHERE NOT EXISTS(SELECT * FROM RESERVES WHERE SAILORS.SID=RESERVES.SID AND BOATS.BID=RESERVES.BID));
  
 SELECT COUNT( DISTINCT SNAME )FROM SAILORS;
 
SELECT AVG(AGE)FROM SAILORS;

SELECT RATING,AVG(AGE) AS AVERAGE_AGE FROM SAILORS GROUP BY RATING;

SELECT a.RATING,b.MEAN FROM(SELECT COUNT(sname) AS num,rating FROM SAILORS GROUP BY RATING HAVING COUNT(SNAME)>1)a,
(SELECT RATING,AVG(age) AS MEAN FROM SAILORS GROUP BY RATING ) b WHERE a.RATING = b.RATING;
 
 
