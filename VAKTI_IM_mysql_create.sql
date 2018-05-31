CREATE TABLE `ADRESA` (
	`adrese_id` INT NOT NULL AUTO_INCREMENT,
	`rruga` TEXT NOT NULL AUTO_INCREMENT,
	`pershkrimi` TEXT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`adrese_id`)
);

CREATE TABLE `POROSI` (
	`porosi_id` INT NOT NULL AUTO_INCREMENT,
	`adresa_id` INT NOT NULL AUTO_INCREMENT,
	`datetime Porosi` DATETIME NOT NULL AUTO_INCREMENT,
	`aprovuar` BOOLEAN NOT NULL AUTO_INCREMENT,
	`pezulluar` BOOLEAN NOT NULL AUTO_INCREMENT,
	`Aprovim` DATETIME NOT NULL,
	` Pezullim` DATETIME NOT NULL,
	`klient_id` INT NOT NULL,
	`pergjegjes_A_id` INT NOT NULL,
	PRIMARY KEY (`porosi_id`)
);

CREATE TABLE `PERDORUES` (
	`perdorues_id` INT NOT NULL AUTO_INCREMENT,
	`emri` VARCHAR(255) NOT NULL,
	`mbiemri` VARCHAR(255) NOT NULL,
	`telefon` INT NOT NULL,
	`password` varchar NOT NULL,
	`aktiv` BOOLEAN NOT NULL,
	`username` varchar NOT NULL UNIQUE,
	` krijimPerdoruesi` DATETIME NOT NULL,
	`modifikimPerdoruesi` DATETIME NOT NULL,
	`rol_id` INT NOT NULL,
	PRIMARY KEY (`perdorues_id`)
);

CREATE TABLE `ROLI` (
	`rol_id` INT NOT NULL AUTO_INCREMENT,
	`emer` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`rol_id`)
);

CREATE TABLE `POROSI_ITEM` (
	`porosi_id` INT NOT NULL AUTO_INCREMENT,
	`sasia` INT NOT NULL,
	`gatim_id` INT NOT NULL
);

CREATE TABLE `GATIM` (
	`gatim_id` INT NOT NULL AUTO_INCREMENT,
	`emri` VARCHAR(255) NOT NULL,
	`pershkrimi` TEXT NOT NULL,
	`cmimi` FLOAT NOT NULL,
	`disponueshmeria` BOOLEAN NOT NULL,
	`foto` varchar NOT NULL,
	`krijim` DATETIME NOT NULL,
	`modifikim` DATETIME NOT NULL,
	`createdBy` INT NOT NULL,
	`modifiedBy` INT NOT NULL,
	`kategori_id` INT NOT NULL,
	PRIMARY KEY (`gatim_id`)
);

CREATE TABLE `KATEGORI` (
	`kategori_id` INT NOT NULL AUTO_INCREMENT,
	`emri` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`kategori_id`)
);

ALTER TABLE `POROSI` ADD CONSTRAINT `POROSI_fk0` FOREIGN KEY (`adresa_id`) REFERENCES `ADRESA`(`adrese_id`);

ALTER TABLE `POROSI` ADD CONSTRAINT `POROSI_fk1` FOREIGN KEY (`klient_id`) REFERENCES `PERDORUES`(`perdorues_id`);

ALTER TABLE `POROSI` ADD CONSTRAINT `POROSI_fk2` FOREIGN KEY (`pergjegjes_A_id`) REFERENCES `PERDORUES`(`perdorues_id`);

ALTER TABLE `PERDORUES` ADD CONSTRAINT `PERDORUES_fk0` FOREIGN KEY (`rol_id`) REFERENCES `ROLI`(`rol_id`);

ALTER TABLE `POROSI_ITEM` ADD CONSTRAINT `POROSI_ITEM_fk0` FOREIGN KEY (`porosi_id`) REFERENCES `POROSI`(`porosi_id`);

ALTER TABLE `POROSI_ITEM` ADD CONSTRAINT `POROSI_ITEM_fk1` FOREIGN KEY (`gatim_id`) REFERENCES `GATIM`(`gatim_id`);

ALTER TABLE `GATIM` ADD CONSTRAINT `GATIM_fk0` FOREIGN KEY (`createdBy`) REFERENCES `PERDORUES`(`perdorues_id`);

ALTER TABLE `GATIM` ADD CONSTRAINT `GATIM_fk1` FOREIGN KEY (`modifiedBy`) REFERENCES `PERDORUES`(`perdorues_id`);

ALTER TABLE `GATIM` ADD CONSTRAINT `GATIM_fk2` FOREIGN KEY (`kategori_id`) REFERENCES `KATEGORI`(`kategori_id`);

