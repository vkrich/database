connect 'C:\Users\Vladik\Documents\Database\MyHotel.fdb' user 'SYSDBA' password 'masterkey';

insert into AdditionalServ (id, Name) values (1, 'Ice cream');
insert into AdditionalServ (id, Name) values (2, 'Digit TV in Room');
insert into AdditionalServ (id, Name) values (3, 'Umbrella in Room');
insert into AdditionalServ (id, Name) values (4, 'Standart');

insert into Country (id, Name,Allow)  values (1, 'Russia','T');
insert into Country (id, Name,Allow)  values (2, 'Ukraine','T');
insert into Country (id, Name,Allow)  values (3, 'Belorussia','T');

insert into Tourfirm (id, Comission,Name) values (1, 700, 'Neva');
insert into Tourfirm (id, Comission,Name) values (2, 1000, 'Marlis');
insert into Tourfirm (id, Comission,Name) values (3, 800, 'Booking.com');

insert into TypeTour (id, Name) values (1, 'Sport');
insert into TypeTour (id, Name) values (2, 'Museums');
insert into TypeTour (id, Name) values (3, 'Business');

insert into Room (id,Room_number,Beds,Busy_status,Repair_status)
	 values (1, 1, 2, 'F','F');
insert into Room (id,Room_number,Beds,Busy_status,Repair_status)
	 values (2, 2, 3, 'F','F');
insert into Room (id,Room_number,Beds,Busy_status,Repair_status)
	 values (3, 3, 2, 'F','F');

insert into Client (id,Name,Phone_number,Email,Country_ID )
	 values (1, 'Ericson A.S.',55675777,'eric@mail.ru',2);
insert into Client (id,Name,Phone_number,Email,Country_ID )
	 values (2, 'Molotov A.A.',44545345,'qdw@mail.ru',2);
insert into Client (id,Name,Phone_number,Email,Country_ID )
	 values (3, 'Krusov A.T.',44543355,'qrer@mail.ru',1);

insert into Tour (id, Tourfirm_id, Persons, Breakfast, Arrival_date, Out_date, TypeTour_id) 
	values (1, 1, 1, 'T','21.11.16','25.11.16',2);
insert into Tour (id, Tourfirm_id, Persons, Breakfast, Arrival_date, Out_date, TypeTour_id) 
	values (2, 1, 2, 'T','18.11.16','26.11.16',1);
insert into Tour (id, Tourfirm_id, Persons, Breakfast, Arrival_date, Out_date, TypeTour_id) 
	values (3, 3, 1, 'T','10.11.16','25.11.16',2);

insert into Zakaz (id,Tour_id,Client_id,Cost,AdditionalServ_id )
	 values (1, 1, 1, 3000,4);

insert into Zakaz (id,Tour_id,Client_id,Cost,AdditionalServ_id )
	 values (2, 2, 2, 4500,1);

insert into Zakaz (id,Tour_id,Client_id,Cost,AdditionalServ_id )
	 values (3, 3, 3, 6000,4);

insert into Hotel (id, Zakaz_id, Room_id) values (1, 1, 1);
insert into Hotel (id, Zakaz_id, Room_id) values (2, 2, 2);
insert into Hotel (id, Zakaz_id, Room_id) values (3, 3, 3);


commit;