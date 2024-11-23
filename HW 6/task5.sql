-- 1
SELECT s.Name, s.Surname, ts.Date, COUNT(b.Bill_No) AS Number_of_Bills
FROM Staff s
JOIN Table_Service ts ON s.Staff_No = ts.Waiter_No
JOIN Bills b ON ts.Table_No = b.Table_No AND ts.Date = b.Date
GROUP BY s.Name, s.Surname, ts.Date
HAVING COUNT(b.Bill_No) >= 2;

-- 2
SELECT t.Room, COUNT(*) AS Number_of_Tables
FROM Tables t
WHERE t.Seats > 6
GROUP BY t.Room;

-- 3
SELECT rm.Room, COUNT(b.Bill_No) AS Total_Bills
FROM Room_Management rm
JOIN Table_Service ts ON rm.Room_No = ts.Room_No AND rm.Date = ts.Date
JOIN Bills b ON ts.Table_No = b.Table_No AND ts.Date = b.Date
GROUP BY rm.Room;

-- 4
SELECT hw.Name, hw.Surname, SUM(b.Bill_Total) AS Total_Bill_Amount
FROM Staff hw
JOIN Staff w ON hw.Staff_No = w.Headwaiter
JOIN Table_Service ts ON w.Staff_No = ts.Waiter_No
JOIN Bills b ON ts.Table_No = b.Table_No AND ts.Date = b.Date
GROUP BY hw.Name, hw.Surname
ORDER BY SUM(b.Bill_Total) DESC;

-- 5
SELECT b.Customer_Name
FROM Bills b
GROUP BY b.Customer_Name
HAVING AVG(b.Bill_Total) > 400;

-- 6
SELECT s.Name, s.Surname, COUNT(b.Bill_No) AS Number_of_Bills
FROM Staff s
JOIN Table_Service ts ON s.Staff_No = ts.Waiter_No
JOIN Bills b ON ts.Table_No = b.Table_No AND ts.Date = b.Date
GROUP BY s.Name, s.Surname, ts.Date
HAVING COUNT(b.Bill_No) >= 3;
