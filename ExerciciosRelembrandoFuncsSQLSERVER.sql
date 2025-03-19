--CHARINDEX

--Encontrar a posição do caractere '@' nos e-mails da tabela clientes

SELECT email, CHARINDEX('@', email, 3) Posicao_Arroba from clientes

--2️ Extrair o nome do usuário do e-mail antes do '@' na tabela clientes

SELECT email, LEFT(email, CHARINDEX('@', email) -1) Nome from clientes


-- Descobrir a posição do primeiro traço '-' em números de telefone na tabela clientes

SELECT telefone, CHARINDEX('-',  telefone) PosicaoHifen from Clientes


--patindex
--Encontrar a posição da palavra 'Promoção' na coluna descricao da tabela produtos

select * from produtos

SELECT Descricao, PATINDEX('%Promoção%', Descricao) from Produtos


--Verificar se um telefone segue um padrão específico (exemplo: '(99) 9999-9999') na tabela clientes
SELECT telefone, PATINDEX('%[0-9][0-9]%[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%', telefone) AS posicao_numero FROM clientes


--Encontrar produtos onde a descrição começa com um número na tabela produtos

SELECT PATINDEX('[0-9]%', Descricao) FROM Produtos


--IIF

-- Classificar clientes como 'VIP' se gasto_total > 1000, senão 'Comum' na tabela clientes

SELECT * FROM PEDIDOS
SELECT nome, IIF(gasto_total > 1000, 'vip', 'comun'), gasto_total from clientes

--Verificar estoque crítico: se quantidade for menor que 5, retornar 'Estoque Baixo', senão 'Estoque Ok' na tabela produtos

select nome_produto, quantidade, IIF(quantidade < 5, 'Estoque Baixo', 'Estoque OK') FROM PRODUTOS

--Verificar status de pagamento: se valor_pago >= valor_total, exibir 'Pago', senão 'Pendente' na tabela pedidos

SELECT IIF(valor_pago >= valor_total, 'Pago', 'Pendente') Status, valor_total - valor_pago Falta_Pagar FROM PEDIDOS

-- Verificar se um pedido está atrasado: se data_entrega < GETDATE(), retornar 'Atrasado', senão 'No Prazo' na tabela pedidos

select data_entrega, data_pedido,IIF(data_entrega < GETDATE(), 'No prazo', 'Atrasado') Pedidos_atrasados FROM pedidos


-- Desafio Final
-- Criar um relatório que:
--Exibe o primeiro nome do cliente extraído do campo nome
-- Indica se o cliente é 'VIP' ou 'Comum' com base no gasto_total
-- Verifica se o e-mail contém 'gmail' usando PATINDEX


SELECT LEFT(nome,CHARINDEX(' ', nome + ' ') - 1) nome,gasto_total, IIF(gasto_total > 1000, 'vip', 'comun') _status, email, IIF(PATINDEX('%GMAIL%',email) > 0, 'Possui GMAIL', 'Não possui') DominoEmail FROM Clientes

