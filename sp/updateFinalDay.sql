CREATE DEFINER=`jv`@`%` PROCEDURE `updatefinalDay`()
BEGIN
insert into finaldayinfo (price,customerEmail,dateDrop)
select payment, email, dateCreateAt 
from meli.order where  dateLastUpdate != '0000-00-00 00:00:00' or dateLastUpdate> CURDATE();
END