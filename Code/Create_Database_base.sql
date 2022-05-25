DROP TABLE IF EXISTS `Person`;
DROP TABLE IF EXISTS `Worth`;
DROP TABLE IF EXISTS `Punishments`;
DROP TABLE IF EXISTS `Executed_Punishments`;

CREATE TABLE `Person`(
                         `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         `first_name` VARCHAR(255) NOT NULL,
                         `last_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Worth`(
                        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        `score` DOUBLE NOT NULL,
                        `person_id` INT NOT NULL
);
CREATE TABLE `Punishments`(
                              `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              `name` VARCHAR(255) NOT NULL,
                              `serverity` DOUBLE(8, 2) NOT NULL,
                              `trigger_score` INT NOT NULL
);
CREATE TABLE `Executed_Punishments`(
                                       `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       `execution_time` DATETIME NOT NULL,
                                       `is_executet` TINYINT(1) NOT NULL,
                                       `person_id` INT NOT NULL,
                                       `punishment_id` INT NOT NULL
);

ALTER TABLE
    `Worth` ADD CONSTRAINT `worth_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
ALTER TABLE
    `Executed_Punishments` ADD CONSTRAINT `executed_punishments_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
ALTER TABLE
    `Executed_Punishments` ADD CONSTRAINT `executed_punishments_punishment_id_foreign` FOREIGN KEY(`punishment_id`) REFERENCES `Punishments`(`id`);