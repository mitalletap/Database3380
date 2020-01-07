/* Add SALEPRICE column to the PRODUCT table */
ALTER TABLE Product ADD SalePrice DECIMAL(6,2);

/* Procedure ProductLineSale */
CREATE OR REPLACE PROCEDURE ProductLineSale
AS 
BEGIN
    UPDATE Product SET SalePrice = ProductStandardPrice * .9 WHERE ProductStandardPrice >= 400; /* Discount Price 10% for sales over 400 */
    UPDATE Product SET SalePrice = ProductStandardPrice * .85 WHERE ProductStandardPrice < 400; /* Discount Price 15% for sales under 400 */
END ProductLineSale; 
/
EXEC ProductLineSale;

/* Trigger StandardPriceUpdate */
CREATE OR REPLACE TRIGGER StandardPriceUpdate
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
    INSERT INTO PriceUpdate VALUES(:old.ProductID, CURRENT_DATE, :old.ProductStandardPrice, :new.ProductStandardPrice);
END;

/* Test TRIGGER by changing values for product with id of 6 */
UPDATE Product
SET ProductStandardPrice = 399
WHERE ProductID = 6;

/* Create VIEW to display data on INDEX.JSP */
CREATE OR REPLACE VIEW SalesToDate("ID", "Description", "Quantity")
AS
SELECT ol.productid, p.productname, SUM(ol.orderedquantity) AS Quanitity
FROM OrderLine ol, Product p
WHERE ol.productid = p.productid
GROUP BY ol.productid, p.productname
ORDER BY ol.productid;





