
-- 1
SELECT first_name FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE cust_name = "Tanya Singh";

-- 2
SELECT room_date FROM restRoom_management
INNER JOIN restStaff
ON restStaff.staff_no = restRoom_management.headwaiter
AND restStaff.first_name = "Charles"
WHERE room_date BETWEEN 160200 AND 160231
AND room_name="Green";

-- 3
SELECT T1.first_name,T1.surname 
FROM restStaff T1
INNER JOIN restStaff T2
INNER JOIN restStaff T3
ON T3.first_name = "Zoe" AND T3.surname = "Ball" 
AND T1.headwaiter = T2.staff_no AND T3.headwaiter = T2.staff_no; 

-- 4
SELECT cust_name,bill_total,first_name
FROM restBill
INNER JOIN restStaff
ON staff_no = waiter_no
ORDER BY bill_total;


-- 5
SELECT S1.first_name,S1.surname 
FROM restStaff S1
INNER JOIN restStaff S2
INNER JOIN restBill Bills
ON S1.headwaiter = S2.headwaiter
AND Bills.waiter_no = S2.staff_no
WHERE Bills.bill_no = 0014 OR Bills.bill_no = 0017;


-- 6
SELECT S1.first_name,S1.surname
FROM restStaff S1
INNER JOIN restStaff S2
INNER JOIN restBill bills
INNER JOIN restRest_table tables
ON bills.waiter_no = S2.staff_no 
AND S1.headwaiter = S2.headwaiter
AND tables.table_no = bills.table_no
WHERE bills.bill_date = 160312
AND tables.room_name = "Blue";

