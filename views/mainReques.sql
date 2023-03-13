CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `jv`@`%` 
    SQL SECURITY DEFINER
VIEW `mainrequest` AS
    SELECT 
        `od`.`ID_ORDER` AS `ID_MAIN`,
        `it`.`nameItem` AS `nameItem`,
        `cu`.`email` AS `email`,
        `ct`.`name` AS `name`,
        UCASE(CONCAT_WS(' ', `cu`.`firstName`, `cu`.`lastName`)) AS `fullName`,
        COUNT(1) AS `quantityTransaction`,
        SUM(`od`.`quantity`) AS `quantity`,
        SUM(`od`.`payment`) AS `amount`,
        SUM(`od`.`tax`) AS `tax`,
        `od`.`payment` + `od`.`tax` AS `totalAmount`,
        `od`.`dateCreateAt` AS `dateCreateAt`,
        YEAR(`od`.`dateCreateAt`) AS `year`,
        MONTHNAME(`od`.`dateCreateAt`) AS `month`,
        `it`.`dateDropItem` AS `dateDropItem`
    FROM
        (((`order` `od`
        LEFT JOIN `item` `it` ON (`it`.`ID_ITEM` = `od`.`idItemOrder`))
        LEFT JOIN `category` `ct` ON (`ct`.`ID_CATEGORY` = `it`.`itemCategoryType`))
        LEFT JOIN `customer` `cu` ON (`cu`.`ID_CUSTOMER` = `od`.`idCustomer`))
    WHERE
        `od`.`statusOrder` = 'Completed'
            AND `it`.`statusItem` = 1
    GROUP BY `it`.`nameItem`
    ORDER BY `od`.`ID_ORDER`