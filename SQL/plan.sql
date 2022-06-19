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
AUTO_INCREMENT=7
;
