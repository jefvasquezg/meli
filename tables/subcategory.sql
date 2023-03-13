CREATE TABLE `subcategory` (
  `ID_SUBCATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `nameSubcategory` varchar(60) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Field to save the name of subcategory // Campo para guardar el nombre de la subcategoría',
  `slug` varchar(45) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Field to save the slug of the subcategory remember this field can be used to support the developer team  // Campo para guardar el slug de la subcategoría, recuerde que este campo se puede usar para apoyar al equipo de desarrolladores',
  `idCategory` int(11) NOT NULL COMMENT 'Field to save the ID of category , key field // Campo para guardar el ID de categoría, campo clave',
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Field to save date of the created row //  Campo para guardar la fecha de la fila creada',
  `dateLastUpdate` datetime NOT NULL COMMENT 'Field to save the last update of the row // Campo para guardar la última actualización de la fila',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Field to save the status of the row remember 1 is to active or 0 to inactive // Campo para guardar el estado de la fila recuerde que 1 es para activo o 0 para inactivo',
  `sourceName` varchar(45) COLLATE utf8_spanish_ci DEFAULT 'subcategory' COMMENT 'Field to save automatically the name of the source because when you use this table in some join you case see the table in the result of the script // Campo para guardar automaticamente el nombre de la tabla ya que cuando esta tabla pueda ser usada en algun join en la consulta resultante pueda ver la tabla -- esto en caso de que el GUI no diferencie las tablas por colores.',
  PRIMARY KEY (`ID_SUBCATEGORY`),
  KEY `fk_idCategory` (`idCategory`),
  CONSTRAINT `fk_idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`ID_CATEGORY`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='This table contains the data for insert the rows of subcategory, because in web page meli uses similar of categories and subcategories';
