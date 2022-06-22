CREATE TABLE `file` (
	`plan_num` INT(11) NOT NULL,
	`ordinal` INT(11) NOT NULL,
	`process` INT(11) NOT NULL DEFAULT '0',
	`saved_name` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`file_name` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`file_format` VARCHAR(10) NOT NULL COLLATE 'utf8mb3_general_ci',
	`input_date` DATE NOT NULL,
	PRIMARY KEY (`plan_num`, `ordinal`) USING BTREE,
	INDEX `FK_file_plan` (`plan_num`) USING BTREE,
	CONSTRAINT `FK_file_plan` FOREIGN KEY (`plan_num`) REFERENCES `purchaseorder`.`plan` (`plan_num`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

