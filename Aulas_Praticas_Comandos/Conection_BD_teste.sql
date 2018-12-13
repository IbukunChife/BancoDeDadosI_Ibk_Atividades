CREATE DATABASE phpteste;

USE phpteste;

CREATE TABLE tbl_clientes {
	cli_id SERIAL PRIMARY KEY,
    cli_nome VARCHAR(100),
    cli_sexo CHAR(1)
};

INSERT INTO tbl_clientes(cli_nome,cli_sexo) VALUES
('JOAO','M'),('XUXA','F'),('MIGUEL','M'),('MARIA','F'),('JOSE','M');

SELECT * from tbl_clientes;

-- Criar procedimento que recebe 0 e lista os homens e 1 
-- Lista as mulheres e 2 lista tudo


DELIMITER $$
CREATE PROCEDURE sp_listar (IN opcao INT )
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
END$$
DELIMITER ;

-- CHAMAR O PROCEDUMENTO
CALL sp_listar()