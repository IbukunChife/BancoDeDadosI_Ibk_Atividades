CREATE DATABASE TESTE;
USE TESTE;


-- HELLO WORD
CREATE FUNCTION fn_ola()
RETURNS VARCHAR(20)
RETURN 'OLA MUNDO';

-- Apagar a função
DROP FUNCTION fn_multix;

-- Usar a função
SELECT fn_ola() as resultado;


DELIMITER $$
CREATE FUNCTION fn_multix(x DECIMAL(10,2), y DECIMAL(10,2))
RETURNS DECIMAL (10,2)
BEGIN
	DECLARE result DECIMAL(10,2);
    SET result = x * y;
    RETURN result;
END $$
DELIMITER ;

-- Usar a função multix 
SELECT fn_multix(3.7,4.5);