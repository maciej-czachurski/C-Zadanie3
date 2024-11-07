-- Przygotuj zapytanie, które policzy średni czas realizacji zamówienia (od momentu złożenia do momentu wysyłki) dla każdego pracownika (Employees). Wynik posortuj według średniego czasu realizacji malejąco.
SELECT 
    Employees.FirstName + ' ' + Employees.LastName AS 'Pracownik',
    AVG(DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate)) AS 'Zamówienie - Czas Dostawy'
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE 
    Orders.ShippedDate IS NOT NULL
GROUP BY 
    Employees.FirstName, Employees.LastName
ORDER BY 
    'Zamówienie - Czas Dostawy' DESC;