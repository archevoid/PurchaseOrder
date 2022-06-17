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
