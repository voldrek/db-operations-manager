import psycopg2
from faker import Faker
import random

# Inicializar o Faker para gerar dados aleatórios
fake = Faker()

# Função para conectar ao banco de dados PostgreSQL
def connect_db():
    return psycopg2.connect(
        dbname="MIS_Report_DB",  # Nome do banco de dados
        user="postgres",       # Usuário do banco
        password="153216",     # Senha do banco
        host="localhost",         # Servidor do banco
        port="5432",              # Porta padrão do PostgreSQL
        client_encoding="utf8"    # Força a codificação UTF-8
    )

# Função para inserir dados aleatórios na tabela de operações
def insert_operacoes(cursor):
    for _ in range(10):  # Insere 10 operações
        nome = fake.company()
        descricao = fake.text(max_nb_chars=200)
        cursor.execute("INSERT INTO operacoes (nome, descricao) VALUES (%s, %s)", (nome, descricao))

# Função para inserir dados aleatórios na tabela de funcionários
def insert_funcionarios(cursor, operacao_ids):
    for _ in range(20):  # Insere 20 funcionários
        nome = fake.name()
        cargo = fake.job()
        data_contratacao = fake.date_this_decade()
        salario = round(random.uniform(2500.00, 12000.00), 2)
        operacao_id = random.choice(operacao_ids)
        cursor.execute(
            "INSERT INTO funcionarios (nome, cargo, data_contratacao, salario, operacao_id) VALUES (%s, %s, %s, %s, %s)",
            (nome, cargo, data_contratacao, salario, operacao_id)
        )

# Função para inserir dados aleatórios na tabela de clientes
def insert_clientes(cursor, operacao_ids):
    for _ in range(30):  # Insere 30 clientes
        nome = fake.name()
        email = fake.email()
        telefone = fake.phone_number()[:20]
        operacao_id = random.choice(operacao_ids)
        cursor.execute(
            "INSERT INTO clientes (nome, email, telefone, operacao_id) VALUES (%s, %s, %s, %s)",
            (nome, email, telefone, operacao_id)
        )

# Função para inserir dados aleatórios na tabela de cliente_funcionario
def insert_cliente_funcionario(cursor, cliente_ids, funcionario_ids, operacao_ids):
    for _ in range(50):  # Insere 50 relações cliente-funcionário
        cliente_id = random.choice(cliente_ids)
        funcionario_id = random.choice(funcionario_ids)
        operacao_id = random.choice(operacao_ids)
        cursor.execute(
            "INSERT INTO cliente_funcionario (cliente_id, funcionario_id, operacao_id) VALUES (%s, %s, %s)",
            (cliente_id, funcionario_id, operacao_id)
        )

# Função principal
def main():
    # Conectar ao banco de dados
    conn = connect_db()
    cursor = conn.cursor()

    # Insere 10 operações
    insert_operacoes(cursor)

    # Obter os IDs das operações inseridas
    cursor.execute("SELECT id FROM operacoes")
    operacao_ids = [row[0] for row in cursor.fetchall()]

    # Insere 20 funcionários
    insert_funcionarios(cursor, operacao_ids)

    # Obter os IDs dos funcionários inseridos
    cursor.execute("SELECT id FROM funcionarios")
    funcionario_ids = [row[0] for row in cursor.fetchall()]

    # Insere 30 clientes
    insert_clientes(cursor, operacao_ids)

    # Obter os IDs dos clientes inseridos
    cursor.execute("SELECT id FROM clientes")
    cliente_ids = [row[0] for row in cursor.fetchall()]

    # Insere 50 relações cliente-funcionário
    insert_cliente_funcionario(cursor, cliente_ids, funcionario_ids, operacao_ids)

    # Commit das transações
    conn.commit()

    # Fechar a conexão
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
