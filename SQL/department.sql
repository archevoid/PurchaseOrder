CREATE TABLE `department` (
	`dept_num` INT(11) NOT NULL AUTO_INCREMENT,
	`dept_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`dept_num`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;
