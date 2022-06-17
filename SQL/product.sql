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
