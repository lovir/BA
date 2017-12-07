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