-- 1-Nome do produto, preço de compra e nome da categoria. (42 linhas)
SELECT p.nome_produto, p.preco_de_compra, c.Nome_Categoria
FROM Produtos AS p
INNER JOIN Categoria AS c ON p.categoria = c.ID_Categoria

-- 2-Nome do produto, categoria, fornecedor e país, só de fornecedores da China. São 3 tabelas. (11 linhas)

SELECT pais_de_origem
FROM Fornecedor
WHERE pais_de_origem = 'China'

SELECT p.nome_produto, c.Nome_Categoria, f.nome_fornecedor, f.pais_de_origem
FROM Produtos AS p
INNER JOIN Categoria  AS c ON p.categoria  = c.ID_Categoria
INNER JOIN Fornecedor AS f ON p.fornecedor = f.ID_Fornecedor
WHERE f.pais_de_origem = 'China';

-- 3-Todos os fornecedores com seus produtos, incluindo quem não fornece nada. 

SELECT f.nome_fornecedor, p.nome_produto
FROM Fornecedor AS f 
LEFT JOIN Produtos AS p ON p.fornecedor = f.ID_Fornecedor
ORDER BY f.nome_fornecedor