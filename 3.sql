--Stwórz zapytanie, które wyświetli 10 najczęściej zamawianych produktów. Pokaż nazwę produktu, liczbę zamówionych jednostek oraz łączną wartość zamówień dla każdego produktu.
SELECT TOP 10
    Products.ProductName AS 'Produkt - Nazwa',
    SUM([Order Details].Quantity) AS 'Zamówienie - Ilość',
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS 'Zamówienie - Wartość'
FROM
    [Order Details]
INNER JOIN
    Products ON [Order Details].ProductID = Products.ProductID
GROUP BY
    Products.ProductName
ORDER BY
    'Zamówienie - Ilość' DESC;
