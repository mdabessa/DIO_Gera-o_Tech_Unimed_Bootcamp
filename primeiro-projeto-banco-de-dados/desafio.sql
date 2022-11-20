DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS cliente(
	idCliente int auto_increment primary key,
    Nome varchar(45),
    Endereco varchar(45),
    Tipo char(2),
    CPF char(11) not null,
    constraint unique_cpf_cliente unique(CPF)
);

CREATE TABLE IF NOT EXISTS fornecedor(
	idFornecedor int auto_increment primary key,
    RazaoSocial varchar(45),
    CNPJ varchar(45)
);

CREATE TABLE IF NOT EXISTS terceiro(
	idTerceiro int auto_increment primary key,
    RazalSocial varchar(45),
    Local_ varchar(45)
);

CREATE TABLE IF NOT EXISTS estoque(
	idEstoque int auto_increment primary key,
    Local_ varchar(45)
);

CREATE TABLE IF NOT EXISTS produto(
	idProduto int auto_increment primary key,
    Categoria varchar(45),
    Descricao varchar(45),
    Valor float
);

CREATE TABLE IF NOT EXISTS formas_pagamentos(
	idFormaPagamento int auto_increment primary key,
    Tipo varchar(45),
    NumeroCartao varchar(45),
    idCliente int,
    constraint fk_idCliente_pagamentos foreign key(idCliente) references cliente(idCliente)
);

CREATE TABLE IF NOT EXISTS pedido(
	idPedido int auto_increment primary key,
    Status_ varchar(45),
    Descricao varchar(255),
    idCliente int,
    Frete float,
    rastreio int,
    constraint fk_idCliente_pedido foreign key(idCliente) references cliente(idCliente)
);

CREATE TABLE IF NOT EXISTS produto_pedido(
	idProduto int,
    idPedido int,
    Quantidade int,
	primary key(idProduto, idPedido),
    constraint fk_idProduto_pedido foreign key(idProduto) references produto(idProduto),
    constraint fk_idPedido_produto foreign key(idPedido) references pedido(idPedido)
);

CREATE TABLE IF NOT EXISTS produto_estoque(
	idProduto int,
    idEstoque int,
    Quantidade int,
	primary key(idProduto, idEstoque),
    constraint fk_idProduto_estoque foreign key(idProduto) references produto(idProduto),
    constraint fk_idEstoque_produto foreign key(idEstoque) references estoque(idEstoque)
);

CREATE TABLE IF NOT EXISTS produto_fornecedor(
	idProduto int,
    idFornecedor int,
    Quantidade int,
	primary key(idProduto, idFornecedor),
    constraint fk_idProduto_fornecedor foreign key(idProduto) references produto(idProduto),
    constraint fk_idFornecedor_produto foreign key(idFornecedor) references fornecedor(idFornecedor)
);

INSERT INTO cliente(Nome, Endereco, Tipo, CPF) VALUES
('Joao', 'Rua 1', 'PF', '12345678901'),
('Maria', 'Rua 2', 'PF', '12345678902'),
('Jose', 'Rua 3', 'PF', '12345678903'),
('Pedro', 'Rua 4', 'PF', '12345678904'),
('Ana', 'Rua 5', 'PF', '12345678905'),
('Paulo', 'Rua 6', 'PF', '12345678906'),
('Carlos', 'Rua 7', 'PF', '12345678907'),
('Marcos', 'Rua 8', 'PF', '12345678908'),
('Julia', 'Rua 9', 'PF', '12345678909'),
('Rafael', 'Rua 10', 'PF', '12345678910');


INSERT INTO fornecedor(RazaoSocial, CNPJ) VALUES
('Fornecedor 1', '12345678901'),
('Fornecedor 2', '12345678902');


INSERT INTO terceiro(RazalSocial, Local_) VALUES
('Terceiro 1', 'Rua 1'),
('Terceiro 2', 'Rua 2');

INSERT INTO estoque(Local_) VALUES
('Rua 1'),
('Rua 2');

INSERT INTO produto(Categoria, Descricao, Valor) VALUES
('Categoria 1', 'Descricao 1', 10.00),
('Categoria 2', 'Descricao 2', 20.00),
('Categoria 3', 'Descricao 3', 30.00),
('Categoria 4', 'Descricao 4', 40.00),
('Categoria 5', 'Descricao 5', 50.00),
('Categoria 6', 'Descricao 6', 60.00),
('Categoria 7', 'Descricao 7', 70.00),
('Categoria 8', 'Descricao 8', 80.00),
('Categoria 9', 'Descricao 9', 90.00),
('Categoria 10', 'Descricao 10', 100.00);

INSERT INTO formas_pagamentos(Tipo, NumeroCartao, idCliente) VALUES
('Cartao', '12345678901', 1),
('Cartao', '12345678902', 2),
('Cartao', '12345678903', 3),
('Cartao', '12345678904', 4),
('Cartao', '12345678905', 5),
('Cartao', '12345678906', 6),
('Cartao', '12345678907', 7),
('Cartao', '12345678908', 8),
('Cartao', '12345678909', 9),
('Cartao', '12345678910', 10);

INSERT INTO pedido(Status_, Descricao, idCliente, Frete, rastreio) VALUES
('Em Analise', 'Descricao 1', 1, 0, 2346466),
('A Caminho', 'Descricao 2', 2, 2.00, 2346467),
('Entregue', 'Descricao 3', 3, 15.00, 2346468),
('Em Analise', 'Descricao 4', 4, 26.00, 2346469),
('A Caminho', 'Descricao 5', 5, 10.00, 2346470),
('Entregue', 'Descricao 6', 6, 20.00, 2346471),
('Em Analise', 'Descricao 7', 7, 24.00, 2346472),
('A Caminho', 'Descricao 8', 8, 12.00, 2346473),
('Entregue', 'Descricao 9', 9, 10.00, 2346474),
('Em Analise', 'Descricao 10', 10, 10.00, 2346475);

INSERT INTO produto_pedido(idProduto, idPedido, Quantidade) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1);

INSERT INTO produto_estoque(idProduto, idEstoque, Quantidade) VALUES
(1, 1, 100),
(2, 1, 100),
(3, 2, 100),
(4, 2, 100),
(5, 1, 100),
(6, 1, 100),
(7, 2, 100),
(8, 2, 100),
(9, 1, 100),
(10, 1, 100);

INSERT INTO produto_fornecedor(idProduto, idFornecedor, Quantidade) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 1, 300),
(4, 2, 400),
(5, 1, 500),
(6, 2, 600),
(7, 1, 700),
(8, 2, 800),
(9, 1, 900),
(10, 2, 1000);


-- Cliente x Pedido x Produto
SELECT c.Nome AS 'Nome do Cliente',
    ped.Frete + prod.Valor * prod_pedido.Quantidade AS 'Total do Pedido', 
    ped.Status_ AS 'Status do Pedido', 
    ped.rastreio AS 'Rastreio do Pedido',
    prod.Valor AS 'Valor do Produto',
    prod_pedido.Quantidade AS 'Quantidade do Produto',
    ped.Frete AS 'Frete do Pedido'
FROM cliente c, pedido ped, produto_pedido prod_pedido, produto prod
WHERE c.idCliente = ped.idCliente AND ped.idPedido = prod_pedido.idPedido AND prod_pedido.idProduto = prod.idProduto;