-- Criação da Tabela clientes
CREATE TABLE Cliente (
    ID_Cliente INT IDENTITY(1,1) NOT NULL,
    Nome_Cliente VARCHAR(250),
    Informacoes_de_contato VARCHAR(250),
    CONSTRAINT PK_ID PRIMARY KEY (ID_Cliente)
)

-- Alteração da restrição de coluna do nome do cliente
ALTER TABLE Cliente
ALTER COLUMN Nome_cliente VARCHAR (250) NOT NULL

-- Teste de restrição 
INSERT INTO Cliente VALUES (NULL,'479999-9999')

-- Insererção de dados na tabela
UPDATE Cliente SET Nome_Cliente = 'Daniel' WHERE ID_Cliente = 1

-- Adicionando uma nova Coluna a tabela cliente
ALTER TABLE Cliente
ADD Endereco_Cliente VARCHAR(250) DEFAULT 'Não informado' NOT NULL

SELECT * FROM Cliente