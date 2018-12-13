DELIMITER $$
CREATE PROCEDURE sp_ola(IN nome VARCHAR(100))
BEGIN
	SELECT CONCAT('Olá, ', nome);
END $$
DELIMITER ;

CALL sp_ola('acauan');

-- -------------------------------
CREATE DATABASE phpteste;
USE phpteste;

CREATE TABLE tbl_clientes (
	cli_id SERIAL PRIMARY KEY,
	cli_nome VARCHAR(100),
	cli_sexo CHAR(1)
);

INSERT INTO tbl_clientes(cli_nome, cli_sexo) VALUES
('João', 'M'),('Xuxa', 'F'),('Miguel', 'M'),('Maria', 'F'),('José', 'M');

SELECT * FROM tbl_clientes;

-- Criar procedimento que recebe 0 e lista os homens e 1 
-- lista as mulheres e 2 lista tudo

DELIMITER $$
CREATE PROCEDURE  sp_listar_clientes(IN opcao INT)
BEGIN
	IF opcao = 0 THEN
		SELECT * FROM tbl_clientes WHERE cli_sexo = 'M';
	ELSE 
		IF opcao = 1 THEN
			SELECT * FROM tbl_clientes WHERE cli_sexo = 'F';
		ELSE 
			SELECT * FROM tbl_clientes;
		END IF;
	END IF;
END $$

DELIMITER ;

CALL sp_listar_clientes(0);





















           