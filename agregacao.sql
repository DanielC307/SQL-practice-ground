-- 1.Quantidade de pedidos por status. (5 linhas; Entregue tem 38)
SELECT Status, COUNT(*) AS Total_Pedidos
FROM Pedidos
GROUP BY Status

-- 2.Faturamento total e ticket médio por status, do maior faturamento pro menor. 
SELECT Status, SUM(Total_do_Pedido) AS Faturamento, FORMAT(AVG(Total_do_Pedido), 'N2', 'pt-BR') AS Ticket_Médio
FROM Pedidos
GROUP BY Status
ORDER BY Faturamento DESC

-- 3.Quantidade de produtos por categoria, com o nome da categoria, da maior pra menor.
SELECT c.Nome_Categoria, COUNT(*) AS Produtos
FROM Categoria AS c 
JOIN Produtos as p
ON c.ID_Categoria = p.categoria
GROUP BY c.Nome_Categoria
ORDER BY Produtos DESC

-- 4.Quantidade de produtos por fornecedor, incluindo quem não tem nenhum.
SELECT f.nome_fornecedor, COUNT(p.ID_Produto) AS Produtos
FROM Fornecedor AS f 
LEFT JOIN Produtos AS p
ON p.fornecedor = f.ID_Fornecedor
GROUP BY f.ID_Fornecedor, f.nome_fornecedor
ORDER BY Produtos DESC

-- 5.Os 5 clientes que mais gastaram em pedidos entregues, com nome.
SELECT TOP 5 c.Nome_Cliente, SUM(p.Total_do_Pedido) AS Total_Cliente
FROM Cliente AS c
INNER JOIN Pedidos AS p ON p.Cliente = c.ID_Cliente
WHERE p.Status = 'Entregue'
GROUP BY c.ID_Cliente, c.Nome_Cliente
ORDER BY Total_Cliente DESC;

-- 6.Categorias cujo preço médio de compra passa de 500.
SELECT c.Nome_Categoria, CAST(AVG(p.preco_de_compra) AS DECIMAL(10,2)) AS Preco_Medio
FROM Categoria AS c 
JOIN Produtos AS p
ON p.categoria = c.ID_Categoria
GROUP BY c.ID_Categoria, c.Nome_Categoria
HAVING AVG(p.preco_de_compra) > 500
ORDER BY Preco_Medio DESC

-- 7.Por país de origem: quantos fornecedores e quantos produtos.
SELECT f.pais_de_origem, 
COUNT(DISTINCT f.ID_Fornecedor) AS Forncedores, 
COUNT(p.nome_produto) AS Produtos_Fornecedor
FROM Fornecedor AS f 
LEFT JOIN Produtos AS p 
ON p.fornecedor = f.ID_Fornecedor
GROUP BY f.pais_de_origem
ORDER BY Produtos_Fornecedor DESC

-- 8.Quantidade de pedidos e faturamento por mês.
SELECT 
    YEAR(Data_do_Pedido) AS Ano, 
    MONTH(Data_do_Pedido) AS Mes, 
    COUNT(ID_Pedidos) AS Pedidos,
    SUM(Total_do_Pedido) AS Faturamento
FROM Pedidos
GROUP BY YEAR(Data_do_Pedido), MONTH(Data_do_Pedido)
ORDER BY Ano, Mes ASC

-- 9.clientes que têm pelo menos um pedido cancelado, mostrando quantos pedidos cada um tem no total e quantos foram cancelados.
SELECT 
    c.Nome_Cliente, 
    SUM(CASE WHEN p.Status = 'Cancelado' THEN 1 ELSE 0 END) AS Cancelados,
    COUNT(p.ID_Pedidos) AS Total_de_pedidos
FROM Cliente AS c 
JOIN Pedidos as p 
ON p.Cliente = c.ID_Cliente
GROUP BY c.ID_Cliente, c.Nome_Cliente
HAVING SUM(CASE WHEN p.Status = 'Cancelado' THEN 1 ELSE 0 END) >= 1
ORDER BY Total_de_pedidos DESC