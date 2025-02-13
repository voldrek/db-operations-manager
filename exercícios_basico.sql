-- 1. Selecionar todos os funcionários.
Select * from funcionarios;

-- 2. Selecionar o nome e o cargo de todos os funcionários.
select nome,cargo from funcionarios;

-- 3. Selecionar todos os clientes.
select * from clientes;

-- 4. Selecionar o nome e o email dos clientes.
select nome,email from clientes;

-- 5. Contar o número de funcionários.
SELECT COUNT(*) from funcionarios;

-- 6. Selecionar os funcionários contratados após uma determinada data.
SELECT nome,salario FROM funcionarios WHERE data_contratacao BETWEEN '2022-01-01' AND '2025-12-01' ;

-- 7. Selecionar os clientes cujo nome começa com a letra "A".
SELECT * FROM clientes WHERE nome ILIKE 'a%';

-- 8. Selecionar os funcionários que ganham mais de R$ 5000.
SELECT nome,salario,id FROM funcionarios WHERE salario >= 5000;

-- 9. Selecionar os clientes que não possuem email cadastrado.
SELECT nome,email FROM clientes WHERE email IS NULL ;

-- 10. Selecionar os funcionários ordenados por salário em ordem decrescente.
SELECT nome,salario FROM funcionarios ORDER BY salario DESC;