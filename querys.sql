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

-- 4-Só os fornecedores que não têm nenhum produto. (2 linhas)
SELECT f.nome_fornecedor, p.nome_produto
FROM Fornecedor AS f 
LEFT JOIN Produtos AS p ON p.fornecedor = f.ID_Fornecedor 
WHERE p.nome_produto IS NULL

-- 5-Pedidos com status Entregue, mostrando nome do cliente, data e total, do mais recente pro mais antigo. (38 linhas)
SELECT c.Nome_Cliente, p.Status, p.Data_do_Pedido, p.Total_do_Pedido
FROM Cliente as c
LEFT JOIN Pedidos as p ON p.Cliente = c.ID_Cliente
WHERE p.Status = 'Entregue'
ORDER BY p.Data_do_Pedido DESC

-- 6-Pedidos de clientes de Santa Catarina. Dica: LIKE no endereço. (10 linhas) Depois pensa: por que filtrar estado assim é frágil? Olha o endereço da Renata.
SELECT p.ID_Pedidos,c.Nome_Cliente, c.Endereco_Cliente 
FROM Pedidos AS p
LEFT JOIN Cliente AS c ON p.Cliente = c.ID_Cliente
WHERE c.Endereco_Cliente LIKE '%/SC'

-- 7-Clientes que nunca fizeram pedido.
SELECT c.Nome_Cliente, p.Status, p.Data_do_Pedido, p.Total_do_Pedido
FROM Cliente AS c 
LEFT JOIN Pedidos AS p ON p.Cliente = c.ID_Cliente
WHERE p.ID_Pedidos IS NULL

-- 8-quais pedidos não foram para a Pedidos_gold
SELECT c.Nome_Cliente, p.Total_do_Pedido, pg.cliente_gold
FROM Cliente AS c
JOIN Pedidos AS p  ON p.Cliente = c.ID_Cliente
LEFT JOIN Pedidos_gold AS pg ON pg.total_do_pedido = p.Total_do_pedido
WHERE pg.ID_Pedido_gold IS NULL
ORDER BY p.Total_do_Pedido 