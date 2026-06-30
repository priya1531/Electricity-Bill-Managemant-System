CREATE DATABASE Billsystem;
USE Billsystem;
CREATE TABLE ElectBill(
  ConsumerID INT PRIMARY KEY,
  ConsumerName VARCHAR(50),
  Area VARCHAR(30),
  ConnectionType VARCHAR(20),
  PreviousReading INT,
  CurrentReading INT,
  UnitsConsumed INT,
  BillAmount INT,
  PaymentStatus VARCHAR(20),
  BillDate Date
);
SELECT * FROM ElectBill

INSERT INTO ElectBill VALUES(1101,'ARUN','SULUR','DOMESTIC',1000,550,70,650,'Paid','2026-03-20'),
(1102,'BANU','IRUGUR','DOMESTIC',1250,570,125,500,'Paid','2026-03-22'),
(1103,'CHARLES','HOPES','INDUSTRIAL',8000,9200,1200,9600,'Overdue','2026-03-14'),
(1104,'DANIEL','GANDHIPURAM','COMMERCIAL',3200,3650,450,3100,'Pending','2026-03-29'),
(1105,'EVA','RSPURAM','DOMESTIC',1400,490,150,750,'Paid','2026-04-02'),
(1106,'FATHIMA','POLLACHI','DOMESTIC',2000,1105,200,800,'Pending','2026-04-07'),
(1107,'GUGAN','GANAPATHY','COMMERCIAL',3500,3700,500,3205,'Paid','2026-04-11'),
(1108,'HEBSHI','SINGANALLUR','DOMESTIC',1350,600,130,820,'Overdue','2026-04-13'),
(1109,'INDHU','ONDIPUDHUR','INDUSTRIAL',10000,9500,3000,9800,'Paid','2026-04-15'),
(1110,'JACK','PALLADAM','DOMESTIC',1600,900,175,850,'Pending','2026-04-23');

SELECT * FROM ElectBill;

SELECT * FROM ElectBill
WHERE BillAmount > 1000;

SELECT  * FROM ElectBill
WHERE PreviousReading > 2000;

SELECT * FROM ElectBill
WHERE UnitsConsumed > 500;

SELECT  ConsumerID,ConsumerName,CurrentReading FROM ElectBill
WHERE CurrentReading > 3000;


SELECT ConsumerName,BillAmount FROM ElectBill;

SELECT ConsumerName,Area,PaymentStatus,BillDate FROM ElectBill;

SELECT * FROM ElectBill
WHERE PaymentStatus = 'PAID';

SELECT ConsumerName,ConnectionType FROM ElectBill
WHERE ConnectionType = 'DOMESTIC';

SELECT ConsumerName,ConnectionType FROM ElectBill
WHERE NOT ConnectionType='DOMESTIC';

SELECT BillDate,ConsumerName,PaymentStatus FROM ElectBill;

SELECT ConsumerName,Area,BillDate FROM ElectBill
WHERE BillDate='2026-03-22';

UPDATE ElectBill
SET BillAmount='600'
WHERE ConsumerID=1101;

UPDATE ElectBill
SET BillAmount='650'
    Area='Ravathur'
WHERE ConsumerID=1101;

SELECT COUNT(BillAmount)
FROM  ElectBill;

CREATE TABLE ComplaintReg(
     ComplaintID INT PRIMARY KEY,
     Area VARCHAR(30),
     ComplaintType VARCHAR(30),
     Description VARCHAR(50),
     ComplaintDate DATE,
     Status VARCHAR(20),
     AssignedTo VARCHAR(50),
     ResolvedDate DATE,
     Priority VARCHAR(10),
     Remarks VARCHAR(50)
);
SELECT * FROM ComplaintReg;
INSERT INTO ComplaintReg VALUES
(101,'RAVATHUR','METER FAULT','METER NOT ROTATING','2026-03-10','RESOLVED','RAMESH','2026-03-12','LOW','REPLACED METER'),
(102,'IRUGUR','BILLING ERROR','WRONG UNIT CHARGED','2026-03-15','PENDING','SURESH','2026-03-18','MEDIUM','AWAITING VERIFICATION'),
(103,'HOPES','POWER CUT','FREQUENT POWER CUTS','2026-03-18','RESOLVED','KARTHIK','2026-03-26','HIGH','TRANSFORMER FIXED'),
(104,'GANDHIPURAM','WRONG READING','READING MISMATCH','2026-03-28','IN PROCESS','RAMESH','2026-03-31','LOW','SITE VISIT SCHEDULED'),
(105,'RS PURAM','NO POWER SUPPLY','COMPLETE OUTAGE 2 DAYS','2026-03-22','RESOLVED','SURESH','2026-03-23','HIGH','CABLE FAULT FIXED'),
(106,'POLLACHI','METER FAULT','DISPLAY NOT WORKING','2026-03-29','PENDING','KARTHIK','2026-04-02','MEDIUM','SPARE PART AWAITED'),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
(107,'GANAPATHY','BILLING ERROR','DUPLICATE BILL GENERARTED','2026-03-27','RESOLVED','RAMESH','2026-03-29','HIGH','DUPLICATE CANCELLED'),
(108,'SINGANALLUR','VOLTAGE FLUCTUATION','FREQUENT VOLTAGE DROP','2026-03-30','IN PROGESS','SURESH','2026-04-01','HIGH','TRANSFER CHECH PENDING'),
(109,'ONDIPUDUR','WRONG READING','READING NOT UPADATE','2026-04-01','PENDING','KARTHIK','2026-04-03','MEDIUM','FIELD VISIT NEEDED'),
(1010,'PALLADAM','METER FAULT','METER SPARKING ISSUE','2026-04-05','RESOLVED','RAMESH','2026-04-08','HIGH','METER REPLACED URGENTLY');                                                                                                                

EXEC sp_rename 'ComplaintReg.Area','AreaName','COLUMN'; 

SELECT * FROM ComplaintReg;

--INNER JOIN

SELECT
E.ConsumerID,
E.ConsumerName,
C.AreaName,
C.Status
FROM ElectBill E
INNER JOIN ComplaintReg C
ON E.Area=C.AreaName;

--LEFT JOIN

SELECT
E.ConsumerID,
E.ConsumerName,
C.AreaName,
C.Status
FROM ElectBill E
LEFT JOIN ComplaintReg C
ON E.Area=C.AreaName;
 
--SCENARIOS
--Team 4 – Electricity Bill Management System

1.Display all consumer details.
2.Find consumers who have not paid their bill.
3.Show consumers who used more than 300 units.
4.Find the lowest electricity bill.
5.Count consumers in each area.
6.Display consumers whose names start with 'D'.
7.Find bills between ₹500 and ₹2,000.
8.Display payment details in descending order.
9.Count paid and unpaid bills.
10.Display consumers who paid after the due date. 


--1.Display all consumer details.

    SELECT * FROM ElectBill,ComplaintReg;

--2.Find consumers who have not paid their bill.

    SELECT * FROM ElectBill
    WHERE  NOT PaymentStatus='Paid';

--3.Show consumers who used more than 300 units.

    SELECT * FROM ElectBill
    WHERE UnitsConsumed > 300;

--4.Find the lowest electricity bill.

    SELECT MIN(BillAmount) as BillAmount
    FROM ElectBill;

--5.Count consumers in each area.

    SELECT COUNT(Area) as Area
    FROM ElectBill;

--6.Display consumers whose names start with 'D'.
 
    SELECT * FROM  ElectBill
    WHERE ConsumerName LIKE 'D%';

--7.Find bills between ₹500 and ₹2,000.

    SELECT ConsumerName,BillAmount FROM ElectBill
    WHERE BillAmount >= 500 AND BillAmount <=2000;
 
--8.Display payment details in descending order.

    SELECT ConsumerID,BillAmount FROM ElectBill
    ORDER BY BillAmount DESC;

--9.Count paid and unpaid bills.

    SELECT COUNT (PaymentStatus) as PaymentStatus
    FROM ElectBill
    WHERE PaymentStatus IN ('Paid','Pending')
    GROUP BY PaymentStatus;

--10.Display consumers who paid after the due date. 
   
    SELECT ConsumerName,PaymentStatus
    FROM ElectBill
    WHERE PaymentStatus IN ('Overdue');
 
 SELECT ConsumerID,
        PreviousReading,
        CurrentReading
 From ElectBill
 WHERE CurrentReading < PreviousReading;