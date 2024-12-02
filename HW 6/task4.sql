                    
-- 1                     
SELECT DISTINCT bills.cust_name 
FROM restBill bills
WHERE bills.bill_total > 450.0 
AND bills.table_no IN (
  SELECT table_no
  FROM restRoom_management
  WHERE headwaiter IN (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = "Charles"
  )
);

-- 2
SELECT DISTINCT(first_name)
FROM restStaff
WHERE staff_no IN (
  SELECT headwaiter
  FROM restStaff
  WHERE staff_no IN (
    SELECT waiter_no
    FROM restBill
    WHERE bill_date = 160111 AND cust_name LIKE "Nerida%"
  )
);

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total IN (
  SELECT MIN(bill_total)
  FROM restBill
);

-- 4
SELECT first_name
FROM restStaff
WHERE staff_no NOT IN (
  SELECT waiter_no
  FROM restBill
);

-- 5
SELECT DISTINCT cust_name,staff.first_name,staff.surname,rooms.room_name
FROM restBill
INNER JOIN restStaff staff
INNER JOIN restRest_table tables
INNER JOIN restRoom_management rooms
ON restBill.table_no = tables.table_no
AND rooms.room_name = tables.room_name
AND rooms.headwaiter = staff.staff_no
WHERE bill_total IN (
  SELECT max(bill_total)
  FROM restBill
);