INSERT INTO `ROLE` (`ID`, `NAME`) VALUES ('d925e542-acf5-46b0-af2a-8ce7ef300e15', 'ADMIN');
INSERT INTO `ROLE` (`ID`, `NAME`) VALUES (UUID(), 'CUSTOMER');
INSERT INTO `ROLE` (`ID`, `NAME`) VALUES (UUID(), 'DETAILER');


INSERT INTO `VEHICLE_TYPE` (`ID`, `TYPE`) VALUES (UUID(), 'SUV');
INSERT INTO `VEHICLE_TYPE` (`ID`, `TYPE`) VALUES (UUID(), 'SEDAN');
INSERT INTO `VEHICLE_TYPE` (`ID`, `TYPE`) VALUES (UUID(), 'HATCHBACK');
INSERT INTO `VEHICLE_TYPE` (`ID`, `TYPE`) VALUES (UUID(), 'LONG_VEHICLE');

INSERT INTO `USER` (`ID`,`ADDRESS`,`CITY`,`EMAIL`,`FIRSTNAME`,`LASTNAME`,`PASSWORD`,`PHONE`,`STATE`,`ROLE_ID`)
VALUES (UUID(), 'Panadura','Horana','executive.washinglove@gmail.com','admin','','b4WE4bXVBj0=','07712344321',1,'d925e542-acf5-46b0-af2a-8ce7ef300e15');
