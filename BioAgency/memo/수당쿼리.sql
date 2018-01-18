select
	expected_date,
	sales_member,
	sum(payment_amount) as pa
from sales
where status='구매'
group by expected_date, sales_member;
	
	
select
	amount_date,
	member_id,
	sum(payment_amount) as pa
from payment
where status='구매'
group by	amount_date, member_id;


select 
sum(s.payment_amount), pid
from sales s 
where 
s.sales_member ='lovir5'
group by pid
;


select 
sum(s.payment_amount)
from payment s 
where 
s.member_id ='lovir5'
;


select p.amount_date, sum(p.payment_amount) as payment_amount, p.member_id, m.account from
(
select amount_date, sum(payment_amount) as payment_amount, member_id from payment where status in ('구매') group by amount_date, member_id
union all
select expected_date as amount_date, sum(payment_amount) as payment_amount, sales_member as member_id from sales where status in ('구매') group by expected_date, sales_member
) p, member m where p.member_id = m.userid group by p.amount_date, p.member_id, m.account


SELECT DATE_FORMAT(DATE_SUB(`amount_date`, INTERVAL (DAYOFWEEK(`amount_date`)-1) DAY), '%Y/%m/%d') as start,
       DATE_FORMAT(DATE_SUB(`amount_date`, INTERVAL (DAYOFWEEK(`amount_date`)-7) DAY), '%Y/%m/%d') as end,
       DATE_FORMAT(`amount_date`, '%Y%U') AS `date`, status,
       sum(`payment_amount`) as payment_amount
  FROM payment
GROUP BY date, status;

SELECT DATE_FORMAT(DATE_SUB(`purchase_date`, INTERVAL (DAYOFWEEK(`purchase_date`)-1) DAY), '%Y/%m/%d') as start,
       DATE_FORMAT(DATE_SUB(`purchase_date`, INTERVAL (DAYOFWEEK(`purchase_date`)-7) DAY), '%Y/%m/%d') as end,
       DATE_FORMAT(`purchase_date`, '%Y%U') AS `date`, status,
       sum(`purchase_amount`) as purchase_amount
  FROM sales
GROUP BY date, status; 
 
SELECT DATE_FORMAT(`amount_date`, '%Y/%m') AS `date`, status,
       sum(`payment_amount`) as payment_amount
 FROM payment
GROUP BY `date` , status;

SELECT DATE_FORMAT(`purchase_date`, '%Y/%m') AS `date`, status,
       sum(`purchase_amount`) as purchase_amount
 FROM sales
GROUP BY `date` , status;