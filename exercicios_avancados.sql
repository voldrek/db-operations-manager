<<<<<<< HEAD
-- 1. Selecionar o funcionário com o maior salário.
SELECT nome,salario
from funcionarios
ORDER BY salario DESC
LIMIT 1

-- 2. Selecionar o cliente que está associado ao maior número de funcionários.
SELECT c.nome AS clientes, COUNT(f.nome) total
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
GROUP BY c.nome
ORDER BY total DESC
LIMIT 1;

-- 3. Selecionar os funcionários que ganham acima da média salarial.
SELECT nome, salario, TO_CHAR((SELECT AVG(salario) FROM funcionarios), 'FM$999999999.00') AS media_geral
FROM funcionarios
WHERE salario > (SELECT AVG(salario) FROM funcionarios);

-- 4. Selecionar os clientes que estão associados a funcionários de um determinado cargo.
SELECT c.nome, f.nome , f.cargo
FROM clientes c
JOIN cliente_funcionario cf on c.id = cf.cliente_id
JOIN funcionarios f on cf.funcionario_id = f.id
WHERE f.cargo = 'Administrator'

-- 5. Criar uma consulta que retorne o nome do funcionário, o nome do cliente e o salário do funcionário, ordenados por salário em ordem decrescente.
SELECT DISTINCT f.nome AS funcionario
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id
WHERE c.email IS NULL;

-- 6. Selecionar os funcionários que têm clientes associados, mas não têm email cadastrado.
SELECT DISTINCT c.nome AS cliente
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE c.email IS NULL;

-- 7. Calcular o total de salários pagos por empresa.
SELECT c.nome AS cliente, to_char(sum(f.salario),'FM$9999999999.00') AS total_pago
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f on cf.funcionario_id = f.id
GROUP BY c.nome
ORDER BY total_pago DESC

-- variação da questão 7 total pago pela a empresa
SELECT to_char(SUM(salario),'FM$9999999999.00') AS total_pago
from funcionarios;

-- 8. Selecionar os clientes que estão associados a funcionários contratados nos últimos 6 meses.
SELECT c.nome AS clientes, f.nome AS funcionario, f.data_contratacao
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE data_contratacao >= CURRENT_DATE - INTERVAL '6 months'

-- 9. Criar uma consulta que retorne o nome do funcionário, o número de clientes associados e a média salarial dos funcionários com mais de 3 clientes.
SELECT f.nome AS funcionario, COUNT(c.nome) AS numero_clientes, AVG(f.salario) AS media_salarial
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id
GROUP BY f.nome
HAVING COUNT(c.nome) > 3


-- 10. Selecionar os clientes que estão associados a funcionários que ganham mais que a média salarial.
SELECT c.nome AS cliente,
       f.nome AS funcionario, 
       f.salario AS salario_funcionario,
       to_char((SELECT AVG(salario) FROM funcionarios), 'FM$9999999999.00') AS media_salarial
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE f.salario > (SELECT AVG(salario) FROM funcionarios);



=======
-- 1. Selecionar o funcionário com o maior salário.
SELECT nome,salario
from funcionarios
ORDER BY salario DESC
LIMIT 1

-- 2. Selecionar o cliente que está associado ao maior número de funcionários.
SELECT c.nome AS clientes, COUNT(f.nome) total
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
GROUP BY c.nome
ORDER BY total DESC
LIMIT 1;

-- 3. Selecionar os funcionários que ganham acima da média salarial.
SELECT nome, salario, TO_CHAR((SELECT AVG(salario) FROM funcionarios), 'FM$999999999.00') AS media_geral
FROM funcionarios
WHERE salario > (SELECT AVG(salario) FROM funcionarios);

-- 4. Selecionar os clientes que estão associados a funcionários de um determinado cargo.
SELECT c.nome, f.nome , f.cargo
FROM clientes c
JOIN cliente_funcionario cf on c.id = cf.cliente_id
JOIN funcionarios f on cf.funcionario_id = f.id
WHERE f.cargo = 'Administrator'

-- 5. Criar uma consulta que retorne o nome do funcionário, o nome do cliente e o salário do funcionário, ordenados por salário em ordem decrescente.
SELECT DISTINCT f.nome AS funcionario
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id
WHERE c.email IS NULL;

-- 6. Selecionar os funcionários que têm clientes associados, mas não têm email cadastrado.
SELECT DISTINCT c.nome AS cliente
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE c.email IS NULL;

-- 7. Calcular o total de salários pagos por empresa.
SELECT c.nome AS cliente, to_char(sum(f.salario),'FM$9999999999.00') AS total_pago
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f on cf.funcionario_id = f.id
GROUP BY c.nome
ORDER BY total_pago DESC

-- variação da questão 7 total pago pela a empresa
SELECT to_char(SUM(salario),'FM$9999999999.00') AS total_pago
from funcionarios;

-- 8. Selecionar os clientes que estão associados a funcionários contratados nos últimos 6 meses.
SELECT c.nome AS clientes, f.nome AS funcionario, f.data_contratacao
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE data_contratacao >= CURRENT_DATE - INTERVAL '6 months'

-- 9. Criar uma consulta que retorne o nome do funcionário, o número de clientes associados e a média salarial dos funcionários com mais de 3 clientes.
SELECT f.nome AS funcionario, COUNT(c.nome) AS numero_clientes, AVG(f.salario) AS media_salarial
FROM funcionarios f
JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
JOIN clientes c ON cf.cliente_id = c.id
GROUP BY f.nome
HAVING COUNT(c.nome) > 3


-- 10. Selecionar os clientes que estão associados a funcionários que ganham mais que a média salarial.
SELECT c.nome AS cliente,
       f.nome AS funcionario, 
       f.salario AS salario_funcionario,
       to_char((SELECT AVG(salario) FROM funcionarios), 'FM$9999999999.00') AS media_salarial
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.funcionario_id = f.id
WHERE f.salario > (SELECT AVG(salario) FROM funcionarios);


>>>>>>> 7bd5705 (Adicionando novos arquivos)
