
SELECT p.nome AS Produto, 
       p.descricao, 
       p.preco_atual AS Preco, 
       c.nome AS Categoria
FROM Produtos p
INNER JOIN Categorias c ON p.id_categoria = c.id_categoria;


SELECT pd.id_pedido, 
       pd.status_pedido, 
       pd.valor_total, 
       m.numero_mesa, 
       m.capacidade
FROM Pedidos pd
INNER JOIN Mesas m ON pd.id_mesa = m.id_mesa
WHERE pd.status_pedido IN ('Aberto', 'Preparando');


SELECT pd.id_pedido, 
       pd.data_hora, 
       pd.valor_total, 
       c.nome AS Nome_Cliente, 
       c.telefone
FROM Pedidos pd
INNER JOIN Clientes c ON pd.id_cliente = c.id_cliente;


SELECT ip.id_pedido, 
       pr.nome AS Produto_Consumido, 
       ip.quantidade, 
       ip.preco_unitario, 
       (ip.quantidade * ip.preco_unitario) AS Subtotal,
       ip.observacao
FROM Itens_Pedido ip
INNER JOIN Produtos pr ON ip.id_produto = pr.id_produto
INNER JOIN Pedidos pd ON ip.id_pedido = pd.id_pedido;


SELECT c.nome AS Cliente, 
       m.numero_mesa, 
       pd.status_pedido, 
       pd.data_hora
FROM Pedidos pd
INNER JOIN Clientes c ON pd.id_cliente = c.id_cliente
INNER JOIN Mesas m ON pd.id_mesa = m.id_mesa;


SELECT pd.id_pedido, 
       cat.nome AS Categoria, 
       pr.nome AS Produto, 
       ip.quantidade,
       pd.forma_pagamento
FROM Pedidos pd
INNER JOIN Itens_Pedido ip ON pd.id_pedido = ip.id_pedido
INNER JOIN Produtos pr ON ip.id_produto = pr.id_produto
INNER JOIN Categorias cat ON pr.id_categoria = cat.id_categoria
WHERE pd.status_pedido = 'Pago';

SELECT c.nome AS Cliente, 
       c.email,
       COUNT(pd.id_pedido) AS Quantidade_Pedidos, 
       SUM(pd.valor_total) AS Total_Gasto_Historico
FROM Clientes c
INNER JOIN Pedidos pd ON c.id_cliente = pd.id_cliente
GROUP BY c.id_cliente, c.nome, c.email
ORDER BY Total_Gasto_Historico DESC;


