-- Aula de Funções de Agregação 
-- Prof. Acauan Ribeiro - DCC/UFRR

DROP DATABASE IF EXISTS funcao_agregacao_aca;
CREATE DATABASE funcao_agregacao_aca;
USE funcao_agregacao_aca;

CREATE TABLE empregados (
	emp_id_empregado SERIAL PRIMARY KEY,
    emp_nome VARCHAR(255),
	emp_endereco VARCHAR(255),
	emp_localidade VARCHAR(100),
	emp_salario DECIMAL(10,2)    
);

INSERT INTO empregados
(emp_nome, emp_endereco, emp_localidade, emp_salario)
VALUES
('Nico Ribeiro', 'Av da Gloria, 1000', 'Mucajaí', 6200),
('Ana Rita', 'Av da Gloria, 1200', 'Mucajaí', 5980),
('Joana Gonçalves', 'Rua Antunes Almeida, 113', 'Ronainópolis', 6200),
('Paula Silva', 'Rua Pereira, 186', 'Ronainópolis', 1520),
('Antônio Castro', 'Rua Direita, 25', 'Ronainópolis', 2100),
('Maria Santos', 'Rua da Liberdade, 050', 'Pacaraima', 1520),
('Francisco Vale', 'Av do Monte, 1250', 'Pacaraima', 650),
('Patricia Cunha', 'Rua da Saudade, 253', 'Pacaraima', 745);

SELECT emp_localidade, COUNT(*) AS Total_Empregados
FROM empregados
GROUP BY emp_localidade;

-- Nº de salários diferentes
SELECT COUNT(DISTINCT emp_salario)
FROM empregados;

-- Salários máximo e mínimo
SELECT MAX(emp_salario), MIN(emp_salario)
FROM empregados;

-- Diferença entre os salários máximo e mínimo
SELECT MAX(emp_salario)-MIN(emp_salario)
FROM empregados;

-- 10% do total dos salários
SELECT SUM(emp_salario) * 0.1
FROM empregados;

-- CLÁUSULA GROUP BY -----------------------------------------

-- Nº de Empregados por Localdiade
SELECT emp_localidade, COUNT(*) AS Total_Empregados
FROM empregados
GROUP BY emp_localidade;

-- Nº de Empregados por Localdiade com salário acima de 3000
SELECT emp_localidade, COUNT(*) AS Total_Empregados
FROM empregados
WHERE emp_salario > 3000
GROUP BY emp_localidade;

-- TABELA PREMIOS
CREATE TABLE premios(
	pre_id_premio SERIAL PRIMARY KEY,
    emp_id_empregado BIGINT UNSIGNED NOT NULL,
    pre_valor DECIMAL(10,2),
    FOREIGN KEY (emp_id_empregado) REFERENCES empregados(emp_id_empregado)
);

INSERT INTO premios
(emp_id_empregado,  pre_valor)
VALUES
(1, 200),(1, 250),(1, 220),(3, 150),(4, 500),(7,50);

-- Total recebido por cada empregado (Salario + premios)
SELECT emp_nome, emp_salario + SUM(pre_valor) AS Total
FROM empregados e, premios p
WHERE e.emp_id_empregado = p.emp_id_empregado
GROUP BY emp_nome, emp_salario;


-- CLÁUSULA HAVING -----------------------------------------

-- Nº de empregados por localidade com mais de 2 empregados
SELECT emp_localidade, COUNT(*) AS Total_empregados
FROM empregados
GROUP BY emp_localidade
HAVING COUNT(emp_localidade) > 2;

-- Nº de empregados com salário acima dos 3000, por
-- localidade que tem mais de 1 empregado nessas condições
SELECT emp_localidade, COUNT(*) AS Total_empregados
FROM empregados
WHERE emp_salario > 3000
GROUP BY emp_localidade
HAVING COUNT(emp_localidade) > 1;








