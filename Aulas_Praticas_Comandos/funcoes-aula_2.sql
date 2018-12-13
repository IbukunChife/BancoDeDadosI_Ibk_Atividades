INSERT INTO cliente (nome, cpf) VALUES
('Acauan', '123'),('Joao', '423'),('Maria', '13414'),('José', '2354');

INSERT INTO livro (titulo, autor, preco) VALUES
('livro 1', 'autor 1', 120), ('livro 2', 'autor 2', 220), 
('livro 3', 'autor 3', 50.50), ('livro 4', 'autor 4', 78.90);

INSERT INTO compras VALUES (1,4),(1,3),(2,2),(3,4),(3,2),(3,1);

SELECT c.nome, SUM(l.preco)
FROM compras co 
INNER JOIN cliente c
ON co.cliente_cli_id = c.cli_id
INNER JOIN livro l 
ON co.livro_liv_id = l.liv_id
WHERE cli_id = 1
GROUP BY c.nome;

-- função receb id cliente e retorna total compra
DELIMITER $$
CREATE FUNCTION valor_total(id_cliente BIGINT(20))
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE total DECIMAL(10,2);
	SELECT SUM(l.preco) INTO total
	FROM compras co 
	INNER JOIN cliente c
	ON co.cliente_cli_id = c.cli_id
	INNER JOIN livro l 
	ON co.livro_liv_id = l.liv_id
	WHERE cli_id = id_cliente
	GROUP BY c.nome;
    RETURN total;
END$$
DELIMITER ;

SELECT nome, valor_total(3) as 'Valor_total' from cliente where cli_id = 3;















