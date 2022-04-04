USE bank;

#Query 1
SELECT Client_ID FROM CLIENT WHERE district_id = 1 ORDER BY Client_id LIMIT 5;

#Query 2
SELECT Client_ID FROM CLIENT WHERE district_id = 71 ORDER BY Client_id DESC LIMIT 1;
SELECT MAX(Client_ID) FROM CLIENT WHERE district_id = 72; # OK, that was not well articulated

#Query 3
SELECT  amount FROM loan ORDER BY amount LIMIT 3;

#Query 4
SELECT distinct(status) FROM loan ORDER BY status;

#Query 5
SELECT loan_id FROM loan WHERE payments = (SELECT max(payments) FROM loan);

#Query 6
SELECT account_id as '#ID', amount FROM loan ORDER BY account_id LIMIT 5;

#Query 7
SELECT account_id FROM loan WHERE duration = 60 ORDER BY amount LIMIT 5;
# you didn't specify that it has to by 5

#Query 8
SELECT DISTINCT(ord.k_symbol) FROM bank.Order ord;

#Query 9
SELECT ord.order_id FROM bank.Order ord WHERE ord.account_id = 34;

#Query 10
SELECT DISTINCT(ord.account_id) FROM bank.Order ord WHERE ord.order_id>=29540 AND ord.order_id<=29560;

#Query 11
SELECT ord.amount FROM bank.Order ord  WHERE ord.account_to = 30067122;

#Query 12
SELECT tr.trans_id, tr.date, tr.type, tr.amount FROM bank.trans tr WHERE tr.account_id = 793 ORDER BY tr.date DESC LIMIT 10;

#Query 13
SELECT district_id, COUNT(client_id) FROM bank.client GROUP BY district_id HAVING district_id< 10 ORDER BY district_id;

#Query 14
SELECT card.type, count(card.type) FROM card GROUP BY card.type;

#Optional

#Query 15
SELECT account_id, sum(amount) FROM bank.loan cl GROUP BY account_id ORDER BY sum(amount) DESC LIMIT 10;

#query 16
SELECT l.date, count(l.loan_id) FROM bank.loan l GROUP BY l.date HAVING l.date<930907;

#query 17
SELECT l.date, l.duration, count(l.loan_id) FROM bank.loan l GROUP BY l.date HAVING  left(CONVERT(l.date, char(6)),4)='9712' ORDER BY l.date, l.duration;

#query 18
SELECT t.account_id, t.type, sum(t.amount) AS total_amount 
FROM (SELECT trans.account_id, trans.trans_id, trans.type,  trans.amount FROM bank.trans WHERE trans.account_id=396) t 
GROUP BY t.type;

SELECT t.account_id, t.transaction_type, sum(t.total) AS total_amount 
FROM (SELECT trans.account_id, trans.trans_id, REPLACE(REPLACE(trans.type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') AS transaction_type,  CONVERT(trans.amount,UNSIGNED INTEGER) AS total FROM bank.trans WHERE trans.account_id=396) t 
GROUP BY t.transaction_type;

SELECT t.account_id, t.transaction_type, sum(t.total) AS total_amount 
FROM (SELECT trans.account_id, trans.trans_id, REPLACE(trans.type,'PRIJEM','INCOMING') AS Incoming ,REPLACE('VYDAJ','OUTGOING') AS Outgoing,  CONVERT(trans.amount,UNSIGNED INTEGER) AS total FROM bank.trans WHERE trans.account_id=396 AND Outgoing,) t 
GROUP BY t.transaction_type;

