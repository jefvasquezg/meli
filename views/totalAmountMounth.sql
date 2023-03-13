CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `jv`@`%` 
    SQL SECURITY DEFINER
VIEW `totalamountmounth` AS
    SELECT 
        `mainrequest`.`month` AS `month`,
        SUM(`mainrequest`.`totalAmount`) AS `totalAmount`
    FROM
        `mainrequest`
    GROUP BY `mainrequest`.`month`