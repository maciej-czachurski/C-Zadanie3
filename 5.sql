-- Napisz zapytanie, które zwróci listę wszystkich dostawców (Suppliers) oraz liczbę produktów, które aktualnie posiadają w magazynie (UnitsInStock > 0). Wynik posortuj według liczby dostępnych produktów malejąco.
SELECT
	Suppliers.CompanyName AS 'Dostawca - Nazwa',
    COUNT(Products.ProductID) AS 'Magazyn - Ilość na stanie'
FROM 
    Products
INNER JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE 
    Products.UnitsInStock > 0
GROUP BY 
    Suppliers.CompanyName
ORDER BY 
    'Magazyn - Ilość na stanie' DESC;

