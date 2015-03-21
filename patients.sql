CREATE TABLE `patient` (
  `patientNumber` int(11) NOT NULL AUTO_INCREMENT,
  `patientLastName` varchar(256) NOT NULL,
  `patientFirstName` varchar(256) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `streetname` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`patientNumber`)
);


LOCK TABLES `patient` WRITE;
INSERT INTO `patient` VALUES (1,'Иванов','Иван','+79991234567','Москва','Красная Площадь','Россия');
INSERT INTO `patient` VALUES (2,'Сидоров','Сидор','+79997654321','Санкт-Петербург','Невский Проспект','Россия');
INSERT INTO `patient` VALUES (3,'Петров','Петр','+79991235476','Санкт-Петербург','ул. Ленина','Россия');
INSERT INTO `patient` VALUES (4,'Прекрасная','Елена','+79993215476','Санкт-Петербург','ул. Мира','Россия');
INSERT INTO `patient` VALUES (5,'Премудрая','Василиса','+79996754321','Санкт-Петербург','Дворцовая Площадь','Россия');

