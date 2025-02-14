<<<<<<< HEAD
--Criando a tabela de funcionários
create table funcionarios (
	id serial primary key,
	nome varchar(100) not null,
	cargo varchar(100) not null,
	data_contratacao DATE,
	salario decimal(10,2)
);
--criando a tabela de clientes
create table clientes (
	id serial primary key,
	nome varchar(100) not null,
	email varchar(100) unique not null,
	telefone varchar(20),
	funcionario_id int references funcionarios(id) on delete set null
);
--criando a tabela operacoes
create table operacoes (
	id serial primary key,
	nome varchar(100) unique not null,
	descricao text
);


-- Adiciona a coluna operacao_id à tabela clientes para indicar a qual operação o cliente pertence
ALTER TABLE clientes
ADD COLUMN operacao_id INT,

-- Define a chave estrangeira que referencia a tabela operacoes
-- Se a operação for excluída, o campo operacao_id no cliente será definido como NULL
ADD CONSTRAINT fk_operacao_cliente FOREIGN KEY (operacao_id) REFERENCES operacoes(id) ON DELETE SET NULL;


-- Adiciona a coluna operacao_id à tabela funcionarios para indicar a qual operação o funcionário pertence
ALTER TABLE funcionarios
ADD COLUMN operacao_id INT,

-- Define a chave estrangeira que referencia a tabela operacoes
-- Se a operação for excluída, o campo operacao_id no funcionário será definido como NULL
ADD CONSTRAINT fk_operacao_funcionario FOREIGN KEY (operacao_id) REFERENCES operacoes(id) ON DELETE SET NULL;


-- Cria a tabela intermediária cliente_funcionario para representar a relação muitos-para-muitos
-- entre clientes e funcionários, garantindo que ambos pertençam à mesma operação
CREATE TABLE cliente_funcionario (
    id SERIAL PRIMARY KEY,  -- Chave primária da tabela

    -- Chave estrangeira para clientes, garantindo que, se um cliente for excluído,
    -- a relação correspondente também seja removida (ON DELETE CASCADE)
    cliente_id INT REFERENCES clientes(id) ON DELETE CASCADE,

    -- Chave estrangeira para funcionários, garantindo que, se um funcionário for excluído,
    -- a relação correspondente também seja removida (ON DELETE CASCADE)
    funcionario_id INT REFERENCES funcionarios(id) ON DELETE CASCADE,

    -- Chave estrangeira para operações, garantindo que o relacionamento cliente-funcionário
    -- ocorra dentro da mesma operação
    operacao_id INT REFERENCES operacoes(id) ON DELETE CASCADE,

    -- Garante que um mesmo cliente e funcionário não sejam associados mais de uma vez na mesma operação
    CONSTRAINT unique_cliente_funcionario_operacao UNIQUE (cliente_id, funcionario_id, operacao_id)
);

select * from clientes;

ALTER TABLE clientes ALTER COLUMN telefone TYPE VARCHAR(20);


MIS_Report_DB
SELECT current_user;

=======
--Criando a tabela de funcionários
create table funcionarios (
	id serial primary key,
	nome varchar(100) not null,
	cargo varchar(100) not null,
	data_contratacao DATE,
	salario decimal(10,2)
);
--criando a tabela de clientes
create table clientes (
	id serial primary key,
	nome varchar(100) not null,
	email varchar(100) unique not null,
	telefone varchar(20),
	funcionario_id int references funcionarios(id) on delete set null
);
--criando a tabela operacoes
create table operacoes (
	id serial primary key,
	nome varchar(100) unique not null,
	descricao text
);


-- Adiciona a coluna operacao_id à tabela clientes para indicar a qual operação o cliente pertence
ALTER TABLE clientes
ADD COLUMN operacao_id INT,

-- Define a chave estrangeira que referencia a tabela operacoes
-- Se a operação for excluída, o campo operacao_id no cliente será definido como NULL
ADD CONSTRAINT fk_operacao_cliente FOREIGN KEY (operacao_id) REFERENCES operacoes(id) ON DELETE SET NULL;


-- Adiciona a coluna operacao_id à tabela funcionarios para indicar a qual operação o funcionário pertence
ALTER TABLE funcionarios
ADD COLUMN operacao_id INT,

-- Define a chave estrangeira que referencia a tabela operacoes
-- Se a operação for excluída, o campo operacao_id no funcionário será definido como NULL
ADD CONSTRAINT fk_operacao_funcionario FOREIGN KEY (operacao_id) REFERENCES operacoes(id) ON DELETE SET NULL;


-- Cria a tabela intermediária cliente_funcionario para representar a relação muitos-para-muitos
-- entre clientes e funcionários, garantindo que ambos pertençam à mesma operação
CREATE TABLE cliente_funcionario (
    id SERIAL PRIMARY KEY,  -- Chave primária da tabela

    -- Chave estrangeira para clientes, garantindo que, se um cliente for excluído,
    -- a relação correspondente também seja removida (ON DELETE CASCADE)
    cliente_id INT REFERENCES clientes(id) ON DELETE CASCADE,

    -- Chave estrangeira para funcionários, garantindo que, se um funcionário for excluído,
    -- a relação correspondente também seja removida (ON DELETE CASCADE)
    funcionario_id INT REFERENCES funcionarios(id) ON DELETE CASCADE,

    -- Chave estrangeira para operações, garantindo que o relacionamento cliente-funcionário
    -- ocorra dentro da mesma operação
    operacao_id INT REFERENCES operacoes(id) ON DELETE CASCADE,

    -- Garante que um mesmo cliente e funcionário não sejam associados mais de uma vez na mesma operação
    CONSTRAINT unique_cliente_funcionario_operacao UNIQUE (cliente_id, funcionario_id, operacao_id)
);

select * from clientes;

ALTER TABLE clientes ALTER COLUMN telefone TYPE VARCHAR(20);


MIS_Report_DB
SELECT current_user;

>>>>>>> 7bd5705 (Adicionando novos arquivos)
