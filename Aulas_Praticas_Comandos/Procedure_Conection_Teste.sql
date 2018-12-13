CREATE DATABASE phpteste;

USE phpteste;

CREATE TABLE tbl_clientes {
	cli_id SERIAL PRIMARY KEY,
    cli_nome VARCHAR(100),
    cli_sexo CHAR(1)
};

INSERT INTO tbl_clientes(cli_nome,cli_sexo) VALUES
('JOAO','M'),('XUXA','F'),('MIGUEL','M'),('MARIA','F'),('JOSE','M');

