CREATE TABLE `progress` (
	`plan_num` INT(11) NOT NULL,
	`current_quantity` INT(11) NOT NULL DEFAULT '0',
	INDEX `FK_progress_plan` (`plan_num`) USING BTREE,
	CONSTRAINT `FK_progress_plan` FOREIGN KEY (`plan_num`) REFERENCES `purchaseorder`.`plan` (`plan_num`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;