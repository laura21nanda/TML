create database bd_exporta;

use bd_exporta;

create table departamento(
	id int primary key auto_increment not null,
    nome varchar (50),
    localizacao varchar (50),
    orcamento decimal (10,2)
);

insert into departamento (nome, localizacao, orcamento) VALUES
('RH', 'São Paulo', 50000.00),
('Financeiro', 'Rio de Janeiro', 75000.00),
('Marketing', 'Belo Horizonte', 60000.00),
('TI', 'Curitiba', 90000.00),
('Vendas', 'Porto Alegre', 50000.00);

SHOW VARIABLES LIKE 'secure_file_priv';

delete from departamento
 where id = 5;
 
Select * from departamento 
INTO outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

#importar arquivo .csv exportado 
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';


-- Início da transição 
Start transaction;

-- Aumentar o orçamento do departampento de TI em 1000
UPDATE departamento SET orcamento = orcamento + 1000.00 Where nome = 'TI';

-- Aumentar o orçamento do departampento de FINANCEIRO em 1000
UPDATE departamento SET orcamento = orcamento + 1000.00 Where nome = 'financeiro';

-- Confirmar a transicao
COMMIT;










