/*
 O Exercício se apresenta da seguinte forma.
 O trigger é utilizado para atualizar a Tabela informação 
 Quando um items esta inserido como mercadoria: 
 ele atualiza a Quantidade e o Valor Total dos itens do mesmo nome 

MERCADORIA (ID, NOME,CATEGORIA, DATA DE FABRIÇÃO, PREÇO UNITARIO, ID DA SUA INFORMAÇÃO)
INFORMAÇÂO (ID, QTD,VALOR TOTAL)
*/

CREATE DATABASE TriggerExemplo ;

USE TriggerExemplo;

CREATE TABLE mercadoria (
	mer_id SERIAL PRIMARY KEY,
    mer_nome VARCHAR (45) NULL,
    mer_categoria VARCHAR (45)NULL,
    mer_Data_Fab DATE NOT NULL,
    mer_Preco_Uni DECIMAL (10,2),
    mer_inf_id BIGINT UNSIGNED NOT NULL
);

CREATE TABLE informacao_Estoque (
	inf_id SERIAL PRIMARY KEY,
    inf_qtd INT,
    inf_preco_total DECIMAL(10,2) NOT NULL
);



DELIMITER $$
CREATE TRIGGER atualizar_insert
AFTER INSERT ON mercadoria
FOR EACH ROW
BEGIN
	DECLARE ref_qtd INTEGER; -- Achar a quantidade de itens na tabela
	DECLARE qtd INTEGER; -- Achar a quantidade de itens do mesmo nome presente na mercadoria
    DECLARE ref_id INTEGER; -- Achar o id da quantidade com respeito ao seu nome  na tabela de mercadoria
    SET ref_qtd = (SELECT COUNT(*) FROM informacao_Estoque WHERE inf_id = NEW.mer_inf_id);
    
    IF ref_qtd = 0 THEN
		INSERT INTO informacao_Estoque(inf_qtd,inf_preco_total) VALUES(1,NEW.mer_Preco_Uni);
    ELSE
		SET ref_id = (SELECT inf_id FROM mercadoria JOIN informacao_Estoque ON inf_qtd = ref_qtd WHERE mer_nome = New.mer_nome AND inf_id = New.mer_Preco_Uni);
		SET qtd =(SELECT COUNT(*) FROM mercadoria WHERE mer_nome = New.mer_nome GROUP BY(ref_id));
		UPDATE informacao_Estoque
        SET inf_qtd = qtd , inf_preco_total = qtd * New.mer_Preco_Uni
        WHERE inf_id = NEW.mer_inf_id ; 
       
	END IF;
    
END; $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER atualizar_remoçao
AFTER DELETE ON mercadoria
FOR EACH ROW
BEGIN

	DECLARE ref_qtd INTEGER;
	DECLARE qtd INTEGER; 
    DECLARE ref_id INTEGER;    
    SET ref_qtd = (SELECT COUNT(*) FROM informacao_Estoque WHERE inf_id = OLD.mer_inf_id);
	SET ref_id = (SELECT inf_id FROM mercadoria JOIN informacao_Estoque ON inf_qtd = ref_qtd WHERE mer_nome = OLD.mer_nome AND inf_id = OLD.mer_Preco_Uni);
	SET qtd =(SELECT COUNT(*) FROM mercadoria WHERE mer_nome = OLD.mer_nome GROUP BY(ref_id));
	UPDATE informacao_Estoque
    SET inf_qtd = qtd , inf_preco_total = qtd * OLD.mer_Preco_Uni
    WHERE inf_id = OLD.mer_inf_id ; 
    
END; $$
DELIMITER ;




INSERT INTO mercadoria(mer_nome,mer_categoria,mer_Data_Fab,mer_Preco_Uni,mer_inf_id)
VALUE('Televisão','acessório','2015-06-15',2499 , 1),
('Leite','comestível','2018-08-15',4.99 ,2),
('Biscoito','lanche','2018-09-14',5.70,3),
('Pimenta','tempero','2017-04-13',3.80,4);
-- ('Sabão','Disolvante','2018-07-19',10.99,5),
-- ('Sofa','acessório','2015-06-24',1500,6)
-- ;
 
DELETE FROM mercadoria WHERE mer_id = 1;
 
SELECT * FROM informacao_Estoque;
SELECT * FROM mercadoria;
drop table mercadoria;
drop table informacao_Estoque;
drop trigger atualizar;