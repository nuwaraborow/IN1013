-- 1
SELECT DISTINCT b.Customer_Name
FROM Bills b
JOIN Table_Service ts ON b.Table_No = ts.Table_No
JOIN Room_Management rm ON ts.Room_No = rm.Room_No AND b.Date = rm.Date
JOIN Staff s ON rm.Headwaiter = s.Staff_No
WHERE b.Bill_Total > 450.00 AND s.Name = 'Charles';

-- 2
SELECT s.Name, s.Surname
FROM Staff s
JOIN Room_Management rm ON s.Staff_No = rm.Headwaiter
JOIN Table_Service ts ON rm.Room_No = ts.Room_No AND rm.Date = ts.Date
JOIN Bills b ON ts.Table_No = b.Table_No
WHERE b.Customer_Name = 'Nerida' AND b.Date = 160111;

-- 3
SELECT DISTINCT b.Customer_Name
FROM Bills b
WHERE b.Bill_Total = (
    SELECT MIN(Bill_Total)
    FROM Bills
);

-- 4
SELECT DISTINCT s.Name
FROM Staff s
WHERE s.Staff_No NOT IN (
    SELECT DISTINCT ts.Waiter_No
    FROM Table_Service ts
);

-- 5
SELECT b.Customer_Name, hw.Name AS Headwaiter_Name, hw.Surname AS Headwaiter_Surname, rm.Room AS Room_Name
FROM Bills b
JOIN Table_Service ts ON b.Table_No = ts.Table_No
JOIN Room_Management rm ON ts.Room_No = rm.Room_No AND b.Date = rm.Date
JOIN Staff hw ON rm.Headwaiter = hw.Staff_No
WHERE b.Bill_Total = (
    SELECT MAX(Bill_Total)
    FROM Bills
);
