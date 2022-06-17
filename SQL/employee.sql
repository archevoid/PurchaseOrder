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
