CREATE DATABASE Uri;

use Uri;

CREATE TABLE virus (
  id INTEGER,
  name VARCHAR(255)
);


INSERT INTO virus(id, name)
VALUES 
      (1, 'H1RT'),
      (2, 'H7H1'),
      (3, 'HUN8'),
      (4, 'XH1HX'),
      (5, 'XXXX');




SELECT replace(name,'H1','X') as name from virus;



REPLACE('String a ser substituída','Trecho procurado','Novo trecho')
 













SELECT people.name , round( (salary * 10)/100,2) as tax from
people WHERE people.salary > 3000 ;



SELECT * FROM rentals;
-- SELECT * FROM categories;

SELECT customers.name
FROM customers join legal_person on customers.id = legal_person.id_customers;



CREATE OR REPLACE FUNCTION formata_cpf(
  p_cpf IN VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
  RETURN regexp_replace(LPAD(p_cpf, 11),'([0-9]{3})([0-9]{3})([0-9]{3})','\1.\2.\3-');
END;

SELECT formata_cpf('31581057059') FROM dual;

SELECT regexp_replace(LPAD(natural_person.cpf,11),'([0-9]{3})([0-9]{3})([0-9]{3})','\1.\2.\3-')
from customers join natural_person ON customers.id = natural_person.id_customers;

SELECT CONCAT(SUBSTRING(natural_person.cpf,1,3),'.',
SUBSTRING(natural_person.cpf,4,3),'.',
SUBSTRING(natural_person.cpf,7,3),'-',
SUBSTRING(natural_person.cpf,10)) as cpf
from customers join natural_person ON customers.id = natural_person.id_customers;










DROP DATABASE Uri ;



SELECT round(AVG(price),2) FROM products;
 
-- 2614
SELECT name,rentals_date
from customers, rentals
WHERE customers.id = id_customers AND rentals_date >= '2016-09-01' AND
rentals_date <= '2016-09-30';

-- Possibilidade
SELECT name,rentals_date FROM customers, rentals 
WHERE customers.id = id_customers AND LEFT(rentals_date,7) ='2016-09';

-- 2021 Pedidos no Primeiro Semestre
SELECT customers.name , orders.id
FROM customers, orders
WHERE customers.id = orders.id_customers
AND (orders.orders_date 
BETWEEN '2016-01-01' AND '2016-06-31');

-- 2738 Concurso
SELECT candidate.name, round(
((math * 2)+
(spcific * 3)+
(project_plan * 5))/10) as avg
from candidate, score
WHERE candidate.id = score.candidate_id
ORDER BY avg DESC ;

-- 2739  Dia de Pagamento
select name, CAST((EXTRACT(DAY FROM payday)) AS int) as day
    from loan;