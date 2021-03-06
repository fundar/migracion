
DROP TABLE IF EXISTS `federales`;
CREATE TABLE IF NOT EXISTS `federales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=287 ;

INSERT INTO `federales` (`id`, `text`) VALUES
(1, 'ADMINISTRACIÓN FEDERAL DE SERVICIOS EDUCATIVOS EN EL DISTRITO FEDERAL (AFSEDF)'),
(2, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE ALTAMIRA, S.A. DE C.V.'),
(3, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE COATZACOALCOS, S.A. DE C.V.'),
(4, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE DOS BOCAS, S.A. DE C.V.'),
(5, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE ENSENADA, S.A. DE C.V.'),
(6, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE GUAYMAS, S.A. DE C.V.'),
(7, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE LÁZARO CÁRDENAS, S.A. DE C.V.'),
(8, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE MANZANILLO, S.A. DE C.V.'),
(9, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE MAZATLÁN, S.A. DE C.V.'),
(10, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PROGRESO, S.A. DE C.V.'),
(11, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PUERTO MADERO S.A. DE C.V.'),
(12, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PUERTO VALLARTA, S.A. DE C.V.'),
(13, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE SALINA CRUZ, S.A. DE C.V.'),
(14, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TAMPICO, S.A. DE. C.V'),
(15, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TOPOLOBAMPO, S.A. DE C.V.'),
(16, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TUXPAN, S.A. DE C.V.'),
(17, 'ADMINISTRACIÓN PORTUARIA INTEGRAL DE VERACRUZ, S.A. DE C.V.'),
(18, 'AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO S.A. DE C.V.'),
(19, 'AEROPUERTOS Y SERVICIOS AUXILIARES'),
(20, 'AGROASEMEX, S.A.'),
(21, 'APOYOS Y SERVICIOS A LA COMERCIALIZACIÓN AGROPECUARIA'),
(22, 'ARCHIVO GENERAL DE LA NACIÓN'),
(23, 'BANCO DE CRÉDITO RURAL DE OCCIDENTE, S.N.C. EN LIQUIDACIÓN'),
(24, 'BANCO DE CRÉDITO RURAL DEL CENTRO, S.N.C. EN LIQUIDACIÓN'),
(25, 'BANCO DE CRÉDITO RURAL DEL CENTRO-NORTE, S.N.C. EN LIQUIDACIÓN'),
(26, 'BANCO DE CRÉDITO RURAL DEL CENTRO-SUR, S.N.C. EN LIQUIDACIÓN'),
(27, 'BANCO DE CRÉDITO RURAL DEL GOLFO, S.N.C. EN LIQUIDACIÓN'),
(28, 'BANCO DE CRÉDITO RURAL DEL ISTMO, S.N.C. EN LIQUIDACIÓN'),
(29, 'BANCO DE CRÉDITO RURAL DEL NORESTE, S.N.C. EN LIQUIDACIÓN'),
(30, 'BANCO DE CRÉDITO RURAL DEL NOROESTE, S.N.C. EN LIQUIDACIÓN'),
(31, 'BANCO DE CRÉDITO RURAL DEL NORTE, S.N.C. EN LIQUIDACIÓN'),
(32, 'BANCO DE CRÉDITO RURAL DEL PACÍFICO-NORTE, S.N.C. EN LIQUIDACIÓN'),
(33, 'BANCO DE CRÉDITO RURAL DEL PACÍFICO-SUR, S.N.C. EN LIQUIDACIÓN'),
(34, 'BANCO DE CRÉDITO RURAL PENINSULAR, S.N.C. EN LIQUIDACIÓN'),
(35, 'BANCO DEL AHORRO NACIONAL Y SERVICIOS FINANCIEROS, S.N.C.'),
(36, 'BANCO NACIONAL DE COMERCIO EXTERIOR, S.N.C.'),
(37, 'BANCO NACIONAL DE CRÉDITO RURAL, S.N.C. EN LIQUIDACIÓN'),
(38, 'BANCO NACIONAL DE OBRAS Y SERVICIOS PÚBLICOS, S.N.C.'),
(39, 'BANCO NACIONAL DEL EJÉRCITO, FUERZA AÉREA Y ARMADA, S.N.C.'),
(40, 'CAMINOS Y PUENTES FEDERALES DE INGRESOS Y SERVICIOS CONEXOS'),
(41, 'CASA DE MONEDA DE MÉXICO'),
(42, 'CENTRO DE CAPACITACIÓN CINEMATOGRÁFICA, A.C.'),
(43, 'CENTRO DE ENSEÑANZA TÉCNICA INDUSTRIAL'),
(44, 'CENTRO DE INGENIERÍA Y DESARROLLO INDUSTRIAL'),
(45, 'CENTRO DE INVESTIGACIÓN CIENTÍFICA DE YUCATÁN, A.C.'),
(46, 'CENTRO DE INVESTIGACIÓN CIENTÍFICA Y EDUCACIÓN SUPERIOR DE ENSENADA, B.C.'),
(47, 'CENTRO DE INVESTIGACIÓN EN ALIMENTACIÓN Y DESARROLLO, A.C.'),
(48, 'CENTRO DE INVESTIGACIÓN EN GEOGRAFÍA Y GEOMÁTICA ING. JORGE L.TAMAYO, A.C.'),
(49, 'CENTRO DE INVESTIGACIÓN EN MATEMÁTICAS, A.C.'),
(50, 'CENTRO DE INVESTIGACIÓN EN MATERIALES AVANZADOS, S.C.'),
(51, 'CENTRO DE INVESTIGACIÓN EN QUÍMICA APLICADA'),
(52, 'CENTRO DE INVESTIGACIÓN Y ASISTENCIA EN TECNOLOGÍA Y DISEÑO DEL ESTADO DE JALISCO '),
(53, 'CENTRO DE INVESTIGACIÓN Y DE ESTUDIOS AVANZADOS DEL IPN'),
(54, 'CENTRO DE INVESTIGACIÓN Y DESARROLLO TECNOLÓGICO EN ELECTROQUÍMICA, S.C.'),
(55, 'CENTRO DE INVESTIGACIÓN Y DOCENCIA ECONÓMICAS, A.C.'),
(56, 'CENTRO DE INVESTIGACIÓN Y SEGURIDAD NACIONAL'),
(57, 'CENTRO DE INVESTIGACIONES BIOLÓGICAS DEL NOROESTE S.C.'),
(58, 'CENTRO DE INVESTIGACIONES EN ÓPTICA, A.C.'),
(59, 'CENTRO DE INVESTIGACIONES Y ESTUDIOS SUPERIORES EN ANTROPOLOGÍA SOCIAL'),
(60, 'CENTRO NACIONAL DE METROLOGÍA'),
(61, 'CENTRO NACIONAL DE PREVENCIÓN DE DESASTRES'),
(62, 'CENTRO REGIONAL DE ALTA ESPECIALIDAD DE CHIAPAS'),
(63, 'CENTROS DE INTEGRACIÓN JUVENIL, A.C.'),
(64, 'CIATEC, A.C.'),
(65, 'CIATEQ A.C.'),
(66, 'COLEGIO DE BACHILLERES'),
(67, 'COLEGIO DE POSGRADUADOS'),
(68, 'COLEGIO NACIONAL DE EDUCACIÓN PROFESIONAL TÉCNICA'),
(69, 'COLEGIO SUPERIOR AGROPECUARIO DEL ESTADO DE GUERRERO (CSAEGRO)'),
(70, 'COMISIÓN DE OPERACIÓN Y FOMENTO DE ACTIVIDADES ACADÉMICAS DEL IPN'),
(71, 'COMISIÓN FEDERAL DE COMPETENCIA'),
(72, 'COMISIÓN FEDERAL DE ELECTRICIDAD'),
(73, 'COMISIÓN FEDERAL DE MEJORA REGULATORIA'),
(74, 'COMISIÓN FEDERAL DE TELECOMUNICACIONES'),
(75, 'COMISIÓN FEDERAL PARA LA PROTECCIÓN CONTRA RIESGOS SANITARIOS'),
(76, 'COMISIÓN NACIONAL BANCARIA Y DE VALORES'),
(77, 'COMISIÓN NACIONAL DE ACUACULTURA Y PESCA'),
(78, 'COMISIÓN NACIONAL DE ARBITRAJE MÉDICO'),
(79, 'COMISIÓN NACIONAL DE ÁREAS NATURALES PROTEGIDAS'),
(80, 'COMISIÓN NACIONAL DE CULTURA FÍSICA Y DEPORTE'),
(81, 'COMISIÓN NACIONAL DE HIDROCARBUROS'),
(82, 'COMISIÓN NACIONAL DE LIBROS DE TEXTO GRATUITOS'),
(83, 'COMISIÓN NACIONAL DE LOS SALARIOS MÍNIMOS'),
(84, 'COMISIÓN NACIONAL DE SEGURIDAD NUCLEAR Y SALVAGUARDIAS'),
(85, 'COMISIÓN NACIONAL DE SEGUROS Y FIANZAS'),
(86, 'COMISIÓN NACIONAL DE VIVIENDA'),
(87, 'COMISIÓN NACIONAL DE ZONAS ÁRIDAS'),
(88, 'COMISIÓN NACIONAL DEL AGUA'),
(89, 'COMISIÓN NACIONAL DEL SISTEMA DE AHORRO PARA EL RETIRO'),
(90, 'COMISIÓN NACIONAL FORESTAL'),
(91, 'COMISIÓN NACIONAL PARA EL DESARROLLO DE LOS PUEBLOS INDÍGENAS'),
(92, 'COMISIÓN NACIONAL PARA EL USO EFICIENTE DE LA ENERGÍA'),
(93, 'COMISIÓN NACIONAL PARA LA PROTECCIÓN Y DEFENSA DE LOS USUARIOS DE SERVICIOS FINANCIEROS'),
(94, 'COMISIÓN PARA LA REGULARIZACIÓN DE LA TENENCIA DE LA TIERRA'),
(95, 'COMISIÓN REGULADORA DE ENERGÍA'),
(96, 'COMITÉ NACIONAL MIXTO DE PROTECCIÓN AL SALARIO'),
(97, 'COMPAÑÍA MEXICANA DE EXPLORACIONES, S.A. DE C.V.'),
(98, 'COMPAÑÍA OPERADORA DEL CENTRO CULTURAL Y TURÍSTICO DE TIJUANA S.A. DE C.V.'),
(99, 'CONSEJERÍA JURÍDICA DEL EJECUTIVO FEDERAL'),
(100, 'CONSEJO DE PROMOCIÓN TURÍSTICA DE MÉXICO S.A. DE C.V.'),
(101, 'CONSEJO NACIONAL DE CIENCIA Y TECNOLOGÍA'),
(102, 'CONSEJO NACIONAL DE EVALUACIÓN DE LA POLÍTICA DE DESARROLLO SOCIAL'),
(103, 'CONSEJO NACIONAL DE FOMENTO EDUCATIVO'),
(104, 'CONSEJO NACIONAL DE NORMALIZACIÓN Y CERTIFICACIÓN DE COMPETENCIAS LABORALES (CONOCER)'),
(105, 'CONSEJO NACIONAL DE POBLACIÓN'),
(106, 'CONSEJO NACIONAL PARA LA CULTURA Y LAS ARTES'),
(107, 'CONSEJO NACIONAL PARA PREVENIR LA DISCRIMINACIÓN'),
(108, 'COORDINACIÓN GENERAL DE LA COMISIÓN MEXICANA DE AYUDA A REFUGIADOS'),
(109, 'COORDINACIÓN GENERAL DEL PROGRAMA NACIONAL DE APOYO PARA LAS EMPRESAS DE SOLIDARIDAD (FONAES)'),
(110, 'COORDINACIÓN NACIONAL DEL PROGRAMA DE DESARROLLO HUMANO OPORTUNIDADES'),
(111, 'CORPORACIÓN MEXICANA DE INVESTIGACIÓN EN MATERIALES, S. A. DE C.V.'),
(112, 'DICONSA S.A. DE C.V.'),
(113, 'EDUCAL, S.A. DE C.V.'),
(114, 'EL COLEGIO DE LA FRONTERA NORTE, A.C.'),
(115, 'EL COLEGIO DE LA FRONTERA SUR'),
(116, 'EL COLEGIO DE MÉXICO, A.C.'),
(117, 'EL COLEGIO DE MICHOACÁN, A.C.'),
(118, 'EL COLEGIO DE SAN LUIS, A.C.'),
(119, 'ESTUDIOS CHURUBUSCO AZTECA, S.A.'),
(120, 'EXPORTADORA DE SAL, S.A. DE C.V.'),
(121, 'FERROCARRIL DEL ISTMO DE TEHUANTEPEC S.A. DE C.V.'),
(122, 'FERROCARRILES NACIONALES DE MÉXICO EN LIQUIDACIÓN'),
(123, 'FIDEICOMISO DE CONSTRUCCIONES MILITARES'),
(124, 'FIDEICOMISO DE FOMENTO MINERO'),
(125, 'FIDEICOMISO DE FORMACIÓN Y CAPACITACIÓN PARA EL PERSONAL DE LA MARINA MERCANTE NACIONAL'),
(126, 'FIDEICOMISO DE RIESGO COMPARTIDO'),
(127, 'FIDEICOMISO FONDO NACIONAL DE FOMENTO EJIDAL'),
(128, 'FIDEICOMISO FONDO NACIONAL DE HABITACIONES POPULARES'),
(129, 'FIDEICOMISO LIQUIDADOR DE INSTITUCIONES Y ORGANIZACIONES AUXILIARES DE CRÉDITO'),
(130, 'FIDEICOMISO PARA LA CINETECA NACIONAL'),
(131, 'FINANCIERA RURAL'),
(132, 'FONATUR, CONSTRUCTORA, S.A. DE C.V.'),
(133, 'FONATUR MANTENIMIENTO TURÍSTICO S.A. de C.V'),
(134, 'FONATUR OPERADORA PORTUARIA, S.A. DE C.V.'),
(135, 'FONDO DE CAPITALIZACIÓN E INVERSIÓN DEL SECTOR RURAL'),
(136, 'FONDO DE CULTURA ECONÓMICA'),
(137, 'FONDO DE GARANTÍA Y FOMENTO PARA LA AGRICULTURA, GANADERÍA Y AVICULTURA'),
(138, 'FONDO DE INFORMACIÓN Y DOCUMENTACIÓN PARA LA INDUSTRIA'),
(139, 'FONDO DE OPERACIÓN Y FINANCIAMIENTO BANCARIO A LA VIVIENDA'),
(140, 'FONDO NACIONAL DE FOMENTO AL TURISMO'),
(141, 'FONDO NACIONAL PARA EL FOMENTO DE LAS ARTESANÍAS'),
(142, 'FONDO PARA EL DESARROLLO DE RECURSOS HUMANOS'),
(143, 'GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V.'),
(144, 'HOSPITAL GENERAL DE MÉXICO'),
(145, 'HOSPITAL GENERAL DR. MANUEL GEA GONZÁLEZ'),
(146, 'HOSPITAL INFANTIL DE MÉXICO FEDERICO GÓMEZ'),
(147, 'HOSPITAL JUÁREZ DE MÉXICO'),
(148, 'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DEL BAJÍO'),
(149, 'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD CIUDAD VICTORIA &quot;BICENTENARIO 2010&quot;'),
(150, 'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DE OAXACA'),
(151, 'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DE YUCATÁN'),
(152, 'III SERVICIOS, S. A. DE C. V.'),
(153, 'IMPRESORA Y ENCUADERNADORA PROGRESO, S. A. DE C.V.'),
(154, 'INSTITUTO NACIONAL DE BELLAS ARTES Y LITERATURA'),
(155, 'INSTITUTO DE ECOLOGÍA, A. C.'),
(156, 'INSTITUTO DE INVESTIGACIONES DR. JOSÉ MARÍA LUIS MORA'),
(157, 'INSTITUTO DE INVESTIGACIONES ELÉCTRICAS'),
(158, 'INSTITUTO DE SEGURIDAD SOCIAL PARA LAS FUERZAS ARMADAS MEXICANAS'),
(159, 'INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES DE LOS TRABAJADORES DEL ESTADO'),
(160, 'INSTITUTO DEL FONDO NACIONAL DE LA VIVIENDA PARA LOS TRABAJADORES'),
(161, 'INSTITUTO DEL FONDO NACIONAL PARA EL CONSUMO DE LOS TRABAJADORES'),
(162, 'INSTITUTO FEDERAL DE ACCESO A LA INFORMACIÓN Y PROTECCIÓN DE DATOS'),
(163, 'INSTITUTO MEXICANO DE CINEMATOGRAFÍA'),
(164, 'INSTITUTO MEXICANO DE LA JUVENTUD'),
(165, 'INSTITUTO MEXICANO DE LA PROPIEDAD INDUSTRIAL'),
(166, 'INSTITUTO MEXICANO DE LA RADIO'),
(167, 'INSTITUTO MEXICANO DE LA RADIO'),
(168, 'INSTITUTO MEXICANO DE TECNOLOGÍA DEL AGUA'),
(169, 'INSTITUTO MEXICANO DEL PETRÓLEO'),
(170, 'INSTITUTO MEXICANO DEL SEGURO SOCIAL'),
(171, 'INSTITUTO NACIONAL DE ANTROPOLOGÍA E HISTORIA'),
(172, 'INSTITUTO NACIONAL DE ASTROFÍSICA, ÓPTICA Y ELECTRÓNICA'),
(173, 'INSTITUTO NACIONAL DE CANCEROLOGÍA'),
(174, 'INSTITUTO NACIONAL DE CARDIOLOGÍA IGNACIO CHÁVEZ'),
(175, 'INSTITUTO NACIONAL DE CIENCIAS MÉDICAS Y NUTRICIÓN SALVADOR ZUBIRÁN'),
(176, 'INSTITUTO NACIONAL DE CIENCIAS PENALES'),
(177, 'INSTITUTO NACIONAL DE DESARROLLO SOCIAL'),
(178, 'INSTITUTO NACIONAL DE ECOLOGÍA'),
(179, 'INSTITUTO NACIONAL DE ENFERMEDADES RESPIRATORIAS'),
(180, 'INSTITUTO NACIONAL DE ESTADÍSTICA, GEOGRAFÍA E INFORMÁTICA'),
(181, 'INSTITUTO NACIONAL DE ESTUDIOS HISTÓRICOS DE LAS REVOLUCIONES DE MÉXICO'),
(182, 'INSTITUTO NACIONAL DE INVESTIGACIONES FORESTALES, AGRÍCOLAS Y PECUARIAS'),
(183, 'INSTITUTO NACIONAL DE INVESTIGACIONES NUCLEARES'),
(184, 'INSTITUTO NACIONAL DE LA INFRAESTRUCTURA FÍSICA EDUCATIVA'),
(185, 'INSTITUTO NACIONAL DE LAS MUJERES'),
(186, 'INSTITUTO NACIONAL DE LAS PERSONAS ADULTAS MAYORES'),
(187, 'INSTITUTO NACIONAL DE LENGUAS INDÍGENAS'),
(188, 'INSTITUTO NACIONAL DE MEDICINA GENÓMICA'),
(189, 'INSTITUTO NACIONAL DE MIGRACIÓN'),
(190, 'INSTITUTO NACIONAL DE NEUROLOGÍA Y NEUROCIRUGÍA MANUEL VELASCO SUÁREZ'),
(191, 'INSTITUTO NACIONAL DE PEDIATRÍA'),
(192, 'INSTITUTO NACIONAL DE PERINATOLOGÍA'),
(193, 'INSTITUTO NACIONAL DE PESCA'),
(194, 'INSTITUTO NACIONAL DE PSIQUIATRÍA RAMÓN DE LA FUENTE MUÑÍZ'),
(195, 'INSTITUTO NACIONAL DE REHABILITACIÓN'),
(196, 'INSTITUTO NACIONAL DE SALUD PÚBLICA'),
(197, 'INSTITUTO NACIONAL INDIGENISTA'),
(198, 'INSTITUTO NACIONAL PARA EL DESARROLLO DE CAPACIDADES DEL SECTOR RURAL A.C.'),
(199, 'INSTITUTO NACIONAL PARA LA EDUCACIÓN DE LOS ADULTOS'),
(200, 'INSTITUTO NACIONAL PARA LA EVALUACIÓN DE LA EDUCACIÓN'),
(201, 'INSTITUTO PARA EL DESARROLLO TÉCNICO DE LAS HACIENDAS PÚBLICAS'),
(202, 'INSTITUTO PARA LA PROTECCIÓN AL AHORRO BANCARIO'),
(203, 'INSTITUTO POLITÉCNICO NACIONAL'),
(204, 'INSTITUTO POTOSINO DE INVESTIGACIÓN CIENTÍFICA Y TECNOLÓGICA, A.C.'),
(205, 'JUNTA FEDERAL DE CONCILIACIÓN Y ARBITRAJE'),
(206, 'LABORATORIOS DE BIOLÓGICOS Y REACTIVOS DE MÉXICO, S. A. DE C.V.'),
(207, 'LICONSA, S.A. DE C.V.'),
(208, 'LOTERÍA NACIONAL PARA LA ASISTENCIA PÚBLICA'),
(209, 'LUZ Y FUERZA DEL CENTRO (EN PROCESO DE LIQUIDACIÓN)'),
(210, 'MONITOREO DE SERVICIOS NO UTILIZAR'),
(211, 'MONITOREO DE SERVICIOS 3 NO UTILIZAR'),
(212, 'MONITOREO 2 DE SERVICIOS NO UTILIZAR'),
(213, 'NACIONAL FINANCIERA, S.N.C.'),
(214, 'NOTIMEX, AGENCIA DE NOTICIAS DEL ESTADO MEXICANO'),
(215, 'NOTIMEX, S.A. DE C.V.'),
(216, 'OADPRS ÓRGANO ADMINISTRATIVO DESCONCENTRADO PREVENCIÓN Y READAPTACIÓN SOCIAL'),
(217, 'OCEAN GARDEN PRODUCTS, INC.'),
(218, 'ORGANISMO PROMOTOR DE MEDIOS AUDIOVISUALES'),
(219, 'ÓRGANO ADMINISTRATIVO DESCONCENTRADO DE PREVENCIÓN Y READAPTACIÓN SOCIAL'),
(220, 'PATRONATO DE OBRAS E INSTALACIONES DEL INSTITUTO POLITÉCNICO NACIONAL '),
(221, 'PEMEX EXPLORACIÓN Y PRODUCCIÓN'),
(222, 'PEMEX GAS Y PETROQUÍMICA BÁSICA'),
(223, 'PEMEX PETROQUÍMICA'),
(224, 'PEMEX REFINACIÓN'),
(225, 'PETRÓLEOS MEXICANOS'),
(226, 'PETROQUÍMICA CAMARGO, S.A. DE C.V.'),
(227, 'PETROQUÍMICA CANGREJERA, S.A. DE C.V.'),
(228, 'PETROQUÍMICA COSOLEACAQUE, S.A. DE C.V.'),
(229, 'PETROQUÍMICA ESCOLÍN, S.A. DE C.V.'),
(230, 'PETROQUÍMICA MORELOS, S.A. DE C.V.'),
(231, 'PETROQUÍMICA PAJARITOS, S.A. DE C.V.'),
(232, 'PETROQUÍMICA TULA, S.A. DE C.V.'),
(233, 'PMI COMERCIO INTERNACIONAL, S.A. DE C.V.'),
(234, 'POLICÍA FEDERAL, ANTES POLICÍA FEDERAL PREVENTIVA'),
(235, 'PRESIDENCIA DE LA REPÚBLICA'),
(236, 'PROCURADURÍA AGRARIA'),
(237, 'PROCURADURÍA DE LA DEFENSA DEL CONTRIBUYENTE (PRODECON)'),
(238, 'PROCURADURÍA FEDERAL DE LA DEFENSA DEL TRABAJO'),
(239, 'PROCURADURÍA FEDERAL DE PROTECCIÓN AL AMBIENTE'),
(240, 'PROCURADURÍA FEDERAL DEL CONSUMIDOR'),
(241, 'PROCURADURÍA GENERAL DE LA REPÚBLICA'),
(242, 'PROCURADURIA SOCIAL DE ATENCIÓN A LAS VÍCTIMAS DE DELITOS'),
(243, 'PRODUCTORA DE COSPELES, S.A. DE C.V.'),
(244, 'PRODUCTORA NACIONAL DE BIOLÓGICOS VETERINARIOS'),
(245, 'PRODUCTORA NACIONAL DE SEMILLAS'),
(246, 'PROMÉXICO'),
(247, 'PRONÓSTICOS PARA LA ASISTENCIA PÚBLICA'),
(248, 'REGISTRO AGRARIO NACIONAL'),
(249, 'SECRETARÍA DE AGRICULTURA, GANADERÍA, DESARROLLO RURAL, PESCA Y ALIMENTACIÓN'),
(250, 'SECRETARÍA DE COMUNICACIONES Y TRANSPORTES'),
(251, 'SECRETARÍA DE DESARROLLO SOCIAL'),
(252, 'SECRETARÍA DE ECONOMÍA'),
(253, 'SECRETARÍA DE EDUCACIÓN PÚBLICA'),
(254, 'SECRETARÍA DE ENERGÍA'),
(255, 'SECRETARÍA DE GOBERNACIÓN'),
(256, 'SECRETARÍA DE HACIENDA Y CRÉDITO PÚBLICO'),
(257, 'SECRETARÍA DE LA DEFENSA NACIONAL'),
(258, 'SECRETARÍA DE LA FUNCIÓN PÚBLICA'),
(259, 'SECRETARÍA DE LA REFORMA AGRARIA'),
(260, 'SECRETARÍA DE MARINA'),
(261, 'SECRETARÍA DE MEDIO AMBIENTE Y RECURSOS NATURALES'),
(262, 'SECRETARÍA DE RELACIONES EXTERIORES'),
(263, 'SECRETARÍA DE SALUD'),
(264, 'SECRETARÍA DE SEGURIDAD PÚBLICA'),
(265, 'SECRETARÍA DE TURISMO'),
(266, 'SECRETARÍA DEL TRABAJO Y PREVISIÓN SOCIAL'),
(267, 'SECRETARIADO EJECUTIVO DEL SISTEMA NACIONAL DE SEGURIDAD PÚBLICA'),
(268, 'SERVICIO DE ADMINISTRACIÓN DE BIENES ASEGURADOS'),
(269, 'SERVICIO DE ADMINISTRACIÓN TRIBUTARIA'),
(270, 'SERVICIO DE ADMINISTRACIÓN Y ENAJENACIÓN DE BIENES'),
(271, 'SERVICIO DE INFORMACIÓN AGROALIMENTARIA Y PESQUERA'),
(272, 'SERVICIO DE PROTECCIÓN FEDERAL'),
(273, 'SERVICIO GEOLÓGICO MEXICANO'),
(274, 'SERVICIO NACIONAL DE INSPECCIÓN Y CERTIFICACIÓN DE SEMILLAS'),
(275, 'SERVICIO NACIONAL DE SANIDAD, INOCUIDAD Y CALIDAD AGROALIMENTARIA'),
(276, 'SERVICIO POSTAL MEXICANO'),
(277, 'SERVICIOS A LA NAVEGACIÓN EN EL ESPACIO AÉREO MEXICANO'),
(278, 'SERVICIOS AEROPORTUARIOS DE LA CIUDAD DE MÉXICO, S.A. DE C.V.'),
(279, 'SISTEMA NACIONAL PARA EL DESARROLLO INTEGRAL DE LA FAMILIA'),
(280, 'SOCIEDAD HIPOTECARIA FEDERAL, S.N.C.'),
(281, 'TALLERES GRÁFICOS DE MÉXICO'),
(282, 'TELECOMUNICACIONES DE MÉXICO'),
(283, 'TELEVISIÓN METROPOLITANA, S.A. DE C.V.'),
(284, 'TRIBUNAL UNITARIO AGRARIO DISTRITO 44 EN GÓMEZ PALACIO DURANGO'),
(285, 'UNIVERSIDAD PEDAGÓGICA NACIONAL'),
(286, 'CNDH');
