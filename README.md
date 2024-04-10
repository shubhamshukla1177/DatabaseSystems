# DatabaseSystems

## Project Component 1 Description: Design of a database system for a customer loyalty program

LoyaltyFirst Inc. is a music store that needs to develop a customer loyalty program supported by an Oracle database backend. The customer loyalty program also known as a "frequent customer" program identifies LoyaltyFirst customers as valued members through a card that accumulates loyalty points whenever they buy items from the LoyaltyFirst store. 
LoyaltyFirst Inc. is lucky enough to contact you and ask you to develop the database system that supports their loyalty program. A crude description of the business rules and operations is provided below. Note that this information might not be comprehensive or complete and sometimes you need, as a designer, to get back to LoyaltyFirst Inc. (the GTAs and Professor will play the role of LoyaltyFirst Inc.) to get more details to help you deliver a complete database design.

The process starts with the customer buying an affiliation kit that includes the loyalty card. The customer should fill some personal data such as: the Social Security Number, full name, family data, mailing address, and other demographic information such as age (date of birth), sex, martial status, occupation, etc. If the customer loses their card or if it is damaged due to use, they must buy a new one. Another card is issued with a different ID, but it remains linked to the same customer. 

The objective of the program is to foster customer loyalty towards attracting new customers, performing marketing analysis and sending promotions to specific market segments. This can be done through historical information of purchases associated with the customers personal and demographic data.
When the customers buy at one of the LoyaltyFirst stores, they are asked: do you have a frequent customer card? If so, the card is swiped through a reader or POS (point of sale) in which the card number is linked to the transaction or details of purchase that the customer makes in the store. Note that LoyaltyFirst Inc. has 6 store branches, and this number might expand in the coming years.
The customers are "rewarded" with each purchase by accumulating points, the accumulation rules may vary with each product: 40 points for a Fender Stratocaster guitar, 35 points for a Yamaha P 125 Piano, 3 points for a music CD, … 

LoyaltyFirst Inc. provides special promotions of double or triple points on special dates or occasions in selected store branches. Upon reaching a certain number of accumulated points, the customer can redeem them for items within other establishments known as “Exchange Centers”. In other words, there are prize tables, for example: trip to Cancun 10,000 points, microwave oven 2600 points, …
In order for the customer to have faster access to the prizes, "family accumulation groups" are allowed in which the purchase points of any member of the family results in 30% of the points going to the card of the other family members. For example, if the customer Bob makes a purchase that results in 250 points, 75 points go to the cards of Jane, Sam, and Rebecca (Bob, Jane, Sam, and Rebecca are members of the same family).
To simplify the program, LoyaltyFirst Inc. decided that the points will have an indefinite duration and will not expire.

Develop the conceptual ER model of the database to support the above business rules and operations. You should be able to identify the necessary entity sets, their attributes, and the corresponding relationships among them. Obviously, entities such as Customers, Cards, Transactions, Products, Branches, Redemption_History, Prizes, Offers, Families, etc. should be part of the database. 10 to 20 entity sets would be a logical number for such a system. You should provide drafts of your ER diagram from the moment you scratch the first ER design to the point where you reach the final design to be submitted.  

## Project Component 2 Description:

After the long discussions with the LoyaltyFirst Inc. representatives, the group decided to use the following ER diagram for representing the Loyalty program database. Your task in this project component is to translate the ER diagram into a relational schema on the Oracle database. In other words you need to convert the ER entities and relationships into relational database tables satisfying the business rules and constraints

## Project Component 3 Description:

Provide the SQL SELECT statements satisfying the following queries. Include your queries in a file named queries.sql. 
1) Select the offer id, action, and date provided by a particular branch name.
2) Display all the transaction references, transaction amounts, the number of points collected from each transaction, and the transaction date for a particular customer name. 
3) Find the branch IDs and the number of offers provided by each branch id. 
4) Find the branch names and the number of offers provided by each branch name. 
5) Display for a particular transaction reference, the transaction reference, date, time, amount, the number of points collected, and the product ids and names included in the transaction with their quantities, prices, and number of points. 
6) Find the number of expired cards available in the database. 
7) Find the customer with the maximum number of expired cards. 
8) Find the redemption history of a particular customer name. You should display the prize ID, prize description, customer name,center id, and number of points redeemed. 
9) Display the name and occupation of the members of a particular family name. 
10) Display the sum of points of the members of a particular family ID. 
11) Display the customer name with the maximum number of collected points. 
12) Find the total number of points redeemed on a particular date.
13) Find the number of prizes redeemed by a particular customer id. 
14) Find the number of customers who redeemed prizes from a particular center id. 
15) Find the total number of prizes in the database.
16) Display a list of customer names living in Fairfax and whose occupation is Engineer. 
17) Find the list of products not included in any tansaction.
18) Find the product bought the most by customers

Also, In this part, the LoyaltyFirst developers ask you to develop a simple standalone application in Java to test the results of Oracle SQL queries. The application consists of 2 main Java Swing JFrames.

![image](https://github.com/shubhamshukla1177/DatabaseSystems/assets/19200134/c01ef8ba-2545-46b6-9e95-3bb775dc1116)

Note that the user can enter any SQL DML query statement (SELECT, DELETE, INSERT INTO, UPDATE) and execute it. If the SQL statement is a SELECT statement, the result is displayed in a JTable component. The JTable should dynamically figure out the number and names of columns in the SQL result and display it on the screen. You may use the ojdbc10.jar JDBC drivers from Oracle for supporting the database connections. You should package your application in a single Java JAR file containing all the application dependencies including the JDBC drivers needed for the connection to the database. Name the file querydisplay.jar. 

## Project Component 4 Description:

In this project component you will be relying on the LoyaltyFirst database you created in the previous project components to develop the Java server-side code supporting part of your LoyaltyFirst application. 
Moreover, you will be developing an extremely simplified mobile application to work with the server-side code. This should consitute a simple but complete end-to-end database application following the 3-tier 
enterprise model. Once you develop this basic background, you will hopefully realize that any complex application simply relies on the basic constructs you used in this project. Deliver the project component in a zip file. LoyaltyFirstAndroid.zip is the final zip file.



