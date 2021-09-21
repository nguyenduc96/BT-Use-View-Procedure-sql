create database demo;

use demo;

create table products
(
    id                 int auto_increment primary key,
    productCode        varchar(10) unique not null,
    productName        varchar(50)        not null,
    productPrice       double,
    productAmount      int,
    productDescription varchar(255),
    productStatus      bool default true
);

create unique index id_productcode
    on products (productCode);

create index composite_index
    on products (productName, productPrice);

explain
select *
from products;

select *
from products;

create view products_view as
select productCode, productName, productPrice, productStatus
from products;

create or replace view products_view as
select productName, productPrice, productStatus
from products;

drop view demo.products_view;

delimiter //

create procedure show_products()
begin

    select * from products;

end //

delimiter ;

call show_products();

delimiter //
create procedure add_product(in code varchar(10), in name varchar(50))
begin
    insert into products (productCode, productName)
    value (code, name);
end //
delimiter ;

call add_product('P01', 'SP 001');

call add_product('P02', 'SP 002');

call add_product('P03', 'SP 003');


call show_products;

delimiter //
create procedure update_product(in idUpdate int, in code varchar(10), in name varchar(50))
begin
    update products p set productCode = code, productName = name where p.id = idUpdate;
end //
delimiter ;

call update_product(1, 'PP01', 'SP0001');

delimiter //
create procedure remove_product(in idRemove int)
begin
    delete from products where id = idRemove;
end //
delimiter ;

call remove_product(1);