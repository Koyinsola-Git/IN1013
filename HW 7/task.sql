
-- 1
CREATE VIEW samsBills AS (
SELECT first_name,surname,bill_date,cust_name,bill_total
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE first_name = "Sam" AND surname = "Pitt");


SELECT * FROM samsBills;
                     
-- 2
SELECT * FROM samsBills
WHERE bill_total > 400;


-- 3
CREATE VIEW roomTotals(room_name,total_sum) AS (
   SELECT room_name,SUM(bill_total)
   FROM restRest_Table
   INNER JOIN restBill
   ON restBill.table_no = restRest_Table.table_no
   GROUP BY room_name
);
SELECT * FROM roomTotals;


-- 4
CREATE VIEW teamTotals AS (
  SELECT CONCAT(headStaff.first_name,' ',headStaff.surname) AS headwaiter_name,SUM(bill_total) AS total_sum
  FROM restStaff headStaff
  INNER JOIN restStaff teamStaff
  INNER JOIN restBill
  ON teamStaff.staff_no = restBill.waiter_no 
  AND teamStaff.headwaiter = headStaff.staff_no
  GROUP BY headwaiter_name
);

SELECT * FROM teamTotals;