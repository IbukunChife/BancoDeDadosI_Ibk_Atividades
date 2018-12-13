CREATE DATABASE bancophpaca;
USE bancophpaca;

-- Criar tabela
CREATE TABLE tbl_clientes (
cli_id SERIAL PRIMARY KEY,
cli_nome VARCHAR(40) NOT NULL,
cli_sexo CHAR(1) NOT NULL
);

-- Inserindo registros
INSERT INTO tbl_clientes(cli_nome, cli_sexo) VALUES
('Humberto','M'), ('Ayrton Sena','M'), ('Xuxa','F');

SELECT * FROM tbl_clientes;

-- Criar procedure
DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INTEGER)
BEGIN
    IF opcao = 0 THEN
        SELECT * FROM tbl_clientes WHERE cli_sexo = 'F';
    ELSE
        IF opcao = 1 THEN
          SELECT * FROM tbl_clientes WHERE cli_sexo = 'M';
        ELSE
          SELECT * FROM tbl_clientes;
        END IF;
    END IF;
END $$
DELIMITER ;

DROP PROCEDURE sp_lista_clientes;

CALL sp_lista_clientes(1);