-- 1
SELECT DISTINCT s.Name
FROM Staff s
JOIN Table_Service ts ON s.Staff_No = ts.Waiter_No
JOIN Bills b ON ts.Table_No = b.Table_No
WHERE b.Customer_Name = 'Tanya Singh';

-- 2
SELECT DISTINCT rm.Date
FROM Room_Management rm
JOIN Staff s ON rm.Headwaiter = s.Staff_No
WHERE s.Name = 'Charles'
  AND rm.Room = 'Green'
  AND rm.Date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT s.Name, s.Surname
FROM Staff s
WHERE s.Headwaiter = (
    SELECT Headwaiter
    FROM Staff
    WHERE Name = 'Zoe Ball'
);

-- 4
SELECT b.Customer_Name, b.Bill_Total AS Amount_Spent, s.Name AS Waiter_Name
FROM Bills b
JOIN Table_Service ts ON b.Table_No = ts.Table_No
JOIN Staff s ON ts.Waiter_No = s.Staff_No
ORDER BY b.Bill_Total DESC;

-- 5
SELECT DISTINCT s.Name, s.Surname
FROM Staff s
JOIN Table_Service ts ON s.Staff_No = ts.Waiter_No
WHERE ts.Table_No IN (
