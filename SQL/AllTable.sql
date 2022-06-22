CREATE TABLE `member` (
	`member_num` INT(11) NOT NULL AUTO_INCREMENT,
	`member_id` VARCHAR(42) NOT NULL COLLATE 'utf8mb3_general_ci',
	`member_pw` VARCHAR(300) NOT NULL COLLATE 'utf8mb3_general_ci',
	`authority` VARCHAR(10) NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`member_num`) USING BTREE,
	UNIQUE INDEX `member_id` (`member_id`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `department` (
	`dept_num` INT(11) NOT NULL AUTO_INCREMENT,
	`dept_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`dept_num`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `employee` (
	`epl_num` INT(11) NOT NULL AUTO_INCREMENT,
	`dept_num` INT(11) NOT NULL DEFAULT '0',
	`member_id` VARCHAR(42) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`email` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`epl_num`) USING BTREE,
	INDEX `FK_employee_department` (`dept_num`) USING BTREE,
	INDEX `FK_employee_member` (`member_id`) USING BTREE,
	CONSTRAINT `FK_employee_department` FOREIGN KEY (`dept_num`) REFERENCES `purchaseorder`.`department` (`dept_num`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_employee_member` FOREIGN KEY (`member_id`) REFERENCES `purchaseorder`.`member` (`member_id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `partner` (
	`ptn_num` INT(11) NOT NULL AUTO_INCREMENT,
	`ptn_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`member_id` VARCHAR(42) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`ptn_tel` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`ptn_fax` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`ptn_num`) USING BTREE,
	INDEX `FK_partner_account` (`member_id`) USING BTREE,
	CONSTRAINT `FK_partner_account` FOREIGN KEY (`member_id`) REFERENCES `purchaseorder`.`member` (`member_id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `product` (
	`product_num` INT(11) NOT NULL AUTO_INCREMENT,
	`ptn_num` INT(11) NOT NULL,
	`product_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`product_price` INT(11) NOT NULL,
	PRIMARY KEY (`product_num`) USING BTREE,
	INDEX `FK_product_partner` (`ptn_num`) USING BTREE,
	CONSTRAINT `FK_product_partner` FOREIGN KEY (`ptn_num`) REFERENCES `purchaseorder`.`partner` (`ptn_num`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `plan` (
	`plan_num` INT(11) NOT NULL AUTO_INCREMENT,
	`epl_num` INT(11) NULL DEFAULT NULL,
	`product_num` INT(11) NOT NULL,
	`quantity` INT(11) NOT NULL,
	`due_date` DATE NOT NULL,
	PRIMARY KEY (`plan_num`) USING BTREE,
	INDEX `FK_plan_employee` (`epl_num`) USING BTREE,
	INDEX `FK_plan_product` (`product_num`) USING BTREE,
	CONSTRAINT `FK_plan_employee` FOREIGN KEY (`epl_num`) REFERENCES `purchaseorder`.`employee` (`epl_num`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_plan_product` FOREIGN KEY (`product_num`) REFERENCES `purchaseorder`.`product` (`product_num`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `progress` (
	`plan_num` INT(11) NOT NULL,
	`current_quantity` INT(11) NOT NULL DEFAULT '0',
	INDEX `FK_progress_plan` (`plan_num`) USING BTREE,
	CONSTRAINT `FK_progress_plan` FOREIGN KEY (`plan_num`) REFERENCES `purchaseorder`.`plan` (`plan_num`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

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

