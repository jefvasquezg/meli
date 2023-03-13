CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `jv`@`%` 
    SQL SECURITY DEFINER
VIEW `itemmonthsale` AS
    SELECT 
        `wo`.`month` AS `month`,
        CASE
            WHEN `wo`.`quantity` > `wt`.`quantity` THEN `wo`.`nameItem`
            WHEN `wo`.`quantity` <= `wt`.`quantity` THEN `wt`.`nameItem`
        END AS `nameItem`,
        CASE
            WHEN `wo`.`quantity` > `wt`.`quantity` THEN `wo`.`quantity`
            WHEN `wo`.`quantity` <= `wt`.`quantity` THEN `wt`.`quantity`
        END AS `quantity`,
        CASE
            WHEN `wo`.`quantity` > `wt`.`quantity` THEN `wo`.`totalAmount`
            WHEN `wo`.`quantity` <= `wt`.`quantity` THEN `wt`.`totalAmount`
        END AS `totalAmount`
    FROM
        (`meli`.`windowone` `wo`
        LEFT JOIN `meli`.`windowtwo` `wt` ON (`wt`.`month` = `wo`.`month`))