select user_name,
product_name,
ordered_quantity,
amount_paid,
last_transaction_date,
ordered_quantity * CASE 
						WHEN product_id = 'p1'
						Then 10
						WHEN product_id = 'p2'
					    THEN 15
						WHEN product_id = 'p3'
						THEN 25 
						ELSE 0 END - amount_paid AS BALANCE
from
(select 
u.user_name,
p.product_name,
p.product_id,
p.cost_per_item,
sum(CASE WHEN t.transaction_type = 'order' 
         THEN t.transaction_amount 
		 ELSE 0 END) AS ordered_quantity,
sum(CASE WHEN t.transaction_type = 'payment' 
         THEN t.transaction_amount 
		  ELSE 0 END) AS amount_paid,
MAX(t.transaction_date) AS last_transaction_date
from t_transaction t  
LEFT JOIN t_user_master u ON t.user_id=u.user_id
LEFT JOIN t_product_master p ON t.product_id = p.product_id  
group by p.product_name,p.product_id,p.cost_per_item,u.user_name) z