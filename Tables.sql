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

-- Criando a tabela Categoria
CREATE TABLE Categoria (
    ID_Categoria INT IDENTITY (1,1),
    Nome_Categoria VARCHAR(250),
    Descricao_Categoria TEXT,
    CONSTRAINT PK_Categoria PRIMARY KEY (ID_Categoria)
)

ALTER TABLE Categoria
ALTER COLUMN Nome_Categoria VARCHAR(250) NOT NULL

CREATE TABLE Produtos (
    ID_Produto INT IDENTITY PRIMARY KEY,
    nome_produto VARCHAR(250) NOT NULL,
    descricao TEXT,
    categoria INT,
    preco_de_compra DECIMAL(10,2),
    unidade VARCHAR(50),
    fornecedor INT,
    data_de_inclusao DATE,
    CONSTRAINT FK_Categoria FOREIGN KEY (categoria) REFERENCES Categoria (ID_Categoria),
    CONSTRAINT FK_Fornecedor FOREIGN KEY (fornecedor) REFERENCES Fornecedores (ID)
)

-- Tibe que reescrever a tabela inteira por problema no ID do fornecedor
DROP TABLE IF EXISTS dbo.Fornecedor

CREATE TABLE Fornecedor (
    ID_Fornecedor INT IDENTITY,
    nome_fornecedor VARCHAR(250),
    pais_de_origem VARCHAR(250),
    informacoes_de_contado VARCHAR(250),
    data_de_inicio DATE
    CONSTRAINT PK_Fornecedor PRIMARY KEY (ID_Fornecedor)
)

ALTER TABLE Produtos 
ADD CONSTRAINT FK_FORNECEDOR FOREIGN KEY (fornecedor) REFERENCES Fornecedor (ID_Fornecedor)

-- Aqui tive que fazer o mesmo que fiz em fornecedor
DROP TABLE IF EXISTS dbo.Pedidos

CREATE TABLE dbo.Pedidos (
    ID_Pedidos INT IDENTITY(1,1) PRIMARY KEY,
    Data_do_Pedido DATE NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    Total_do_Pedido DECIMAL(10, 2) NOT NULL,
    Cliente INT NOT NULL,
    Data_de_Envio_Estimada DATE NULL
)