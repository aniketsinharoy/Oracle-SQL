CREATE TABLE ZIPCODES(
ZIP NUMBER(6) PRIMARY KEY,
CITY VARCHAR2(30));

CREATE TABLE EMPLOYEES(
ENO NUMBER PRIMARY KEY,
ENAME VARCHAR2(25),
ZIP NUMBER(6) REFERENCES ZIPCODES(ZIP),
HDATE DATE);

CREATE TABLE CUSTOMERS(
CNO NUMBER PRIMARY KEY,
CNAME VARCHAR2(25),
STREET VARCHAR2(25),
ZIP NUMBER(6) REFERENCES ZIPCODES(ZIP),
PHONE NUMBER(10));

CREATE TABLE PARTS(
PNO NUMBER PRIMARY KEY,
PNAME VARCHAR2(25),
QOH NUMBER,
PRICE NUMBER,
LVL NUMBER);

CREATE TABLE ORDERS(
ONO NUMBER PRIMARY KEY,
CNO NUMBER REFERENCES CUSTOMERS(CNO),
ENO NUMBER REFERENCES EMPLOYEES(ENO),
PRECEIVED DATE,
SHIPPED DATE);

CREATE TABLE ODETAILS(
ONO NUMBER REFERENCES ORDERS(ONO),
PNO NUMBER REFERENCES PARTS(PNO),
QTY NUMBER,
PRIMARY KEY(ONO,PNO));

INSERT INTO ZIPCODES VALUES(700010,'Garia');
INSERT INTO ZIPCODES VALUES(700020,'Santoshpur');
INSERT INTO ZIPCODES VALUES(700030,'Naktalo');
INSERT INTO ZIPCODES VALUES(700040,'New Garia');
INSERT INTO ZIPCODES VALUES(700050,'Mumbai');

INSERT INTO EMPLOYEES VALUES(1,'Pinaky Roy',700010,'01-JAN-2000');
INSERT INTO EMPLOYEES VALUES(2,'Tiyasha Ghash',700010,'09-FEB-2000');
INSERT INTO EMPLOYEES VALUES(3,'Sumedha Sen',700030,'23-JAN-2000');
INSERT INTO EMPLOYEES VALUES(4,'Arnabi Dasoi',700040,'18-JUL-2000');
INSERT INTO EMPLOYEES VALUES(5,'Subhomiya Tipto',700040,'01-MAY-2020');

INSERT INTO CUSTOMERS VALUES(1,'Madhurom Jain','Shiv mondir Street','700010',7867564598);
INSERT INTO CUSTOMERS VALUES(2,'Shounaki Rakti','Bashtola Street','700040',9967564598);
INSERT INTO CUSTOMERS VALUES(3,'Triasa Chup','Shiv mondir Street','700010',9767564598);
INSERT INTO CUSTOMERS VALUES(4,'Kartik CR','JK Street','700030',9997764598);
INSERT INTO CUSTOMERS VALUES(5,'Prajeet Guho','Shiv mondir Street','700010',8867564598);

INSERT INTO PARTS VALUES(1,'Nut',1000,10,100);
INSERT INTO PARTS VALUES(2,'Bolt',2000,20,100);
INSERT INTO PARTS VALUES(3,'Screw',1000,30,200);
INSERT INTO PARTS VALUES(4,'Wire',6000,10,300);
INSERT INTO PARTS VALUES(5,'Cable',3000,100,200);

INSERT INTO ORDERS VALUES(1,1,1,'12-FEB-2022','12-JAN-2022');
INSERT INTO ORDERS VALUES(2,2,5,'11-FEB-2022','10-FEB-2022');
INSERT INTO ORDERS VALUES(3,3,1,'22-MAR-2022','10-MAR-2022');
INSERT INTO ORDERS VALUES(4,4,3,'12-JAN-2021','06-JAN-2022');
INSERT INTO ORDERS VALUES(5,1,1,'28-FEB-2022','01-MAR-2021');

INSERT INTO ODETAILS VALUES(1,1,10);
INSERT INTO ODETAILS VALUES(2,5,20);
INSERT INTO ODETAILS VALUES(3,5,300);
INSERT INTO ODETAILS VALUES(4,3,5);
INSERT INTO ODETAILS VALUES(5,2,50);

SELECT PNO,PNAME FROM PARTS WHERE PRICE<20;

SELECT DISTINCT(PNO) FROM ODETAILS;

SELECT * FROM CUSTOMERS WHERE CNAME LIKE 'S%';

SELECT O.ONO,C.CNAME FROM ORDERS O,CUSTOMERS C WHERE C.CNO=O.CNO AND O.SHIPPED IS NULL;

SELECT C.CNAME,E.ENAME FROM ORDERS O,CUSTOMERS C,EMPLOYEES E WHERE O.CNO=C.CNO AND O.ENO=E.ENO;

SELECT ENAME FROM EMPLOYEES WHERE HDATE=(SELECT MIN(HDATE) FROM EMPLOYEES);

SELECT PNO,PNAME,PRICE FROM PARTS WHERE PRICE>20000 ORDER BY PNO;

----------->>>>>SELECT P.PNO,P.PNAME,P.PRICE*O.QTY FROM PARTS P,ODETAILS O WHERE P.PNO=O.PNO;

SELECT SUM(QTY) FROM ODETAILS WHERE PNO=10601;

SELECT E.ENO FROM EMPLOYEES E,ZIPCODES Z WHERE E.ZIP=Z.ZIP AND Z.CITY LIKE 'Mumbai'; 