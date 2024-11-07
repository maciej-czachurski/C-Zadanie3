--Stwórz zapytanie, które zwróci miesięczną sprzedaż w roku 1998 dla każdego produktu (Products). Wynik powinien zawierać nazwy produktów, ilość sprzedanych jednostek oraz sumaryczną wartość sprzedaży. Dane posortuj według miesiąca i wartości sprzedaży malejąco.
SELECT 
    Products.ProductName AS 'Produkt',
    SUM([Order Details].Quantity) AS 'Ilość',
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS 'Wartość Suma',
	DATENAME(MONTH, Orders.OrderDate) AS 'Miesiąc'
FROM 
    [Order Details]
INNER JOIN 
    Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN 
    Products ON [Order Details].ProductID = Products.ProductID
WHERE 
    YEAR(Orders.OrderDate) = 1998
GROUP BY 
    DATENAME(MONTH, Orders.OrderDate), 
    MONTH(Orders.OrderDate), 
    Products.ProductName
ORDER BY 
    MONTH(Orders.OrderDate), 
    'Wartość Suma' DESC;