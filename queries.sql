-- group members:
---- Chaitanya Ganni    - G01413209
---- Alfonso Romero     - G01223674
---- Kumar Shubham      - G01402581
---- Karthik Vanka      - G01371117 
-- assignment: Project Component 3
-- course: CS 550 Database Systems
-- professor: Dr. Wassim Itani

--1) Select the offer id, action, and date provided by a particular branch name.

SELECT
O.OFFER_ID, O.ACTION, O.O_DATE
FROM OFFERS O 
JOIN OFFERS_BRANCHES OB 
ON O.OFFER_ID = OB.OFFER_ID
JOIN BRANCHES B
ON OB.BRANCH_ID = B.BRANCH_ID
WHERE B.BRANCH_NAME = 'West End Branch'; 

--2) Display all the transaction references, transaction amounts, the number of points collected from each transaction, and the transaction date for a particular customer name.

SELECT T.TREF AS TRANSACTION_REFERENCE, T.AMOUNT, T.T_POINTS, T.T_DATE
FROM TRANSACTIONS T
JOIN CUSTOMERS C
ON T.CID = C.CID
WHERE C.CNAME = 'John Smith';

--3) Find the branch IDs and the number of offers provided by each branch id.

SELECT
B.BRANCH_ID, 
COUNT(OB.OFFER_ID) AS NUMBER_OF_OFFERS
FROM BRANCHES B 
LEFT JOIN OFFERS_BRANCHES OB 
ON B.BRANCH_ID = OB.BRANCH_ID
GROUP BY B.BRANCH_ID
ORDER BY B.BRANCH_ID;

--4) Find the branch names and the number of offers provided by each branch name.

SELECT
B.BRANCH_NAME, 
COUNT(OB.OFFER_ID) AS NUMBER_OF_OFFERS
FROM BRANCHES B 
LEFT JOIN OFFERS_BRANCHES OB 
ON B.BRANCH_ID = OB.BRANCH_ID
GROUP BY B.BRANCH_NAME
ORDER BY B.BRANCH_NAME;

--5) Display for a particular transaction reference, the transaction reference, date, time, amount, the number of points collected, and the product ids and names included in the transaction with their quantities, prices, and number of points.

SELECT 
T.TREF AS TRANSACTION_REFERENCE, 
T.T_DATE AS TRANSACTION_DATE, 
T.T_TIME AS TRANSACTION_TIME, 
T.AMOUNT AS TRANSACTION_AMOUNT, 
T.T_POINTS AS TRANSACTION_POINTS_COLLECTED, 
P.PROD_ID AS PRODUCT_ID, 
P.PROD_NAME AS PRODUCT_NAME, 
TP.QUANTITY AS QUANTITIES, 
P.PRICE AS PRICES, 
P.PROD_POINTS  AS NUMBER_OF_POINTS
FROM TRANSACTIONS T
LEFT JOIN TRANSACTIONS_PRODUCTS TP
ON T.TREF = TP.TREF
LEFT JOIN PRODUCTS P
ON TP.PROD_ID = P.PROD_ID
WHERE T.TREF = 'T1';

--6) Find the number of expired cards available in the database.

SELECT 
COUNT(*) AS NUMBER_OF_EXPIRED_CARDS 
FROM CARDS 
WHERE STATUS = 'E';

--7) Find the customer with the maximum number of expired cards.

WITH ExpiredCardCounts AS 
(
  SELECT CU.CID, CU.CNAME, COUNT(CA.CARD_ID) AS NUM_OF_EXP_CARDS
  FROM CUSTOMERS CU
  LEFT JOIN Cards CA ON CU.CID = CA.CID
  WHERE STATUS = 'E'
  GROUP BY CU.CID, CU.CNAME
)
SELECT CID, CNAME, NUM_OF_EXP_CARDS FROM ExpiredCardCounts
WHERE NUM_OF_EXP_CARDS = (SELECT MAX(NUM_OF_EXP_CARDS) FROM ExpiredCardCounts);


--8) Find the redemption history of a particular customer name. You should display the prize ID, prize description, customer name,center id, and number of points redeemed.

SELECT 
RH.PRIZE_ID, 
P.P_DESCRIPTION AS PRIZE_DESCRIPTION,
C.CNAME,
RH.CENTER_ID,
RH.QUANTITY * P.POINTS_NEEDED AS NUM_OF_POINTS_REDEEMED
FROM REDEMPTION_HISTORY RH
LEFT JOIN PRIZES P
ON RH.PRIZE_ID = P.PRIZE_ID
LEFT JOIN CUSTOMERS C
ON RH.CID = C.CID
WHERE CNAME = 'John Smith';

--9) Display the name and occupation of the members of a particular family name.

SELECT C.CNAME, C.OCCUPATION
FROM FAMILIES F 
JOIN CUSTOMERS C
ON F.FAMILY_ID = C.FAMILY_ID
WHERE F.FAMILY_NAME = 'Smith';

--10) Display the sum of points of the members of a particular family ID.

SELECT SUM(NUM_OF_POINTS) AS SUM_OF_POINTS 
FROM POINT_ACCOUNTS
WHERE FAMILY_ID = 1;

--11) Display the customer name with the maximum number of collected points.

WITH CTE AS 
(
    SELECT CID, SUM(NUM_OF_POINTS) AS SUM_OF_POINTS 
    FROM POINT_ACCOUNTS 
    GROUP BY CID
)
SELECT CNAME 
FROM CTE C1
JOIN CUSTOMERS C2
ON C1.CID = C2.CID
WHERE SUM_OF_POINTS = (SELECT MAX(SUM_OF_POINTS) FROM CTE);

--12) Find the total number of points redeemed on a particular date.

SELECT SUM(RH.QUANTITY * P.POINTS_NEEDED) AS TOTAL_POINTS_REDEEMED 
FROM REDEMPTION_HISTORY RH
JOIN PRIZES P ON RH.PRIZE_ID = P.PRIZE_ID
WHERE R_DATE = TO_DATE('10-11-2023', 'MM-DD-YYYY');

--13) Find the number of prizes redeemed by a particular customer id.

SELECT SUM(RH.QUANTITY) AS TOTAL_PRIZES_REDEEMED
FROM REDEMPTION_HISTORY RH
JOIN PRIZES P ON rh.PRIZE_ID = P.PRIZE_ID
WHERE RH.CID = 11;

--14) Find the number of customers who redeemed prizes from a particular center id.

SELECT COUNT(*) AS NUM_OF_CUSTOMERS
FROM CUSTOMERS C
JOIN REDEMPTION_HISTORY RH
ON C.CID = RH.CID
WHERE RH.CENTER_ID = 102;

--15) Find the total number of prizes in the database.

SELECT COUNT(*) AS TOTAL_NUM_OF_PRIZES 
FROM PRIZES;

--16) Display a list of customer names living in Fairfax and whose occupation is Engineer.

SELECT CNAME
FROM CUSTOMERS C
JOIN ADDRESSES A
ON C.CID = A.CID
WHERE A.CITY = 'Fairfax' AND C.OCCUPATION = 'Engineer';

--17) Find the list of products not included in any tansaction.

SELECT P.PROD_NAME AS PRODUCT
FROM PRODUCTS P
LEFT JOIN TRANSACTIONS_PRODUCTS TP 
ON P.PROD_ID = TP.PROD_ID
WHERE TP.TREF IS NULL;

--18) Find the product bought the most by customers

WITH CTE AS
(
    SELECT TP.PROD_ID, P.PROD_NAME, SUM(TP.QUANTITY) AS TOTAL_QUANTITY_BOUGHT
    FROM TRANSACTIONS_PRODUCTS TP
    JOIN PRODUCTS P ON TP.PROD_ID = P.PROD_ID
    GROUP BY TP.PROD_ID, P.PROD_NAME        
)
SELECT PROD_NAME, TOTAL_QUANTITY_BOUGHT FROM CTE 
WHERE TOTAL_QUANTITY_BOUGHT = (SELECT MAX(TOTAL_QUANTITY_BOUGHT) FROM CTE);