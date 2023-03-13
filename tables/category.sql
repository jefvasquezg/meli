CREATE TABLE `category` (
  `ID_CATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `mainName` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the main category like Mercadolibre page // campo para guardar la categoria main como la pagina de mercado libre',
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the name of category like celulares-y-telefonos // Campo para guardar el nombre de la categoria como celulares-y-telefonos',
  `slug` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save slug of category this field can be used to help develpers when they create urls in web site, Slug Field is standar for ecommerce sites // Campo para guardar el valor del slug de la categoria, este campo puede ser usaro para apoyar a los desarrolladores cuando esten creanto las urls en una web site, el campo slug es un standar para los sitios de comercio electronico.',
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Field to save the date created of row I use the current date // campo para guardar la fecha de creacion del registro por defaul se deja la hora del sistema',
  `isActive` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Field to save the value to active row or unavailable row, 1 is avalible 0 is unavailable  //  Campo para guardar el valor del registro activo o inactivo 1 es activo 0 es inactivo',
  `dateDrop` datetime NOT NULL COMMENT 'Field to save value of date, logical erased // Campo para guardar el valor de la fecha del borrado logico',
  `dateLastUpdate` datetime NOT NULL COMMENT 'Field to save the last update of the row // Campo para guardar la ultima fecha de actualizacion del registro',
  `categoryImage` varchar(200) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the path of the images to the category // Campo para guardar la ruta de las imágenes a la categoría',
  `categoryDescription` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Field to save the description of the category // Campo para guardar la descripcion de la categoria.',
  `sourceName` varchar(9) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'category' COMMENT 'Field to save automatically the name of the source because when you use this table in some join you case see the table in the result of the script // Campo para guardar automaticamente el nombre de la tabla ya que cuando esta tabla pueda ser usada en algun join en la consulta resultante pueda ver la tabla -- esto en caso de que el GUI no diferencie las tablas por colores.',
  PRIMARY KEY (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='This table contains the data of categories like in the Meli exercise';
