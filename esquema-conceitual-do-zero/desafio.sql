DROP DATABASE IF EXISTS mecanica;
CREATE DATABASE mecanica;
USE mecanica;

CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL
);

CREATE TABLE veiculo(
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE equipe(
    idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    funcao VARCHAR(50) NOT NULL
);

CREATE TABLE empregado(
    idEmpregado INT PRIMARY KEY AUTO_INCREMENT,
    idEquipe INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    FOREIGN KEY (idEquipe) REFERENCES equipe(idEquipe)
);

CREATE TABLE ordem_servico(
    idOS INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status_ VARCHAR(50) NOT NULL,
    data_conclusao DATE NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    idCliente INT NOT NULL,
    idVeiculo INT NOT NULL,
    idEquipe INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo),
    FOREIGN KEY (idEquipe) REFERENCES equipe(idEquipe)
);


INSERT INTO cliente(nome, endereco)
VALUES ('João', 'Rua 1'),
       ('Maria', 'Rua 2');


INSERT INTO veiculo(idCliente) 
VALUES (1),
       (2);

INSERT INTO equipe(funcao)
VALUES ('Mecânico'),
         ('Pintor');

INSERT INTO empregado(idEquipe, nome, especialidade, endereco)
VALUES (1, 'Claudio', 'Soldador', 'Rua 10'),
       (1, 'Fernanda', 'Mecânico', 'Rua 11'),
       (2, 'José', 'Pintor', 'Rua 12'),
       (2, 'Ana', 'Pintor', 'Rua 13');


INSERT INTO ordem_servico(data_emissao, valor, status_, data_conclusao, descricao, idCliente, idVeiculo, idEquipe)
VALUES ('2020-01-01', 1000, 'Em andamento', '2020-01-02', 'Troca de óleo', 1, 1, 1),
       ('2020-01-01', 2000, 'Em andamento', '2020-01-02', 'Troca de pneu', 2, 2, 1),
       ('2020-01-01', 1500, 'Em andamento', '2020-01-03', 'Pintura', 2, 2, 2);


SELECT * FROM ordem_servico
WHERE idCliente = 2
ORDER BY data_conclusao ASC;


SELECT c.nome, SUM(os.valor) AS total
FROM ordem_servico os, cliente c
WHERE os.idCliente = c.idCliente
GROUP BY os.idCliente
HAVING total > 1000;
