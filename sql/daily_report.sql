connect banking_app/"&1"@//localhost:1521/FREEPDB1
set heading on
set feedback off
set pagesize 100
set linesize 200
set colsep ','

select transaction_type, count(*) as total_transactions, sum(amount) as total_amount
from transactions
where status = 'COMPLETED'
group by transaction_type
order by transaction_type;

exit;
