CREATE TABLE employee (
	eid int(5) auto_increment primary key,
  	ename varchar(30) NOT NULL,
  	gender varchar(20) not null,
  	email varchar(50) not null,
  	phno varchar(10) NOT NULL,
  	salary int(5) NOT NULL,
  	designation varchar(10) NOT NULL,
  	address varchar(50) NOT NULL,
  	passwd varchar(20) not null default 'test'
);

INSERT INTO employee (ename, gender, email, phno, salary, designation, address) VALUES
('Rahul Kumar', 'Male', 'rk2003@gmail.com', '9441733399', 30000, 'Staff', 'Akurdi Pune 35'),
('Govind Madhav', 'Male', 'govind2020@gmail.com', '9441733995', 30000, 'Staff', 'Bhosari Pune 19'),
('Gopal Joshi', 'Male', 'joshil1997@gmail.com', '9441733996', 30000, 'Staff', 'Akurdi Pune 35'),
('Ramya Shetty', 'Female', 'shettyr2005@gmail.com', '9441733998', 30000, 'Staff', 'Chinchwad Pune 33'),
('Rashi Saxsena', 'Female', 'shettyr2005@gmail.com', '9441733999', 30000, 'Staff', 'Akurdi Pune 35'),
('Priya Patil', 'Female', 'shettyr2005@gmail.com', '9441733910', 30000, 'Staff', 'Akurdi Pune 35'),
('Sudheeer Gokhale', 'Male', 'shettyr2005@gmail.com', '9441733912', 30000, 'Staff', 'Akurdi Pune 35'),
('Girish Bapat', 'Male', 'girish.bapat@gmail.com', '9441733913', 30000, 'Staff', 'Akurdi Pune 35'),
('Rehman Ali', 'Male', 'rehmanbhai@gmail.com', '9441733914', 30000, 'Staff', 'Akurdi Pune 35'),
('Ravi Chaudhary', 'Male','rc2023@gmail.com', '9908407185', 20000, 'Staff', 'Akurdi Pune 35'),
('Mani Verma', 'Female','iamthebest@gmail.com', '8688764855', 50000, 'Manager', 'Chinchwad'),
('Rahi More', 'Female','rahi2005@gmail.com', '9908407285', 50000, 'Manager', 'Pimpri'),
('Nani Kale', 'Female','naninani@gmail.com', '9666613357', 50000, 'Manager', 'Akurdi Pune 35');

create table farmer(
	f_id int auto_increment primary key, 
	f_name varchar(100) not null, 
	f_gender varchar(10) not null, 
	f_address varchar(255) not null, 
	f_phone varchar(10) not null,
	f_email varchar(50) not null,
	f_pwd varchar(50) not null default 'test',
	f_regdate date default current_timestamp()
);

insert into farmer(f_name, f_gender, f_address, f_phone, f_email) values
('Ram Singh', 'Male', 'Chinchwad Pune 33', '8967896789', 'ramsingh2020@gmail.com'),
('Kashibai Patel', 'Female', 'Pimpri Pune 17', '7967196789', 'kashi1111@gmail.com'),
('Krishna Yadav', 'Male', 'Bhosari Pune 19', '6967196789', 'ky1122@gmail.com');


create table customer(
	c_id int auto_increment primary key, 
	c_name varchar(100) not null, 
	c_address varchar(255) not null, 
	c_phone varchar(10) not null, 
	c_email varchar(50) not null,
	c_pwd varchar(50) not null default 'test',
	c_regdate date default current_timestamp()
);

insert into customer(c_name, c_address, c_phone, c_email) values
('Jairam More', 'Shubhshree Akurdi', '9823374979', 'morejairam@gmail.com'),
('Ameya Desai', 'Aishwaryam Akurdi', '7823374977', 'desai23@gmail.com');


create table collection(
	trn_no int auto_increment primary key, 
	milk_type varchar(20) not null, 
	qty integer not null, 
	collection_date date, 
	collection_time varchar(20), 
	f_id integer references farmer(f_id) on delete cascade
);

create table farmer_payment(
	payment_id int auto_increment primary key, 
	payment_date date, 
	amount float, 
	f_id integer references farmer(f_id) on delete cascade
);


create table stock(cow_qty integer, 
		buffalo_qty integer);
		
insert into stock values(0, 0);


create table customer_bill(
	bill_no int auto_increment primary key, 
	bill_date date, 
	bill_amt float, 
	cow_qty integer, 
	buffalo_qty integer, 
	cust_id integer references customer(cust_id),
	pay_mode varchar(20),
	card_no varchar(20),
	card_holder varchar(50),
	status varchar(50) default 'Pending'
);

create table loan_application(
	application_no int auto_increment primary key,
	application_date date,
	f_id int references farmer(f_id),
	loan_amt float,
	loan_reason varchar(50),
	status varchar(70)
);
