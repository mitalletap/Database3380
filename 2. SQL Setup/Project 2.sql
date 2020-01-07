/* 
After looking at the Project 2 Guidelines and my rendition of Project 1, I realizied the following:
    - I never included the Foreign Keys in its respective table

The changes have been added for Project 2 to ensure a complete and correct project

*/



/* #3.1 */
SELECT * 
FROM Product
WHERE Product.ProductStandardPrice > 275;

/*
QUESTION 1: Which products have a standard price of less than $ 275? 

 PRODUCTID PRODUCTNAME          PRODUCTFINISH        PRODUCTSTANDARDPRICE PRODUCTLINEID
---------- -------------------- -------------------- -------------------- -------------
         3 Computer Desk        Natural Ash                           375             2
         4 Entertainment Center Natural Maple                         650             3
         5 Writers Desk         Cherry                                325             1
         6 8-Drawer Desk        White Ash                             750             2
         7 Dining Table         Natural Ash                           800             2

*/


/* #3.2 */
SELECT ProductStandardPrice, ProductName, ProductID
FROM Product;

/*
QUESTION 2: List the unit price, product name, and product ID for all products in the Product table. 

PRODUCTSTANDARDPRICE PRODUCTNAME           PRODUCTID
-------------------- -------------------- ----------
                 175 End Table                     1
                 200 Coffee Table                  2
                 375 Computer Desk                 3
                 650 Entertainment Center          4
                 325 Writers Desk                  5
                 750 8-Drawer Desk                 6
                 800 Dining Table                  7
                 250 Computer Desk                 8

*/



/* #3.3 */
SELECT AVG(ProductStandardPrice)
FROM Product;

/*
QUESTION 3: What is the average standard price for all products in inventory? 
 
AVG(PRODUCTSTANDARDPRICE)
-------------------------
                  440.625


*/


/* #3.4 */
SELECT COUNT(ProductID)
FROM OrderLine
WHERE OrderLine.OrderID = 1004;

/*
QUESTION 4: How many different items were ordered on order number 1004? 

COUNT(PRODUCTID)
----------------
               0

*/




/* #3.5 */
SELECT O.OrderID
FROM Orders O
WHERE O.OrderDate BETWEEN '24/OCT/10' AND '9/OCT/19';

/*

QUESTION 5: Which orders have been placed since 10/ 24/ 2010? 


   ORDERID
----------
      1006
      1008
      1007

*/



/* #3.6 */
SELECT Product.ProductName
FROM Product
WHERE ProductFinish != 'Cherry';

/*
QUESTION 6: What furniture does COSC3380 carry that isn’t made of cherry? 

PRODUCTNAME         
--------------------
Coffee Table
Computer Desk
Entertainment Center
8-Drawer Desk
Dining Table
Computer Desk


*/




/* #3.7 */
SELECT Product.ProductName, Product.ProductFinish, Product.ProductStandardPrice
FROM Product
WHERE (ProductName LIKE '%Desk' OR ProductName LIKE '%Table') AND ProductStandardPrice > 300;

/*
QUESTION 7: List product name, finish, and standard price for all desks and all tables that cost more than $ 300 in the Product table. 

PRODUCTNAME          PRODUCTFINISH        PRODUCTSTANDARDPRICE
-------------------- -------------------- --------------------
Computer Desk        Natural Ash                           375
Writers Desk         Cherry                                325
8-Drawer Desk        White Ash                             750
Dining Table         Natural Ash                           800

*/






/* #3.8 */
SELECT Product.ProductName
FROM Product
WHERE ProductStandardPrice BETWEEN 200 AND 300;

/*
QUESTION 8: Which products in the Product table have a standard price between $ 200 and $ 300? 

PRODUCTNAME         
--------------------
Coffee Table
Computer Desk

*/





/* #3.9 */
SELECT C.CustomerName, C.CustomerCity, C.CustomerState
FROM Customer C
WHERE C.CustomerState = 'FL' OR C.CustomerState = 'TX' OR C.CustomerState = 'CA' OR C.CustomerState = 'HI'
ORDER BY C.CustomerName;
/*
QUESTION 9: List customer, city, and state for all customers in the Customer table whose address is Florida, Texas, California, or Hawaii. List the customers alphabetically by state and alphabetically by customer within each state. 

CUSTOMERNAME         CUSTOMERCITY         CUSTOMERST
-------------------- -------------------- ----------
Contemporary Casuals Gainesville          FL        
Flanigan Furniture   Ft Walton Beach      FL        
Impressions          Sacramento           CA        
Value Furnitures     Plano                TX        

*/






/* #3.10 */
SELECT COUNT(C.CustomerName), C.CustomerState
FROM Customer C
GROUP BY C.CustomerState;
/*
QUESTION 10: Count the number of customers with addresses in each state to which we ship. 

COUNT(C.CUSTOMERNAME) CUSTOMERST
--------------------- ----------
                    1 NJ        
                    1 CA        
                    2 NM        
                    1 VA        
                    1 Il        
                    4 NY        
                    1 CO        
                    2 FL        
                    1 TX       

*/







/* #3.11 */
SELECT COUNT(C.CustomerName), C.CustomerCity, C.CustomerState
FROM Customer C 
GROUP BY C.CustomerCity, C.CustomerState
ORDER BY C.CustomerState;
/*
QUESTION 11: Count the number of customers with addresses in each city to which we ship. List the cities by state. 

COUNT(C.CUSTOMERNAME) CUSTOMERCITY         CUSTOMERST
--------------------- -------------------- ----------
                    1 Sacramento           CA        
                    1 Boulder              CO        
                    1 Ft Walton Beach      FL        
                    1 Gainesville          FL        
                    1 Oak Brook            Il        
                    1 Carteret             NJ        
                    1 Farmington           NM        
                    1 Las Cruces           NM        
                    1 Albany               NY        
                    2 Rome                 NY        
                    1 Syracuse             NY        

COUNT(C.CUSTOMERNAME) CUSTOMERCITY         CUSTOMERST
--------------------- -------------------- ----------
                    1 Plano                TX        
                    1 Virginia Beach       VA        


*/








/* #3.12 */
SELECT DISTINCT C.CustomerState
FROM Customer C
GROUP BY C.CustomerState
HAVING COUNT(*) > 1;
/*
QUESTION 12: Find only states with more than one customer. 

CUSTOMERST
----------
NM
NY
FL

*/






/* #3.13 */
SELECT P.ProductFinish, AVG(P.ProductStandardPrice)
FROM Product P
WHERE P.ProductFinish IN ('Cherry', 'Natural Ash', 'Natural Maple', 'White Ash', 'Walnut')
GROUP BY P.ProductFinish
HAVING AVG(P.ProductStandardPrice) < 750
ORDER BY P.ProductFinish;
/*
QUESTION 13: List, in alphabetical order, the product finish and the average standard price for each finish for selected finishes having an average standard price less than 750. 

PRODUCTFINISH        AVG(P.PRODUCTSTANDARDPRICE)
-------------------- ---------------------------
Cherry                                       250
Natural Ash                           458.333333
Natural Maple                                650
Walnut                                       250

*/






/* #3.14 */
SELECT SUM(OL.OrderedQuantity * P.ProductStandardPrice)
FROM OrderLine OL, Product P, Orders O
WHERE OL.OrderID = O.OrderID AND OL.ProductID = P.ProductID;

/*
QUESTION 14: What is the total value of orders placed for each furniture product? 


SUM(OL.ORDEREDQUANTITY*P.PRODUCTSTANDARDPRICE)
----------------------------------------------
                                          6600

*/
