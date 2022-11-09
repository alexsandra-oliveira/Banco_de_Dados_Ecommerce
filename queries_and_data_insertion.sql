use ecommerce;
show tables;

insert into clients (Fname, Minit, Lname, CPF, Address) values
	      ('Maria', 'M', 'Silva', 12356789, 'rua silva de prata 29, Carangola - cidade das flores'),
		  ('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, centro - cidade das flores'),
		  ('Ricardo', 'F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - cidade das flores'),
		  ('Júlia', 'S', 'França', 789123456, 'rua lareijras 861, centro - Cidade das flores'),
		  ('Roberta', 'G', 'Assis', 98745631, 'avenida koller 19, centro - Cidade das flores'),
		  ('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

select * from clients;
          
insert into product(Pname, classification_kids, category, avaliacao, size) values
          ('Fone de ouvido', false, 'Eletronicos', '4', null),
          ('Barbie Elsa', true, 'Brinquedos', '3', null),
          ('Body carter', true, 'Vestuários', '5', null),
          ('Microfone - vedo you tube', false, 'Eletronicos', '4', null),
          ('sofá retratril', true, 'Móveis', '3', '3x57x80'),
          ('Farinha de arroz', false, 'Alimentos', '2', null),
          ('Fire stick amazon', false, 'Eletronicos', '3', null);
          
select * from product;

-- delete from orders where idOrderClient in (1, 2, 3, 4);

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(1, default, 'Compra via aplicativo', null, 1),
        (2, default, 'Compra via aplicativo', 50, 0),
        (3, 'confirmado', null, null, 1),
        (4, default, 'Compra via web site', 150, 0);

select * from orders;

insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
		(1, 1, 2, null),
		(2, 1, 1, null),
		(3, 2, 1, null);
        
select * from productOrder;

insert into productStorage(storageLocation, quantity)values
		('Rio de Janeiro', 1000),
		('Rio de Janeiro', 500),
		('Sao Paulo', 10),
		('Sao Paulo', 100),
		('Sao Paulo', 10),
		('Brasilia', 60);

select * from productStorage;
        
insert into storageLocation(idLproduct, idLstorage, location) values
		(1, 2, 'RJ'),
        (2, 6, 'GO');
        
select * from storageLocation;

insert into supplier(SocialName, CNPJ, contact) values
		('Almeida e Filhos', 123456789123456, '21982474'),
        ('Eletronicos Silva', 854519649143457, '21982484'),
        ('Eletronicos Valma', 934567893934695, '21972474');

 select * from supplier;  
 
insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
		(1, 1, 500),
        (1, 2, 400),
        (2, 4, 633),
        (3, 3, 5),
        (2, 5, 10);

select * from productSupplier;
        
insert into seller(socialName, abstName, CNPJ, CPF, location, contact) values
		('Tech Eletronics', null, 123456789456321, null, 'Rio de Janeiro', '219946287'),
        ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', '219567895'),
        ('Kids World', null, 456789123654485, null, 'Sao Paulo', '1198657484');

select * from seller;

insert into productSeller(idPseller, idPproduct, prodQuantity) values
		(1, 6, 80),
        (2, 7, 10);

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(2, default, 'Compra via aplicativo', null, 1);
        
select * from productSeller;
select count(*) from clients;   
    
select * from clients c, orders o 
		where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus 
		from clients c, orders o 
        where c.idClient = idOrderClient;

select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status 
		from clients c, orders o 
        where c.idClient = idOrderClient;
        
select count(*) from clientts c, orders o
		where c.idClient = idOrderClient;

-- recuperaçao de pedido com produto associado.
select * from clients c 
        inner join orders o on c.idClient = o.idOrderClient
		inner join productOrder p on idOorder = o.idOrder
        group by idClient;

-- Recuperar quantos pedidos forem realizados pelos clientes.
select c.idClient, Fname, count(*) as Number_of_order from clients c 
        inner join orders o on c.idClient = o.idOrderClient
        group by idClient;
        
select c.idClient, Fname, count(*) as Number_of_order from clients c 
        inner join orders o on c.idClient = o.idOrderClient
		inner join productOrder p on p.idPOorder = o.idOrder
        group by idClient;
                

