USE nfbanco;

-- Mostrar as Tabelas
SHOW TABLES;

CREATE TABLE prd_produtos (
	prd_id SERIAL PRIMARY KEY,
    prd_nome VARCHAR (50) NOT NULL,
    prd_codigo VARCHAR (50) DEFAULT '-'
);

CREATE TABLE unm_unidade_medida(
	unm_id SERIAL PRIMARY KEY,
    unm_nome VARCHAR (30),
    unm_sigla VARCHAR (5) NOT NULL
);


-- Para fazer o relacionamento entre dois tabela produtos N---1 un_medida
-- Adicionar uma nova coluna em produto para receber  a chave estrangeira
ALTER TABLE prd_produtos
ADD COLUMN unm_id BIGINT UNSIGNED NOT NULL;


-- Adicionar uma restrição de uma chave esrangeira
ALTER TABLE pr_produtos
ADD CONSTRAINT fk_prd_produtos_unm_und_med_unm_id
FOREIGN KEY (unm_id) REFERENCES unm_unidade_medida(unm_id);

-- OUTROS E RELAÇÔES E RELACIONAMENTOS
CREATE TABLE cmp_compra(
	cmp_id SERIAL PRIMARY KEY,
    cli_id BIGINT UNSIGNED NOT NULL,
    cmp_data_hora DATETIME NOT NULL DEFAULT NOW(),
    cmp_valor_pago DECIMAL (8,2) NOT NULL,
    cmp_qtd INT DEFAULT 0,
    FOREIGN KEY (cli_id) REFERENCES cli_cliente(cli_id)

);

CREATE TABLE cmp_prd_compras_produtos(
	prd_id BIGINT UNSIGNED NOT NULL,
    cmp_id BIGINT UNSIGNED NOT NULL,
    cmp_prd_quantidade INT NOT NULL,
    cmp_prd_preco DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (prd_id,cmp_id),
    FOREIGN KEY (prd_id) REFERENCES prd_produtos(prd_id),
    FOREIGN KEY (cmp_id) REFERENCES cmp_compra(cmp_id)

);