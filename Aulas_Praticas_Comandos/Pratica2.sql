-- INSERÇÕES
INSERT INTO cli_clientes 
(cli_nome, cli_data_nascimento, cli_logradouro)
VALUES
('João Larissa','1995/06/18','Rua Teste');

-- multiplos inserção
INSERT INTO cli_clientes 
(cli_nome, cli_data_nascimento, cli_logradouro)
VALUES
('João Bruxo','1965/06/18','Rua Teste85'),
('Dublado Larissa','1985/04/18','Rua Teste24');

-- Testar NOT NULL tirando cli_nome depois colocando
INSERT INTO cli_clientes
(cli_nome)
VALUES
('Teste');

-- FILTRAR DADOS
SELECT cli_nome FROM cli_clientes WHERE cli_id = 4;

-- FILTRAR DADOS QUE NÃO SÂO NULOS (NULL == disconhecido) ou not NULL
SELECT cli_nome FROM cli_clientes WHERE cli_data_nascimento is NULL;


-- ########## ALTERAR TABELA ###########
ALTER TABLE cli_clientes
ADD COLUMN cli_cpf char(14) NOT NULL;

-- ATUALIZAR DADOS NA TABELA
UPDATE cli_clientes
SET cli_cpf = '111.111.122-00'
WHERE cli_id = 1;

-- Alterar A RESTRIÇÂO DO CPF
ALTER TABLE cli_clientes
MODIFY cli_cpf char(14) UNIQUE;

-- ALTERAR TABELA PARA ADICIONAR RESTRIÇÔES
ALTER TABLE cli_clientes
ADD CONSTRAINT UN_CLI_CLIENTES_CLI_CLIENTES UNIQUE (cli_cpf); 

-- APAGAR UMA RESTRIÇÔES
ALTER TABLE cli_clientes
DROP INDEX cli_cpf; 

-- Consulta dos elemento començando por J ou j
SELECT * FROM cli_clientes
WHERE cli_nome like 'J%'




-- deletar uma informação (dado) 
DELETE FROM cli_clientes WHERE cli_id = 2;
-- MOstrar a Tabela
SELECT * FROM cli_clientes;
DESC cli_clientes;