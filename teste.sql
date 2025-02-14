CREATE TABLE projetos_funcionario(
    id SERIAL PRIMARY KEY,
    projeto_id INTEGER not NULL,
    funcionario_id INTEGER NOT NULL,
    Foreign Key (projeto_id) REFERENCES projetos(id),
    Foreign Key (funcionario_id) REFERENCES funcionarios(id)
)

SELECT * FROM funcionarios

INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(1, 26), -- William Fletcher
(1, 38), -- James Kent
(1, 21); -- Katrina Walker

-- Projeto 2: Treinamento de Vendedores
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(2, 34), -- Daryl Casey
(2, 27), -- Kyle Figueroa
(2, 32); -- Jared Green

-- Projeto 3: Migração de Servidores
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(3, 41), -- Sarah Smith
(3, 50), -- Ricardo Garner
(3, 36); -- Sarah Jones

-- Projeto 4: Desenvolvimento de Sistema Interno
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(4, 53), -- Sabrina Cabrera
(4, 59), -- Emily Phillips
(4, 52); -- Amy Rowland

-- Projeto 5: Recrutamento para Expansão
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(5, 42), -- Jesse Ramirez
(5, 43), -- Abigail Fuentes
(5, 37); -- Olivia Perez

-- Projeto 6: Plano de Benefícios 2025
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(6, 46), -- Stephen Williams
(6, 45), -- Jay Rojas
(6, 39); -- Valerie Mccarthy

-- Projeto 9: Campanha Publicitária de Verão
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(9, 33), -- Wendy Roberts
(9, 48), -- Aaron Johnson
(9, 54); -- Taylor Stanley

-- Projeto 10: Análise de Mercado e Tendências
INSERT INTO projetos_funcionario (projeto_id, funcionario_id) VALUES
(10, 44), -- Susan Frey
(10, 49), -- Shane Martin
(10, 58); -- Terry Cox