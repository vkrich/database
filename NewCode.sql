create database 'tiger.ftk.spbstu.ru:/var/lib/firebird/435011/avtograf.fdb' user 'SYSDBA' password 'masterkey';
connect 'tiger.ftk.spbstu.ru:/var/lib/firebird/435011/avtograf.fdb' user 'SYSDBA' password 'masterkey';
commit;

CREATE TABLE Order (
	ID INT NOT NULL PRIMARY KEY,
	Tour_id INT NOT NULL AUTO_INCREMENT,
	Client_id INT NOT NULL AUTO_INCREMENT,
	Cost INT NOT NULL,
	AdditionalServ_id INT NOT NULL AUTO_INCREMENT,	 
);

CREATE TABLE Client (
	ID INT NOT NULL PRIMARY KEY,
	Name varchar(40) NOT NULL AUTO_INCREMENT,
	Phone_number INT NOT NULL,
	Email varchar(30),
	Country_ID INT NOT NULL AUTO_INCREMENT,	 
);

CREATE TABLE Country (
	ID INT NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL AUTO_INCREMENT,
	Allow BINARY NOT NULL AUTO_INCREMENT,	
);

CREATE TABLE Tour (
	ID INT NOT NULL PRIMARY KEY,
	Tourfirm_id INT NOT NULL AUTO_INCREMENT,
	Persons INT NOT NULL AUTO_INCREMENT,
	Breakfast BINARY NOT NULL AUTO_INCREMENT,
	Arrival_date INT NOT NULL AUTO_INCREMENT,
	Out_date INT NOT NULL AUTO_INCREMENT,
	TypeTour_id INT NOT NULL,	
);

CREATE TABLE Tourfirm (
	ID INT NOT NULL PRIMARY KEY,
	Comission INT NOT NULL AUTO_INCREMENT,
	Name varchar(30) NOT NULL AUTO_INCREMENT,	 
);

CREATE TABLE Hotel (
	ID INT NOT NULL PRIMARY KEY,
	Order_id INT NOT NULL AUTO_INCREMENT,
	Room_id INT NOT NULL AUTO_INCREMENT,	 
);

CREATE TABLE Room (
	ID INT NOT NULL PRIMARY KEY ,
	Room_number INT NOT NULL AUTO_INCREMENT,
	Beds INT NOT NULL AUTO_INCREMENT,
	Busy_status BINARY NOT NULL AUTO_INCREMENT,
	Repair_status BINARY NOT NULL,
);

CREATE TABLE TypeTour (
	ID INT NOT NULL PRIMARY KEY,
	Name varchar(30),	 
);

CREATE TABLE AdditionalServ (
	ID INT NOT NULL PRIMARY KEY,
	Name varchar(30) NOT NULL,	 
);

ALTER TABLE Order  ADD CONSTRAINT  Order_fk0  FOREIGN KEY ( Tour_id ) REFERENCES  Tour ( ID );

ALTER TABLE Order  ADD CONSTRAINT  Order_fk1  FOREIGN KEY ( Client_id ) REFERENCES  Client ( ID );

ALTER TABLE Order  ADD CONSTRAINT  Order_fk2  FOREIGN KEY ( AdditionalServ_id ) REFERENCES  AdditionalServ ( ID );

ALTER TABLE Client  ADD CONSTRAINT  Client_fk0  FOREIGN KEY ( Country_ID ) REFERENCES  Country ( ID );

ALTER TABLE Tour  ADD CONSTRAINT  Tour_fk0  FOREIGN KEY ( Tourfirm_id ) REFERENCES  Tourfirm ( ID );

ALTER TABLE Tour  ADD CONSTRAINT  Tour_fk1  FOREIGN KEY ( TypeTour_id ) REFERENCES  TypeTour ( ID );

ALTER TABLE Hotel  ADD CONSTRAINT  Hotel_fk0  FOREIGN KEY ( Order_id ) REFERENCES  Order ( ID );

ALTER TABLE Hotel  ADD CONSTRAINT  Hotel_fk1  FOREIGN KEY ( Room_id ) REFERENCES  Room ( ID );

