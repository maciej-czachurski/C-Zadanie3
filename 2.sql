--Przygotuj listę 5 klientów, którzy w roku 2023 dokonali największej liczby zamówień (Orders). W raporcie uwzględnij imię i nazwisko klienta, liczbę zamówień oraz łączną wartość zamówień.
SELECT TOP 5
    Customers.CompanyName AS 'Klient - Zazwa',
    COUNT(Orders.OrderID) AS 'Klient - Ilość Zamówień',
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS 'Klient - Wartość Zamówięń'
FROM
    Orders
INNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN
    [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE
    YEAR(Orders.OrderDate) = 2023
GROUP BY
    Customers.CompanyName
ORDER BY
    'Klient - Ilość Zamówień' DESC, 'Klient - Wartość Zamówień' DESC;