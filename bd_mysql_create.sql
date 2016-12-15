create database ' C:\Users\Vladik\Documents\Database\MyHotel.fdb' user 'SYSDBA' password 'masterkey';
connect 'C:\Users\Vladik\Documents\Database\MyHotel.fdb' user 'SYSDBA' password 'masterkey';


create table Zakaz(
	 id int primary key,
	 Tour_id int not null,
	 Client_id int not null,
	 Cost int not null,
	 additionalServ_id int	
);

create table Client(
	 id int primary key,
	 Name  varchar(40) not null,
	 Phone_number int not null,
	 Email varchar(30),
	 Country_id int not null	 
);

create table Country(
	 id int primary key,
	 Name varchar(30) not null,
	 Allow char(1) not null	 
);

create table Tour(
	 id int primary key,
	 Tourfirm_id int not null,
	 Persons  int not null,
	 Breakfast char(1) not null,
	 Arrival_date date not null,
	 Out_date date not null,
	 TypeTour_id int not null
	 
);

create table Tourfirm(
	 id int primary key,
	 Comission int not null,
	 Name  varchar(30) not null	 
);

create table Hotel(
	 id int primary key,
	 Zakaz_id int not null,
	 Room_id int not null	 
);

create table Room(
	 id int primary key,
	 Room_number int not null,
	 Beds  int not null,
	 Busy_status char(1) not null,
	 Repair_status char(1) not null	 
);

create table TypeTour(
	 id int primary key,
	 Name  varchar(30)
	 
);

create table additionalServ(
	 id int primary key,
	 Name  varchar(30) not null
	 
);

alter table  Zakaz  add constraint  Zakaz_to_tour  foreign key (Tour_id) references  Tour(id);

alter table  Zakaz  add constraint  Zakaz_to_client  foreign key (Client_id) references  Client(id);

alter table  Zakaz  add constraint  Zakaz_to_serv  foreign key (additionalServ_id) references  additionalServ(id);

alter table  Client  add constraint  Client_to_country  foreign key (Country_id) references  Country(id);

alter table  Tour  add constraint  Tour_to_firm  foreign key (Tourfirm_id) references  Tourfirm(id);

alter table  Tour  add constraint  Tour_to_type  foreign key (TypeTour_id) references  TypeTour(id);

alter table  Hotel  add constraint  Hotel_to_zakaz  foreign key (Zakaz_id) references  Zakaz(id);

alter table  Hotel  add constraint  Hotel_to_room  foreign key (Room_id) references  Room(id);

