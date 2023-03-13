CREATE TABLE `customertype` (
  `ID_CUSTOMER_TYPE` int(11) NOT NULL AUTO_INCREMENT,
  `nameType` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Fiel to save the name of the type user // Campo para guardar el nombre de tipo de usuario',
  `isActivate` tinyint(4) NOT NULL COMMENT 'Field to save the status account  // Campo para guardar el estado del tipo de usuario --  borrado logico.',
  `dateLastUpdate` datetime NOT NULL COMMENT 'Field to save the las update in the table field // Campo para guardar la ultima actualizacion de los campos.',
  `sourceName` varchar(12) COLLATE utf8_spanish2_ci DEFAULT 'customertype' COMMENT 'Field to save automatically the name of the source because when you use this table in some join you case see the table in the result of the script // Campo para guardar automaticamente el nombre de la tabla ya que cuando esta tabla pueda ser usada en algun join en la consulta resultante pueda ver la tabla -- esto en caso de que el GUI no diferencie las tablas por colores.',
  PRIMARY KEY (`ID_CUSTOMER_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='This table contains the data of type of customers in the meli exercise you don''t consider this but I need to my sample';
