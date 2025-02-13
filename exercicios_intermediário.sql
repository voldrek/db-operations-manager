-- 1. Selecionar os funcionários e seus respectivos clientes.
SELECT f.nome AS Funcionarios,c.nome AS Clientes
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id;

-- 2. Selecionar os clientes que não têm um funcionário associado.
SELECT c.nome AS Cliente
FROM clientes c
LEFT JOIN cliente_funcionario cf ON c.id = cf.cliente_id
WHERE cf.funcionario_id IS NULL;

-- 3. Selecionar o número de clientes por funcionário.
SELECT f.nome AS funcionario, count(c.nome) AS total
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c on cf.cliente_id = c.id
GROUP BY f.nome
ORDER BY total desc

-- 4. Selecionar os funcionários com salário acima de um certo valor.
SELECT nome,salario FROM funcionarios WHERE salario > 2500

-- 5. Selecionar os clientes com um determinado funcionário associado.
SELECT f.nome,c.nome AS clientes
FROM clientes c
JOIN cliente_funcionario cf on c.id = cf.cliente_id
JOIN funcionarios f on cf.funcionario_id = f.id
WHERE f.nome = 'Sandra Silva'

-- 6. Selecionar o nome do funcionário, o nome do cliente e a data de contratação do funcionário.
SELECT c.nome AS Cliente, f.nome AS Funcionário, f.data_contratacao AS Data_Contratacao
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id

-- 7. Selecionar os funcionários que não têm clientes associados.
SELECT f.nome AS funcionários
FROM funcionarios f
LEFT JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
WHERE cf.cliente_id IS NULL;


-- 8. Calcular a média salarial dos funcionários.
SELECT to_char(SUM(salario)/COUNT(salario),'$9999.00') AS média
FROM funcionarios

-- 9. Selecionar os clientes que têm mais de um funcionário associado.
SELECT c.nome AS clientes, COUNT(f.nome) AS total
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
GROUP BY c.nome
HAVING COUNT(f.nome) > 1
ORDER BY total DESC

-- 10. Selecionar os funcionários que foram contratados no último ano.
SELECT nome, data_contratacao
FROM funcionarios
WHERE data_contratacao >= CURRENT_DATE - INTERVAL '1 year';