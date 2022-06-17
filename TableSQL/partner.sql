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
