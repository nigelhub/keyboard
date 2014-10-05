-- You can use this file to load seed data into the database using SQL statements
-- insert into Member (id, name, email, phone_number) values (0, 'John Smith', 'john.smith@mailinator.com', '2125551212')

insert into event_type values('', 'build');
insert into topic_name values('', 'rockies');
insert into queue_type values('', 'myclient-nightly');

insert into topic values('', 1, '<top><opt1></opt1><opt2></opt2></top>')