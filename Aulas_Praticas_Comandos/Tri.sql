CREATE DATABASE T;
USE T;

-- TIGGERS 3

CREATE TABLE produtos(
	id_produto VARCHAR(3) PRIMARY KEY,
    descricao VARCHAR (50)UNIQUE,
    qtd_estoque INT NOT NULL DEFAULT 0
);

CREATE TABLE itens_vendas(
	id_venda SERIAL PRIMARY KEY,
    id_produto_vendido VARCHAR(3),
    qtd_vendida INT
);

CREATE TABLE relatorio_vendas(
	id_rel SERIAL PRIMARY KEY,
    data_rel date,
    total_vendas INT
);

DELIMITER $$
CREATE TRIGGER relatorio AFTER INSERT
ON itens_vendas
FOR EACH ROW
BEGIN
	DECLARE rel_dia INTEGER;
    DECLARE id_rel_dia BIGINT;
    SET rel_dia = (SELECT COUNT(*) FROM relatorio_vendas WHERE data_rel= CURDATE());
    
    IF rel_dia = 0 THEN
		INSERT INTO relatorio_vendas(data_rel,total_vendas)
        VALUES (CURDATE(),NEW.qtd_vendida);
	ELSE
      SET id_rel_dia = (SELECT id_rel FROM relatorio_vendas WHERE data_rel = CURDATE());
		UPDATE relatorio_vendas SET total_vendas = total_vendas + New.qtd.vendida
        WHERE id_rel = id_rel_dia;
	END IF;
    
	UPDATE produtos SET qtd_estoque = qtd_estoque - NEW.qtd_vendida
    WHERE id_produto = NEW.id_produto_vendido;
END; $$
DELIMITER ;

INSERT INTO produtos VALUES ('001','Feijão',10);
INSERT INTO produtos VALUES ('002','Arroz',5);
INSERT INTO produtos VALUES ('003','Farinha',15);

DROP TABLE produtos;
DROP TABLE itens_vendas;
DROP TABLE relatorio_vendas;
DROP TRIGGER relatorio;