create database db_Cds;
use db_Cds;

drop database db_Cds;

create table tbArtistas (
	idArtista int auto_increment not null,
    NomeArtista varchar(100) not null,
    constraint pkArtista primary key (idArtista)
);

select * from tbArtistas;

insert into tbArtistas values(null, 'Eleanor Marques');
insert into tbArtistas values(null, 'Matheus Júnior');
insert into tbArtistas values(null, 'Thayna Boy');
insert into tbArtistas values(null, 'Bruno Cavalcanti');
insert into tbArtistas values(null, 'Beatriz Custódio');


create table tbGravadora (
	idGravadora int auto_increment not null,
    NomeGravadora varchar(50) not null,
    constraint pkGravadora primary key (idGravadora)
);

select * from tbGravadora;

insert into tbGravadora values(null, 'Parlophone');
insert into tbGravadora values(null, 'Godbluff');
insert into tbGravadora values(null, 'Duke');
insert into tbGravadora values(null, 'Century');
insert into tbGravadora values(null, 'Tribe');


create table tbCategoria (
	idCategoria int auto_increment not null,
    NomeCategoria varchar(50) not null,
    constraint pkCategoria primary key (idCategoria)
);

select * from tbCategoria;

insert into tbCategoria values(null, 'Rock' );
insert into tbCategoria values(null, 'Pop' );
insert into tbCategoria values(null, 'Música Erudita' );
insert into tbCategoria values(null, 'Jazz' );
insert into tbCategoria values(null, 'Blues' );


create table tbEstado (
	idSiglaEstado char(2) not null,
    NomeEstado varchar(50) not null,
    constraint pkEstado primary key (idSiglaEstado)
);

select * from tbEstado;

insert into tbEstado values('sp', 'São Paulo');
insert into tbEstado values('rj', 'Rio de Janeiro');
insert into tbEstado values('to', 'Tocantins');
insert into tbEstado values('ba', 'Bahia');
insert into tbEstado values('sc', 'Santa Catarina');


create table tbCidade (
	idCidade int auto_increment not null,
    idSiglaEstado char(2) not null,
    NomeCidade varchar(100) not null,
    constraint pkCidade primary key (idCidade),
    constraint fkCidadeEstado foreign key (idSiglaEstado)
		references tbEstado (idSiglaEstado)
);

select * from tbCidade;

insert into tbCidade values(null, 'sp', 'Mauá');
insert into tbCidade values(null, 'rj',  'Rio de Janeiro');
insert into tbCidade values(null, 'to', 'São José do Rio Preto');
insert into tbCidade values(null, 'ba', 'Salvador');
insert into tbCidade values(null, 'sc', 'Joinville');


create table tbCliente (
	idCliente int auto_increment not null,
    idCidade int not null,
    NomeCliente varchar(100) not null,
    EnderecoCliente varchar(200) not null,
    RendaCliente decimal(10, 2) not null default 0.00,
    SexoCliente enum('f', 'm') not null default 'f',
    constraint pkCliente primary key (idCliente),
    constraint fkClienteCidade foreign key (idCidade)
		references tbCidade (idCidade)
);

select * from tbCliente;

insert into tbCliente values(null, 1, 'João do Carmo', 'Rua Firmino Conceição', 1200.00, 'm');
insert into tbCliente values(null, 2, 'Karen Smith', 'Avenida Castello Branco', 2200.00, default);
insert into tbCliente values(null, 3, 'Lavinia Morgana', 'Avenida Mateo Bei', 1900.00, default);
insert into tbCliente values(null, 4, 'Julia de Oliveira', 'Avenida Guilherme Polidoro', 2100.00, default);
insert into tbCliente values(null, 5, 'Vinicius Cordeiro', 'Rua Oceana', 1890.00, 'm');


create table tbConjuge (
	idConjuge int auto_increment not null,
    idCliente int not null,
    NomeConjuge varchar(100) not null,
    RendaConjuge decimal(10, 2) not null default 0.00,
    SexoConjuge enum('f', 'm') not null default 'm',
    constraint pkConjuge primary key (idConjuge),
    constraint fkConjugeCliente foreign key (idCliente)
		references tbCliente (idCliente)
);

select * from tbConjuge;

insert into tbConjuge values(null, 1, 'Layla do Carmo', 1650.00, 'f');
insert into tbConjuge values(null, 2, 'Leonardo dos Santos', 1950.00, default);
insert into tbConjuge values(null, 3, 'Matheus Silva', 2150.00, default);
insert into tbConjuge values(null, 4, 'Matheus Júnior', 2150.00, default);
insert into tbConjuge values(null, 5, 'Luana dos Anjos', 2550.00, 'f');


create table tbFuncionario (
	idFuncionario int auto_increment not null,
    NomeFuncionario varchar(100) not null,
    EnderecoFuncionario varchar(200) not null,
    SalarioFuncionario decimal(10, 2) not null default 0.00,
    SexoFuncionario enum('f', 'm') not null default 'm',
    constraint pkFuncionario primary key (idFuncionario)
);

select * from tbFuncionario;

insert into tbFuncionario values(null, 'Felipe', 'Rua do Carmo', 1580.00, default);
insert into tbFuncionario values(null, 'Joana', 'Rua Conceição', 1880.00, 'f');
insert into tbFuncionario values(null, 'Laura Silva', 'Avenida Paulista', 2280.00, 'f');
insert into tbFuncionario values(null, 'João', 'Viela das Saudades', 1380.00, default);
insert into tbFuncionario values(null, 'Paula dos Santos', 'Travessa Cordeiro', 1780.00, 'f');


create table tbDependente (
	idDependente int auto_increment not null,
    idFuncionario int not null,
    NomeDependente varchar(100) not null,
    SexoDependente enum('f', 'm') not null default 'm',
    constraint pkDependente primary key (idDependente),
    constraint fkDependenteFuncionario foreign key (idFuncionario)
		references tbFuncionario (idFuncionario)
);

select * from tbDependente;

insert into tbDependente values(null, 1, 'Luan', default);
insert into tbDependente values(null, 2, 'Nayara', 'f');
insert into tbDependente values(null, 3, 'Kemilly', 'f');
insert into tbDependente values(null, 4, 'Vinicius', default);
insert into tbDependente values(null, 5, 'Yasmim', 'f');


create table tbTitulo (
	idTitulo int auto_increment not null,
    idCategoria int not null,
    idGravadora int not null,
    NomeCD varchar(100) not null,
    ValorCD decimal(10, 2) not null default 1.00,
    QuantidadeEstoque int not null default 0,
    constraint pkTitulo primary key (idTitulo),
    constraint fkTituloCategoria foreign key (idCategoria)
		references tbCategoria (idCategoria),
	constraint fkTituloGravadora foreign key (idGravadora)
		references tbGravadora (idGravadora)
);

select * from tbTitulo;

insert into tbTitulo values(null, 1, 1, 'Selling England by the Pound', 275.50, 635);
insert into tbTitulo values(null, 2, 2, 'Kim Wilde', 150.50, 311);
insert into tbTitulo values(null, 3, 3, 'Close to the Edge', 480.50, 88);
insert into tbTitulo values(null, 4, 4, 'Like a Virgin', 95.50, 258);
insert into tbTitulo values(null, 5, 5, 'The Kick Inside', 318.50, 128);


create table tbPedido (
	idNumeroPedido int auto_increment not null,
    idCliente int not null,
    DataPedido datetime not null,
    ValorPedido decimal(10, 2) not null default 0.00,
    constraint pkPedido primary key (idNumeroPedido),
    constraint fkPedidoCliente foreign key (idCliente)
		references tbCliente (idCliente)
);

select * from tbPedido;

insert into tbPedido values(null, 1, '2003-06-03', 275.50);
insert into tbPedido values(null, 2, '2018-08-01', 150.50);
insert into tbPedido values(null, 3, '2002-06-10', 480.50);
insert into tbPedido values(null, 4, current_date(), 95.50);
insert into tbPedido values(null, 5, '2003-05-07', 318.50);


create table tbPedido_Titulo (
	idNumeroPedido int not null,
    idTitulo int not null,
    QuantidadeCds int not null default 1,
    ValorCds decimal(10, 2) not null default 1.00,
    constraint pkPedido_Titulo primary key (idNumeroPedido, idTitulo),
    constraint fkPedido_Titulo_Titulo foreign key (idTitulo)
		references tbTitulo (idTitulo),
	constraint fkPedido_Titulo_Pedido foreign key (idNumeroPedido)
		references tbPedido (idNumeroPedido)
);

select * from tbPedido_Titulo;

insert into tbPedido_Titulo values(1, 1, 30, 55.00);
insert into tbPedido_Titulo values(2, 2, 11, 35.00);
insert into tbPedido_Titulo values(3, 3, 4, 79.00);
insert into tbPedido_Titulo values(4, 4, 7, 26.00);
insert into tbPedido_Titulo values(5, 5, 19, 75.00);


create table tbTitulo_Artista (
	idTitulo int not null,
    idArtista int not null,
    constraint pkTitulo_Artista primary key (idTitulo, idArtista),
    constraint fkTitulo_Artista_Titulo foreign key (idTitulo)
		references tbTitulo (idTitulo),
	constraint fkTitulo_Artista_Artista foreign key (idArtista)
		references tbArtistas (idArtista)
);

select * from tbTitulo_Artista;

insert into tbTitulo_Artista values(1, 1);
insert into tbTitulo_Artista values(2, 2);
insert into tbTitulo_Artista values(3, 3);
insert into tbTitulo_Artista values(4, 4);
insert into tbTitulo_Artista values(5, 5);


/*Exercícios de Joins*/

/*Exercício 01 - Joins*/

select tbCategoria.idCategoria, tbTitulo.idTitulo 
from tbCategoria
inner join tbTitulo on tbCategoria.idCategoria = tbTitulo.idCategoria;

select c.idCategoria as Categoria, t.idTitulo as Titulo
from tbCategoria as c
join tbTitulo as t on c.idCategoria = t.idCategoria;

select c.idCategoria as Categoria, t.idTitulo as Titulo
from tbCategoria as c, tbTitulo as t
where c.idCategoria = t.idCategoria;

/*Exercício 02 - Joins*/

select p.idNumeroPedido as Pedido, c.NomeCliente as Cliente
from tbPedido as p
join tbCliente as c on p.idNumeroPedido = c.idCliente;

/*Exercício 03 - Joins*/

select f.NomeFuncionario as Funcionario, d.NomeDependente as Dependente
from tbFuncionario as f
join tbDependente as d on f.idFuncionario = d.idDependente;

/*Exercício 04 - Joins*/

select f.NomeFuncionario as Funcionario, p.ValorPedido as Valor_Pedido, t.idTitulo as Titulo
from ((tbFuncionario as f
join tbPedido as p on f.idFuncionario = p.idNumeroPedido)
join tbTitulo as t on f.idFuncionario = t.idTitulo);

/*Exercício 05 - Joins*/

select c.NomeCliente as Cliente, c2.NomeCidade as Cidade
from tbCliente as c
join tbCidade as c2 on c.idCliente = c2.idCidade and c.SexoCliente = 'f';

/*Exercício 06 - Joins*/

select c.NomeCD as CD, g.NomeGravadora as Gravadora
from tbTitulo as c
join tbGravadora as g on c.idTitulo = g.idGravadora and g.NomeGravadora like 't%' or g.NomeGravadora like 'r%';

/*Exercício 07 - Joins*/

select g.NomeGravadora as Gravadora, c.NomeCD as CD, c.ValorCD as Valor_CD, c.QuantidadeEstoque as Estoque
from tbGravadora as g
join tbTitulo as c on g.idGravadora = c.idTitulo and c.QuantidadeEstoque <= 500;

/*Exercício 08 - Joins*/

select c.NomeCliente as Cliente, p.ValorPedido as Valor_Pedido
from tbCliente as c
join tbPedido as p on c.idCliente = p.idNumeroPedido and c.SexoCliente = 'f' and p.DataPedido >= '2002-06-01' and p.DataPedido <= '2002-06-30' ;

/*Exercício 09 - Joins*/

select p.idNumeroPedido as Pedido, p.ValorPedido as Valor_Pedido, p.DataPedido as Data_Pedido, f.NomeFuncionario as Funcionario
from tbPedido as p
join tbFuncionario as f on p.idNumeroPedido = f.idFuncionario and p.DataPedido >= '2003-01-01' and p.DataPedido <= '2003-12-31' and f.NomeFuncionario like 'Paula%';

/*Exercício 10 - Joins*/

select p.idNumeroPedido as Pedido, c.NomeCliente as Cliente, max(p.ValorPedido) as Valor_Pedido
from tbPedido as p
join tbCliente as c on p.idNumeroPedido = c.idCliente;

/*Joins com várias tabelas*/

/*Exercício 11 - Joins*/

select distinct a.NomeArtista as Artista, c.NomeCategoria as Categoria
from tbArtistas as a
join tbCategoria as c on a.idArtista = c.idCategoria;

/*Exercício 12 - Joins*/

select c.idCliente as Cliente_ID, f.idFuncionario as Funcionario_ID
from tbCliente as c
join tbFuncionario as f on c.idCliente = f.idFuncionario;

select c.NomeCliente, f.NomeFuncionario
from tbCliente as c
join tbFuncionario as f on c.idCliente = f.idFuncionario;

/*Exercício 13 - Joins*/

select c.NomeCliente as Cliente, c2.NomeCD as CD
from tbCliente as c
join tbTitulo as c2 on idCliente = idTitulo;

/*Extra*/

/*Exercício 14 - Joins*/

select c.NomeCD as CD, g.NomeGravadora as Gravadora, c2.NomeCategoria as Categoria
from ((tbTitulo as c
join tbGravadora as g on c.idTitulo = g.idGravadora)
join tbCategoria as c2 on c.idTitulo = c2.idCategoria);

/*Exercício 15 - Joins*/

select f.NomeFuncionario as Funcionario, d.NomeDependente as Dependente, c.NomeCliente as Cliente, co.NomeConjuge as Conjuge
from (((tbFuncionario as f
join tbDependente as d on f.idFuncionario = d.idDependente)
join tbCliente as c on f.idFuncionario = c.idCliente)
join tbConjuge as co on f.idFuncionario = co.idConjuge);

/*Exercício 16 - Joins*/

select c.NomeCliente as Cliente, f.NomeFuncionario as Funcionario, cd.NomeCD as CD, ca.NomeCategoria as Categoria, g.NomeGravadora as Gravadora
from ((((tbCliente as c
join tbFuncionario as f on c.idCliente = f.idFuncionario)
join tbTitulo as cd on c.idCliente = cd.idTitulo)
join tbCategoria as ca on c.idCliente = ca.idCategoria)
join tbGravadora as g on c.idCliente = g.idGravadora);