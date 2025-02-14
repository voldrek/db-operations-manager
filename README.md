# Projeto de Treinamento em SQL e Automação com Python

Este repositório foi criado como parte de um projeto de aprendizado e prática, com o objetivo de desenvolver habilidades em SQL (básico, intermediário e avançado) e automação de banco de dados utilizando Python.

O projeto inclui a criação de um banco de dados relacional para gerenciar clientes, funcionários e operações, além de mostrar como automatizar a alimentação de dados no banco de dados usando Python.

## Estrutura do Projeto

O projeto está dividido em duas partes principais:
1. **SQL**: Desenvolvimento de consultas e manipulação de dados em SQL, abrangendo níveis básico, intermediário e avançado.
2. **Automação em Python**: Criação de scripts para automatizar a alimentação e manipulação dos dados no banco de dados.

### Funcionalidades Implementadas:
- **Criação de Banco de Dados**: Estrutura de tabelas relacionadas com informações de clientes, funcionários e operações.
- **Consultas SQL**:
  - Consultas básicas para seleção e inserção de dados.
  - Consultas intermediárias para manipulação e filtragem de dados com agregações.
  - Consultas avançadas envolvendo junções complexas e subconsultas.
- **Automação de Banco de Dados com Python**:
  - Script Python para alimentar o banco de dados com dados automatizados.
  - Manipulação de dados de maneira dinâmica, como inserção e atualização.

## Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas:

1. **funcionarios**: Contém dados dos funcionários, como nome, cargo, data de contratação e salário.
2. **clientes**: Contém dados dos clientes, como nome, e-mail, telefone e um campo para referência ao funcionário responsável.
3. **operacoes**: Contém informações sobre as operações que os funcionários executam para os clientes.
4. **cliente_funcionario**: Tabela intermediária que mapeia a relação entre clientes e funcionários, além de associá-los a uma operação específica.

Além disso, o banco de dados possui operações de **criação**, **alteração** e **relacionamento** entre tabelas.

## Como Usar

### Requisitos

- Python 3.x
- PostgreSQL ou qualquer outro banco de dados relacional compatível com SQL.
- Bibliotecas Python:
  - psycopg2 (ou equivalente para se conectar ao banco de dados)
  - pandas (opcional, para manipulação de dados)

### Configuração do Banco de Dados

1. Clone este repositório:
    ```bash
    [git clone https://github.com/seu-usuario/projeto-sql-python.git](https://github.com/voldrek/db-operations-manager.git)
    ```
2. Acesse o banco de dados PostgreSQL ou outro de sua escolha.
3. Execute os scripts SQL presentes no diretório `sql/` para criar as tabelas e definir as chaves estrangeiras.
4. Rode o script Python para alimentar o banco de dados com dados fictícios ou reais, caso tenha um arquivo CSV ou outro tipo de fonte de dados.

### Scripts SQL

Os scripts SQL estão organizados da seguinte maneira:
- **1_criar_tabelas.sql**: Cria as tabelas de funcionários, clientes e operações.
- **2_alterar_tabelas.sql**: Adiciona colunas e define chaves estrangeiras.
- **3_consultas.sql**: Contém exemplos de consultas SQL para treino (básico, intermediário e avançado).

### Automação com Python

O script Python realiza as seguintes tarefas:
1. Conexão com o banco de dados.
2. Alimentação automatizada de dados nas tabelas `clientes`, `funcionarios` e `operacoes`.
3. Execução de consultas SQL para manipular dados conforme necessário.

## Exemplo de Consultas SQL

Aqui estão alguns exemplos de consultas que você pode encontrar neste repositório:

- **Consulta Básica**: Selecionar todos os funcionários e seus salários.
  ```sql
  SELECT nome, salario FROM funcionarios;
  SELECT f.nome AS funcionario, COUNT(c.nome) AS numero_clientes
  FROM funcionarios f
  JOIN cliente_funcionario cf ON f.id = cf.funcionario_id
  JOIN clientes c ON cf.cliente_id = c.id
  GROUP BY f.nome;
  
  SELECT c.nome AS cliente, f.nome AS funcionario, f.salario AS salario_funcionario
  FROM clientes c
  JOIN cliente_funcionario cf ON c.id = cf.cliente_id
  JOIN funcionarios f ON cf.funcionario_id = f.id
  WHERE f.salario > (SELECT AVG(salario) FROM funcionarios);```


Esse **README.md** fornece uma visão clara do seu projeto, como configurá-lo, como os dados são manipulados e como os scripts são organizados. Ele também inclui exemplos de consultas SQL e descreve como você pode contribuir para o repositório.

Se precisar de mais alguma coisa, só avisar!

