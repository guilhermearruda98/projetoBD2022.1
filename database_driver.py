import mysql.connector


class DatabaseDriver ():

    def __init__(self, host, database, user, password):
        self.host = host
        self.database = database
        self.user = user
        self.password = password

        self.connection = mysql.connector.connect(
            host=self.host,
            database=self.database,
            user=self.user,
            password=self.password)

        if self.connection.is_connected():
            print("connected")
        else:
            print("fail")

        self.cursor = self.connection.cursor()

    def close(self):
        self.connection.close()

    def inserir_vendedor (self, nome, contato, cargo):
        _query = ("INSERT INTO vendedor "
                      "VALUES (%s, %s, %s)")
        
        _data = (nome, contato, cargo)
        self.cursor.execute(_query, _data)
        _result = self.cursor.fetchall()

        return _result
    
    def inserir_produto (self, fabricante, nome, valor, unidade, volume, 
                         cor, quantidade):

        _query = ("INSERT INTO produtos "
                      "VALUES (%s, %s, %f, %s, %s, %s, %s)")
        
        _data = (fabricante, nome, valor, unidade, volume, cor, quantidade)
        self.cursor.execute(_query, _data)
        _result = self.cursor.fetchall()

        return _result

    def inserir_cliente (self, cpf, nome, email, rua, numero, 
                         bairro, cidade, estado, complemento, telefone):

        _query = ("BEGIN TRANSACTION"
                    "INSERT INTO cliente VALUES (%s, %s, %s);"
                    "INSERT INTO contato_clientes VALUES (LAST_INSERT_ID(), %s);"
                    "INSERT INTO endereco_clientes (LAST_INSERT_ID(), %s, %s, %s, %s, %s, %s);"
                  "COMMIT")
        
        _data = (cpf, nome, email, rua, numero, 
                 bairro, cidade, estado, complemento, telefone)
        self.cursor.execute(_query, _data)
        _result = self.cursor.fetchall()

        return _result    

    def inserir_pedido (self, cliente, vendedor, valor_pedido, data_pedido, previsao_entrega,
                        desconto_pedido, forma_pagamento):

        _query = ("BEGIN TRANSACTION"
                    "INSERT INTO pedidos VALUES (%s, %s, %s, %s, %s, %s, %s);"
                    "INSERT INTO produtos_pedido VALUES (LAST_INSERT_ID(), %s);"
                  "COMMIT")
        
        _data = (cliente, vendedor, valor_pedido, data_pedido, previsao_entrega,
                 desconto_pedido, forma_pagamento)
        self.cursor.execute(_query, _data)
        _result = self.cursor.fetchall()

        return _result    

    def consultar_vendedores (self):

        _query = ("SELECT * FROM vendedor;")

        self.cursor.execute(_query)
        _result = self.cursor.fetchall()

        return _result

    def consultar_clientes (self, cpf):

        _query = ("""SELECT * FROM clientes, contato_clientes, endereco_clientes 
                  WHERE clientes.id_cliente = contato_clientes.id_cliente AND clientes.id_endereco = endereco_clientes.id_endereco;""")
        
        self.cursor.execute(_query)
        _result = self.cursor.fetchall()

        return _result

    def consultar_produtos (self):

        _query = ("SELECT * FROM produtos;")

        self.cursor.execute(_query)
        _result = self.cursor.fetchall()

        return _result

    def consultar_pedidos (self):

        _queryA = ("SELECT * FROM pedidos, clientes"
                   "WHERE pedidos.id_cliente = clientes.id_cliente;")

        self.cursor.execute(_query)
        _result = self.cursor.fetchall()

        return _result