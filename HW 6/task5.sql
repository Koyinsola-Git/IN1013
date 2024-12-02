       
-- 1
SELECT first_name,surname,bill_date,count(*) AS bills_taken
FROM restStaff
INNER JOIN restBill
ON waiter_no = staff_no
GROUP BY staff_no,bill_date
HAVING COUNT(*)>=2;

-- 2
SELECT room_name,COUNT(*) AS tables
FROM restRest_table 
WHERE no_of_seats>6
GROUP BY room_name;

-- 3
SELECT room_name,SUM(bills.bill_total) AS total_bills
FROM restRest_table tables
INNER JOIN restBill bills
ON bills.table_no = tables.table_no
GROUP BY room_name;

-- 4
SELECT heads.first_name,heads.surname,SUM(bill_total) AS total_bills_taken
FROM restStaff heads
INNER JOIN restStaff staff
INNER JOIN restBill
ON staff.staff_no = waiter_no 
AND staff.headwaiter = heads.staff_no
GROUP BY heads.staff_no
ORDER BY total_bills_taken;

-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total)>=400;

   
-- 6
SELECT first_name,surname,count(*) AS bills_taken
FROM restStaff
INNER JOIN restBill
ON waiter_no = staff_no
GROUP BY staff_no,bill_date
HAVING COUNT(*)>=3;