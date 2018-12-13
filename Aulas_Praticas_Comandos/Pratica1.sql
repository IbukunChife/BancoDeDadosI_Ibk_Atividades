-- comentario de linha
/*
 commentar de Blocos
*/

-- Criar o Banco de Dados
CREATE DATABASE notaFiscalBanco;

-- Selecionar um Banco para trabalhar acima
USE notaFiscalBanco;

-- Mostra qual Banco está selecionado
SELECT DATABASE();

-- Apagar o banco de Dados
DROP DATABASE notaFiscalBanco ;

-- Utilisar padrões de Trigramação
-- Estruturas Padrões de Tablelas: InnoDB e MyISAM
-- DATE : YYYY-MM-DD
CREATE TABLE cli_clientes(
	cli_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_nome VARCHAR (50) NOT NULL,
    cli_data_nascimento DATE,
    cli_logradouro VARCHAR(200)
);

-- Apagar a Tabela Criada
DROP TABLE cli_clientes;

-- SERIAL == BIGINT NOT NULL AUTO_INCREMENT 
CREATE TABLE cli_clientes(
	cli_id SERIAL PRIMARY KEY ,
    cli_nome VARCHAR (50) NOT NULL,
    cli_data_nascimento DATE,
    cli_logradouro VARCHAR(200)
);

-- Formato de Tabela com Chave Primaria Composta
CREATE TABLE cli_clientes(
	cli_id SERIAL,
    cli_nome VARCHAR (50) NOT NULL,
    PRIMARY KEY (cli_id,cli_nome)
);

DESC cli_clientes;