CREATE DATABASE `CAR_WASH`;
USE `CAR_WASH`;

DROP TABLE IF EXISTS `ROLE`;
CREATE TABLE `ROLE`
(
    `ID`         varchar(45)                NOT NULL,
    `NAME`       varchar(45)                NOT NULL,
    
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


DROP TABLE IF EXISTS `VEHICLE_TYPE`;
CREATE TABLE `VEHICLE_TYPE`
(
    `ID`         varchar(45)                NOT NULL,
    `TYPE`       varchar(45)                NOT NULL,
    
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;



DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER`
(
    `ID`         varchar(45)                NOT NULL,
    `firstname` varchar(45)                NOT NULL,
    `lastname`  varchar(45)                NOT NULL,
    `EMAIL`      varchar(50)                NOT NULL,
    `PASSWORD`   varchar(100)               NOT NULL,
    `ADDRESS`    varchar(100)               NOT NULL,
    `PHONE`      varchar(100)               NOT NULL,
    `CITY`       varchar(100)               NOT NULL,
    `roleid`    varchar(45)                NOT NULL,
    UNIQUE (`EMAIL`),
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`ROLEID`) REFERENCES `ROLE`(`ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

DROP TABLE IF EXISTS `PACKAGE`;
CREATE TABLE `PACKAGE`
(
    `ID`                varchar(45)         NOT NULL,
    `USERID`            varchar(45)         NOT NULL,
    `DESCRIPTION`       varchar(45)         NOT NULL,
    `TYPE`              varchar(45)         NOT NULL,
    `PRICE`             decimal             NOT NULL,
    
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`USERID`) REFERENCES `USER`(`ID`)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`TYPE`) REFERENCES `VEHICLE_TYPE`(`ID`)
    ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;