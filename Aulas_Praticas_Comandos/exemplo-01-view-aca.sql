-- VIEW: Exemplo 
USE testeaula;

-- Criar tabelas bases
CREATE TABLE projeto(
	codProj SERIAL PRIMARY KEY,
    tipo VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE empregado(
	codEmp SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    categoria VARCHAR(255),
    salario DECIMAL(10,2)
);

CREATE TABLE projeto_empregado(
	codProj BIGINT UNSIGNED NOT NULL,
    codEmp BIGINT UNSIGNED NOT NULL,
    dataInicial DATE,
    dataFinal DATE,
    FOREIGN KEY (codProj) REFERENCES projeto(codProj),
    FOREIGN KEY (codEmp) REFERENCES empregado(codEmp)
);

-- Inserindo dados
INSERT INTO projeto (tipo, descricao) 
VALUES ('A', 'Projeto A'), ('B', 'Projeto B'),('C', 'Projeto C'),('D', 'Projeto D');

INSERT INTO empregado (nome, categoria, salario) 
VALUES ('Acauan Ribeiro', 'CO', 15000),
('João da Silva', 'Programador', 8000),
('Maria de castro', 'Gerente', 12000),
('José Ricarte', 'Gerente', 11500),
('Maikon Duarte', 'Estagiário', 1000);

INSERT INTO  projeto_empregado (codProj, codEmp, dataInicial, dataFinal)
VALUES (3, 1, '2016-03-01', '2018-12-20'), (3, 3, '2016-03-01', '2018-12-20'), (3, 4, '2016-03-01', '2018-12-20'),
(2, 3, '2012-04-01', '2017-01-01'), (2, 2, '2012-04-01', '2017-01-01'), (2, 5, '2012-04-01', '2017-01-01'),
(1, 2, '2012-04-01', '2017-01-01'), (1, 5, '2012-04-01', '2017-01-01');


-- VIEWS ------------------------------------------------------------------------------------------------------

-- Criar view do alto escalao da empresa
CREATE VIEW vw_alto_escalao AS
SELECT codEmp, nome, salario FROM empregado
WHERE salario > 10000;

-- Usar a view
SELECT * FROM vw_alto_escalao;









