<<<<<<< HEAD
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
=======
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

-- Exercícios Básicos parte 2
-- 1. Criar a tabela departamentos com as colunas: id, nome e orcamento.
CREATE TABLE departamentos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    orcamento DECIMAL (20,2) NOT NULL
)

-- 2. Criar a tabela projetos com as colunas: id, nome, data_inicio, data_fim e departamento_id (chave estrangeira para departamentos).
CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    departamento_id INT REFERENCES departamentos(id) ON DELETE SET NULL
);

-- 3. Criar a tabela funcionario_projeto com as colunas: id, funcionario_id (chave estrangeira para funcionarios) e projeto_id (chave estrangeira para projetos).
CREATE TABLE funcionario_projeto (
    id SERIAL PRIMARY KEY,
    funcionario_id INT REFERENCES funcionarios(id) ON DELETE CASCADE,
    projeto_id INT REFERENCES projetos(id) ON DELETE CASCADE
);

-- 4. Criar a tabela dependentes com as colunas: id, nome, data_nascimento e funcionario_id (chave estrangeira para funcionarios).
CREATE TABLE funcionarios_dependentes (
    id SERIAL PRIMARY KEY,
    funcionario_id INT NOT NULL,
    nome_dependente VARCHAR(100),
    grau_parentesco VARCHAR(50),
    data_nascimento DATE,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);


-- 5. Adicionar a coluna endereco à tabela clientes.
ALTER TABLE clientes ADD COLUMN endereco VARCHAR(2000);

-- 6. Adicionar a coluna departamento_id (chave estrangeira para departamentos) à tabela funcionarios.
ALTER TABLE funcionarios ADD COLUMN departamento_id 
INT REFERENCES departamentos(id) ON DELETE SET NULL;

-- 7. Selecionar todos os departamentos.
SELECT * FROM departamentos;

-- 8. Selecionar o nome e o orçamento de todos os departamentos.
SELECT nome,orcamento FROM departamentos;

-- 9. Selecionar todos os projetos.
SELECT * FROM projetos;

-- 10. Selecionar o nome e a data de início de todos os projetos.
SELECT nome,data_inicio FROM projetos;


>>>>>>> 7bd5705 (Adicionando novos arquivos)
