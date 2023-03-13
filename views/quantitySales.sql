CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `jv`@`%` 
    SQL SECURITY DEFINER
VIEW `quantitysales` AS
    SELECT 
        `mainrequest`.`ID_MAIN` AS `ID_MAIN`,
        `mainrequest`.`month` AS `month`,
        SUM(`mainrequest`.`quantity`) AS `quantitySales`
    FROM
        `mainrequest`
    GROUP BY `mainrequest`.`month` DESC