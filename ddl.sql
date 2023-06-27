gender varchar(20),
address varchar(30),
primary key(author_id) 
);

create table publisher(
publisher_id number(20),
publisher_name varchar(20),
address varchar(30),
primary key(publisher_id) 
);


Create table books(
	book_id number(20),
	book_name varchar(20),
	price number(20),
	page_number number(20),
	stock number(20),
	author_id number(20),
	publisher_id number(20),
	foreign key (author_id) references author(author_id), 
	foreign key (publisher_id) references publisher(publisher_id),
	primary key(book_id)
);



create table customer(
customer_id number(20),
customer_name varchar(20),
address varchar(30),
phone_number number(20),
primary key(customer_id) 
);


create table orders(
	order_id number(20),
	book_id number(20),
	customer_id number(20),
	primary key(order_id),
	foreign key (book_id) references books(book_id), 
	foreign key (customer_id) references customer(customer_id)
);

