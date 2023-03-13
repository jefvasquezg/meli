CREATE TABLE `finalDayFnfo` (
  `ID_FINAL_DAY` int(11) NOT NULL AUTO_INCREMENT,
  `price` float(18,2) NOT NULL COMMENT 'Field to save the price to the orders of the current day // Campo para guardar el precio a las órdenes del día actual',
  `customerEmail` varchar(45) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Field to save the email to the orders of the current day // Campo para guardar el email a los pedidos del día actual',
  `dateDrop` datetime NOT NULL COMMENT 'Field to save the date of the logical erased  // Field to save the date of the logical erased ',
  `dateLastUpdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Field to save the date of last update row // Campo para guardar la fecha de la última fila de actualización',
  `sourceName` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'finaldayinfo' COMMENT 'Field to save automatically the name of the source because when you use this table in some join you case see the table in the result of the script // Campo para guardar automaticamente el nombre de la tabla ya que cuando esta tabla pueda ser usada en algun join en la consulta resultante pueda ver la tabla -- esto en caso de que el GUI no diferencie las tablas por colores.',
  PRIMARY KEY (`ID_FINAL_DAY`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='This table contains the data for insert the rows of the final day this table is part of the ativity  2 in meli exercise ';
