<<<<<<< HEAD
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
=======
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

-- Exercícios Intermediários parte 2
-- Selecionar os funcionários e seus respectivos departamentos.
SELECT f.nome AS funcionario, d.nome AS departamento
FROM funcionarios f
LEFT JOIN departamento_funcionarios df ON f.id = df.funcionario_id
LEFT JOIN departamentos d ON df.departamento_id = d.id
ORDER BY f.nome

-- Selecionar os funcionários, seus respectivos dependentes e departamentos
SELECT f.nome AS funcionario, fd.nome_dependente AS dependente, d.nome AS departamento
FROM funcionarios f
LEFT JOIN funcionarios_dependentes fd ON f.id = fd.funcionario_id
LEFT JOIN departamento_funcionarios df ON f.id = df.funcionario_id
LEFT JOIN departamentos d ON df.departamento_id = d.id;

-- Selecionar os projetos e seus respectivos departamentos.
SELECT d.nome AS departamento, p.nome AS projeto
FROM departamentos d
JOIN projetos p ON d.id = p.departamento_id

-- Selecionar os funcionários que estão trabalhando em mais de um projeto.
SELECT f.nome AS funcionario, COUNT(p.nome) AS projetos
FROM funcionarios f
JOIN projetos_funcionario pf ON f.id = pf.funcionario_id
JOIN projetos p ON pf.projeto_id = p.id
GROUP BY f.id, f.nome
HAVING COUNT(p.nome) > 1;

-- Selecionar os departamentos que têm um orçamento superior a R$ 1.000.000.
SELECT nome AS departamento, orcamento
FROM departamentos
WHERE orcamento > 1000000

-- Selecionar os clientes que não têm funcionários associados.
SELECT c.nome AS cliente, f.nome AS funcionario
FROM clientes c
JOIN cliente_funcionario cf ON c.id = cf.cliente_id
JOIN funcionarios f ON cf.cliente_id = f.id
WHERE f.nome IS NULL

-- Selecionar os funcionários que têm dependentes e estão associados a um projeto.
SELECT f.nome AS funcionario, d.nome_dependente AS dependente, p.nome AS projetos
FROM funcionarios f
JOIN funcionarios_dependentes d ON f.id = d.funcionario_id
JOIN projetos_funcionario pf ON d.funcionario_id = pf.funcionario_id
JOIN projetos p ON pf.projeto_id = p.id

-- Selecionar o nome do funcionário, o nome do projeto e o nome do departamento.
SELECT f.nome AS funcionario, p.nome AS projeto, d.nome AS departamento
FROM funcionarios f
JOIN departamento_funcionarios df ON f.id = df.funcionario_id
JOIN projetos_funcionario pf ON df.funcionario_id = pf.funcionario_id
JOIN projetos p ON pf.projeto_id = p.id
JOIN departamentos d ON p.departamento_id = d.id;

-- Calcular o número de dependentes por funcionário.
SELECT f.nome AS funcionario, count(d.nome_dependente) numero_dependentes
FROM funcionarios f
JOIN funcionarios_dependentes d ON f.id = d.funcionario_id
GROUP BY f.nome
ORDER BY numero_dependentes DESC

-- Selecionar os projetos que estão em andamento (data_fim é nula) e o nome do departamento responsável.
SELECT p.nome AS projetos, d.nome AS departamento
FROM projetos p
JOIN departamentos d ON p.departamento_id = d.id
WHERE p.data_fim IS NOT NULL

-- Selecionar os funcionários que ganham mais que a média salarial de seu departamento.
-- Selecionar os funcionários que ganham mais que a média salarial de seu departamento.
SELECT f.nome AS funcionario, f.salario, d.nome AS departamento
FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
WHERE f.salario > (
    SELECT AVG(f2.salario)
    FROM funcionarios f2
    WHERE f2.departamento_id = f.departamento_id
);

-- Selecionar os funcionários e seus dependentes
SELECT f.nome AS funcionario, fd.nome_dependente AS dependente
FROM funcionarios f
JOIN funcionarios_dependentes fd ON f.id = fd.funcionario_id






>>>>>>> 7bd5705 (Adicionando novos arquivos)
