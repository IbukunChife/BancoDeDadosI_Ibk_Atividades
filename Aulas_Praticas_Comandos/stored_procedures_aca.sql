-- Stored Procedures

-- Exemplo simples: 
DELIMITER $$
CREATE PROCEDURE sp_ola(IN p_nome VARCHAR(100))
BEGIN
	SELECT CONCAT('Olá, ', p_nome);
END$$
DELIMITER ;

-- Forma de chamar a stored procedure
CALL sp_ola('Acauan'); -- O "retorno das stored procedures não podem ser utilizados para fazer outros procedimentos. Diferente de uma function ou uma view"
-- Para pegar um retorno temos que usar uma "variável de saída" para obter esse retorno;


-- Exemplo com IF / ELSE



