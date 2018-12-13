-- Criar função
CREATE FUNCTION fn_ola()
RETURNS VARCHAR(20)
RETURN 'Olá mundo';

-- Apagar a função
DROP FUNCTION fn_soma;

-- Usar a função
SELECT fn_ola();

DROP FUNCTION fn_multi;

DELIMITER $$
CREATE FUNCTION fn_multi(x DECIMAL(10,2), y DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE result DECIMAL(10,2);
    SET result = x * y;
	RETURN result;
END $$
DELIMITER ;

SELECT fn_multi(3.7,4.5);

