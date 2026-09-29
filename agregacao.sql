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