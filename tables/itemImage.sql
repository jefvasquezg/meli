CREATE TABLE `itemImage` (
  `ID_ITEM_IMAGES` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the name of the image // Campo para guardar el nombre de la imagen',
  `format` varchar(6) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the format of the image // Campo para guardar el formato de la imagen',
  `size` varchar(12) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the size of the image for the ecommerce site // Campo para guardar el tamaño de la imagen para el sitio de comercio electrónico',
  `originalSize` varchar(12) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the original size of the image this field can be used for some rollback // Campo para guardar el tamaño original de la imagen. Este campo se puede usar para algunas rollback.',
  `pathImage` varchar(120) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the path of the image // Campo para guardar la ruta de la imagen',
  `idItem` int(11) NOT NULL COMMENT 'Field to save the id of the item , key field // Campo para guardar el id del artículo, campo clave',
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Field to save the date of created // Campo para guardar la fecha de creación',
  `dateLastUpdate` datetime DEFAULT NULL COMMENT 'Field to save the last update of the row // Campo para guardar la última actualización de la fila',
  `sourceName` varchar(15) COLLATE utf8_spanish2_ci DEFAULT 'itemImage' COMMENT 'Field to save automatically the name of the source because when you use this table in some join you case see the table in the result of the script // Campo para guardar automaticamente el nombre de la tabla ya que cuando esta tabla pueda ser usada en algun join en la consulta resultante pueda ver la tabla -- esto en caso de que el GUI no diferencie las tablas por colores.',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Field to save the status account  // Campo para guardar el estado de la cuenta --  borrado logico. ',
  PRIMARY KEY (`ID_ITEM_IMAGES`),
  KEY `fk_idItem` (`idItem`),
  CONSTRAINT `fk_idItem` FOREIGN KEY (`idItem`) REFERENCES `item` (`ID_ITEM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='This table contains the data for insert the images of the items ';
