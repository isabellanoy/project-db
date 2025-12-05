INSERT INTO Lugar (l_nombre, l_tipo) VALUES
	('America', 'CONTINENTE'),
	('Europa', 'CONTINENTE'),
	('Africa', 'CONTINENTE'),
	('Asia', 'CONTINENTE'),
	('Oceania', 'CONTINENTE');

INSERT INTO Lugar (l_nombre, l_tipo, Lugar_l_cod) VALUES
	('Venezuela', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'America' LIMIT 1));

INSERT INTO Lugar (l_nombre, l_tipo, Lugar_l_cod) VALUES
	('Amazonas', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Anzoategui', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Apure', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Aragua', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Barinas', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Bolivar', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Carabobo', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Cojedes', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Delta Amacuro', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Falcon', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Guarico', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('La Guaira', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Lara', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Merida', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Miranda', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Monagas', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Nueva Esparta', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Portuguesa', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Sucre', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Tachira', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Trujillo', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Yaracuy', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Zulia', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Distrito Capital', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1));

INSERT INTO LUGAR (lugar_l_cod, l_nombre, l_tipo) VALUES
	(7, 'Alto Orinoco','MUNICIPIO'),
	(7, 'Atabapo','MUNICIPIO'),
	(7, 'Atures','MUNICIPIO'),
	(7, 'Autana','MUNICIPIO'),
	(7, 'Manapiare','MUNICIPIO'),
	(7, 'Maroa','MUNICIPIO'),
	(7, 'Río Negro','MUNICIPIO'),
	(8, 'Anaco','MUNICIPIO'),
	(8, 'Aragua','MUNICIPIO'),
	(8, 'Manuel Ezequiel Bruzual','MUNICIPIO'),
	(8, 'Diego Bautista Urbaneja','MUNICIPIO'),
	(8, 'Fernando Peñalver','MUNICIPIO'),
	(8, 'Francisco Del Carmen Carvajal','MUNICIPIO'),
	(8, 'General Sir Arthur McGregor','MUNICIPIO'),
	(8, 'Guanta','MUNICIPIO'),
	(8, 'Independencia','MUNICIPIO'),
	(8, 'José Gregorio Monagas','MUNICIPIO'),
	(8, 'Juan Antonio Sotillo','MUNICIPIO'),
	(8, 'Juan Manuel Cajigal','MUNICIPIO'),
	(8, 'Libertad','MUNICIPIO'),
	(8, 'Francisco de Miranda','MUNICIPIO'),
	(8, 'Pedro María Freites','MUNICIPIO'),
	(8, 'Píritu','MUNICIPIO'),
	(8, 'San José de Guanipa','MUNICIPIO'),
	(8, 'San Juan de Capistrano','MUNICIPIO'),
	(8, 'Santa Ana','MUNICIPIO'),
	(8, 'Simón Bolívar','MUNICIPIO'),
	(8, 'Simón Rodríguez','MUNICIPIO'),
	(9, 'Achaguas','MUNICIPIO'),
	(9, 'Biruaca','MUNICIPIO'),
	(9, 'Muñóz','MUNICIPIO'),
	(9, 'Páez','MUNICIPIO'),
	(9, 'Pedro Camejo','MUNICIPIO'),
	(9, 'Rómulo Gallegos','MUNICIPIO'),
	(9, 'San Fernando','MUNICIPIO'),
	(10, 'Atanasio Girardot','MUNICIPIO'),
	(10, 'Bolívar','MUNICIPIO'),
	(10, 'Camatagua','MUNICIPIO'),
	(10, 'Francisco Linares Alcántara','MUNICIPIO'),
	(10, 'José Ángel Lamas','MUNICIPIO'),
	(10, 'José Félix Ribas','MUNICIPIO'),
	(10, 'José Rafael Revenga','MUNICIPIO'),
	(10, 'Libertador','MUNICIPIO'),
	(10, 'Ocumare de la Costa de Oro','MUNICIPIO'),
	(10, 'San Casimiro','MUNICIPIO'),
	(10, 'Mario Briceño Iragorry','MUNICIPIO'),
	(10, 'San Sebastián','MUNICIPIO'),
	(10, 'Santiago Mariño','MUNICIPIO'),
	(10, 'Santos Michelena','MUNICIPIO'),
	(10, 'Sucre','MUNICIPIO'),
	(10, 'Tovar','MUNICIPIO'),
	(10, 'Urdaneta','MUNICIPIO'),
	(10, 'Zamora','MUNICIPIO'),
	(11, 'Alberto Arvelo Torrealba','MUNICIPIO'),
	(11, 'Andrés Eloy Blanco','MUNICIPIO'),
	(11, 'Antonio José de Sucre','MUNICIPIO'),
	(11, 'Arismendi','MUNICIPIO'),
	(11, 'Barinas','MUNICIPIO'),
	(11, 'Bolívar','MUNICIPIO'),
	(11, 'Cruz Paredes','MUNICIPIO'),
	(11, 'Ezequiel Zamora','MUNICIPIO'),
	(11, 'Obispos','MUNICIPIO'),
	(11, 'Pedraza','MUNICIPIO'),
	(11, 'Rojas','MUNICIPIO'),
	(11, 'Sosa','MUNICIPIO'),
	(12, 'Caroní','MUNICIPIO'),
	(12, 'Cedeño','MUNICIPIO'),
	(12, 'El Callao','MUNICIPIO'),
	(12, 'Gran Sabana','MUNICIPIO'),
	(12, 'Heres','MUNICIPIO'),
	(12, 'Piar','MUNICIPIO'),
	(12, 'Angostura (Raúl Leoni)','MUNICIPIO'),
	(12, 'Roscio','MUNICIPIO'),
	(12, 'Sifontes','MUNICIPIO'),
	(12, 'Sucre','MUNICIPIO'),
	(12, 'Padre Pedro Chien','MUNICIPIO'),
	(13, 'Bejuma','MUNICIPIO'),
	(13, 'Carlos Arvelo','MUNICIPIO'),
	(13, 'Diego Ibarra','MUNICIPIO'),
	(13, 'Guacara','MUNICIPIO'),
	(13, 'Juan José Mora','MUNICIPIO'),
	(13, 'Libertador','MUNICIPIO'),
	(13, 'Los Guayos','MUNICIPIO'),
	(13, 'Miranda','MUNICIPIO'),
	(13, 'Montalbán','MUNICIPIO'),
	(13, 'Naguanagua','MUNICIPIO'),
	(13, 'Puerto Cabello','MUNICIPIO'),
	(13, 'San Diego','MUNICIPIO'),
	(13, 'San Joaquín','MUNICIPIO'),
	(13, 'Valencia','MUNICIPIO'),
	(14, 'Anzoátegui','MUNICIPIO'),
	(14, 'Tinaquillo','MUNICIPIO'),
	(14, 'Girardot','MUNICIPIO'),
	(14, 'Lima Blanco','MUNICIPIO'),
	(14, 'Pao de San Juan Bautista','MUNICIPIO'),
	(14, 'Ricaurte','MUNICIPIO'),
	(14, 'Rómulo Gallegos','MUNICIPIO'),
	(14, 'San Carlos','MUNICIPIO'),
	(14, 'Tinaco','MUNICIPIO'),
	(15, 'Antonio Díaz','MUNICIPIO'),
	(15, 'Casacoima','MUNICIPIO'),
	(15, 'Pedernales','MUNICIPIO'),
	(15, 'Tucupita','MUNICIPIO'),
	(16, 'Acosta','MUNICIPIO'),
	(16, 'Bolívar','MUNICIPIO'),
	(16, 'Buchivacoa','MUNICIPIO'),
	(16, 'Cacique Manaure','MUNICIPIO'),
	(16, 'Carirubana','MUNICIPIO'),
	(16, 'Colina','MUNICIPIO'),
	(16, 'Dabajuro','MUNICIPIO'),
	(16, 'Democracia','MUNICIPIO'),
	(16, 'Falcón','MUNICIPIO'),
	(16, 'Federación','MUNICIPIO'),
	(16, 'Jacura','MUNICIPIO'),
	(16, 'José Laurencio Silva','MUNICIPIO'),
	(16, 'Los Taques','MUNICIPIO'),
	(16, 'Mauroa','MUNICIPIO'),
	(16, 'Miranda','MUNICIPIO'),
	(16, 'Monseñor Iturriza','MUNICIPIO'),
	(16, 'Palmasola','MUNICIPIO'),
	(16, 'Petit','MUNICIPIO'),
	(16, 'Píritu','MUNICIPIO'),
	(16, 'San Francisco','MUNICIPIO'),
	(16, 'Sucre','MUNICIPIO'),
	(16, 'Tocópero','MUNICIPIO'),
	(16, 'Unión','MUNICIPIO'),
	(16, 'Urumaco','MUNICIPIO'),
	(16, 'Zamora','MUNICIPIO'),
	(17, 'Camaguán','MUNICIPIO'),
	(17, 'Chaguaramas','MUNICIPIO'),
	(17, 'El Socorro','MUNICIPIO'),
	(17, 'José Félix Ribas','MUNICIPIO'),
	(17, 'José Tadeo Monagas','MUNICIPIO'),
	(17, 'Juan Germán Roscio','MUNICIPIO'),
	(17, 'Julián Mellado','MUNICIPIO'),
	(17, 'Las Mercedes','MUNICIPIO'),
	(17, 'Leonardo Infante','MUNICIPIO'),
	(17, 'Pedro Zaraza','MUNICIPIO'),
	(17, 'Ortíz','MUNICIPIO'),
	(17, 'San Gerónimo de Guayabal','MUNICIPIO'),
	(17, 'San José de Guaribe','MUNICIPIO'),
	(17, 'Santa María de Ipire','MUNICIPIO'),
	(17, 'Sebastián Francisco de Miranda','MUNICIPIO'),
	(18, 'Andrés Eloy Blanco','MUNICIPIO'),
	(18, 'Crespo','MUNICIPIO'),
	(18, 'Iribarren','MUNICIPIO'),
	(18, 'Jiménez','MUNICIPIO'),
	(18, 'Morán','MUNICIPIO'),
	(18, 'Palavecino','MUNICIPIO'),
	(18, 'Simón Planas','MUNICIPIO'),
	(18, 'Torres','MUNICIPIO'),
	(18, 'Urdaneta','MUNICIPIO'),
	(19, 'Alberto Adriani','MUNICIPIO'),
	(19, 'Andrés Bello','MUNICIPIO'),
	(19, 'Antonio Pinto Salinas','MUNICIPIO'),
	(19, 'Aricagua','MUNICIPIO'),
	(19, 'Arzobispo Chacón','MUNICIPIO'),
	(19, 'Campo Elías','MUNICIPIO'),
	(19, 'Caracciolo Parra Olmedo','MUNICIPIO'),
	(19, 'Cardenal Quintero','MUNICIPIO'),
	(19, 'Guaraque','MUNICIPIO'),
	(19, 'Julio César Salas','MUNICIPIO'),
	(19, 'Justo Briceño','MUNICIPIO'),
	(19, 'Libertador','MUNICIPIO'),
	(19, 'Miranda','MUNICIPIO'),
	(19, 'Obispo Ramos de Lora','MUNICIPIO'),
	(19, 'Padre Noguera','MUNICIPIO'),
	(19, 'Pueblo Llano','MUNICIPIO'),
	(19, 'Rangel','MUNICIPIO'),
	(19, 'Rivas Dávila','MUNICIPIO'),
	(19, 'Santos Marquina','MUNICIPIO'),
	(19, 'Sucre','MUNICIPIO'),
	(19, 'Tovar','MUNICIPIO'),
	(19, 'Tulio Febres Cordero','MUNICIPIO'),
	(19, 'Zea','MUNICIPIO'),
	(20, 'Acevedo','MUNICIPIO'),
	(20, 'Andrés Bello','MUNICIPIO'),
	(20, 'Baruta','MUNICIPIO'),
	(20, 'Brión','MUNICIPIO'),
	(20, 'Buroz','MUNICIPIO'),
	(20, 'Carrizal','MUNICIPIO'),
	(20, 'Chacao','MUNICIPIO'),
	(20, 'Cristóbal Rojas','MUNICIPIO'),
	(20, 'El Hatillo','MUNICIPIO'),
	(20, 'Guaicaipuro','MUNICIPIO'),
	(20, 'Independencia','MUNICIPIO'),
	(20, 'Lander','MUNICIPIO'),
	(20, 'Los Salias','MUNICIPIO'),
	(20, 'Páez','MUNICIPIO'),
	(20, 'Paz Castillo','MUNICIPIO'),
	(20, 'Pedro Gual','MUNICIPIO'),
	(20, 'Plaza','MUNICIPIO'),
	(20, 'Simón Bolívar','MUNICIPIO'),
	(20, 'Sucre','MUNICIPIO'),
	(20, 'Urdaneta','MUNICIPIO'),
	(20, 'Zamora','MUNICIPIO'),
	(21, 'Acosta','MUNICIPIO'),
	(21, 'Aguasay','MUNICIPIO'),
	(21, 'Bolívar','MUNICIPIO'),
	(21, 'Caripe','MUNICIPIO'),
	(21, 'Cedeño','MUNICIPIO'),
	(21, 'Ezequiel Zamora','MUNICIPIO'),
	(21, 'Libertador','MUNICIPIO'),
	(21, 'Maturín','MUNICIPIO'),
	(21, 'Piar','MUNICIPIO'),
	(21, 'Punceres','MUNICIPIO'),
	(21, 'Santa Bárbara','MUNICIPIO'),
	(21, 'Sotillo','MUNICIPIO'),
	(21, 'Uracoa','MUNICIPIO'),
	(22, 'Antolín del Campo','MUNICIPIO'),
	(22, 'Arismendi','MUNICIPIO'),
	(22, 'García','MUNICIPIO'),
	(22, 'Gómez','MUNICIPIO'),
	(22, 'Maneiro','MUNICIPIO'),
	(22, 'Marcano','MUNICIPIO'),
	(22, 'Mariño','MUNICIPIO'),
	(22, 'Península de Macanao','MUNICIPIO'),
	(22, 'Tubores','MUNICIPIO'),
	(22, 'Villalba','MUNICIPIO'),
	(22, 'Díaz','MUNICIPIO'),
	(23, 'Agua Blanca','MUNICIPIO'),
	(23, 'Araure','MUNICIPIO'),
	(23, 'Esteller','MUNICIPIO'),
	(23, 'Guanare','MUNICIPIO'),
	(23, 'Guanarito','MUNICIPIO'),
	(23, 'Monseñor José Vicente de Unda','MUNICIPIO'),
	(23, 'Ospino','MUNICIPIO'),
	(23, 'Páez','MUNICIPIO'),
	(23, 'Papelón','MUNICIPIO'),
	(23, 'San Genaro de Boconoíto','MUNICIPIO'),
	(23, 'San Rafael de Onoto','MUNICIPIO'),
	(23, 'Santa Rosalía','MUNICIPIO'),
	(23, 'Sucre','MUNICIPIO'),
	(23, 'Turén','MUNICIPIO'),
	(24, 'Andrés Eloy Blanco','MUNICIPIO'),
	(24, 'Andrés Mata','MUNICIPIO'),
	(24, 'Arismendi','MUNICIPIO'),
	(24, 'Benítez','MUNICIPIO'),
	(24, 'Bermúdez','MUNICIPIO'),
	(24, 'Bolívar','MUNICIPIO'),
	(24, 'Cajigal','MUNICIPIO'),
	(24, 'Cruz Salmerón Acosta','MUNICIPIO'),
	(24, 'Libertador','MUNICIPIO'),
	(24, 'Mariño','MUNICIPIO'),
	(24, 'Mejía','MUNICIPIO'),
	(24, 'Montes','MUNICIPIO'),
	(24, 'Ribero','MUNICIPIO'),
	(24, 'Sucre','MUNICIPIO'),
	(24, 'Valdéz','MUNICIPIO'),
	(25, 'Andrés Bello','MUNICIPIO'),
	(25, 'Antonio Rómulo Costa','MUNICIPIO'),
	(25, 'Ayacucho','MUNICIPIO'),
	(25, 'Bolívar','MUNICIPIO'),
	(25, 'Cárdenas','MUNICIPIO'),
	(25, 'Córdoba','MUNICIPIO'),
	(25, 'Fernández Feo','MUNICIPIO'),
	(25, 'Francisco de Miranda','MUNICIPIO'),
	(25, 'García de Hevia','MUNICIPIO'),
	(25, 'Guásimos','MUNICIPIO'),
	(25, 'Independencia','MUNICIPIO'),
	(25, 'Jáuregui','MUNICIPIO'),
	(25, 'José María Vargas','MUNICIPIO'),
	(25, 'Junín','MUNICIPIO'),
	(25, 'Libertad','MUNICIPIO'),
	(25, 'Libertador','MUNICIPIO'),
	(25, 'Lobatera','MUNICIPIO'),
	(25, 'Michelena','MUNICIPIO'),
	(25, 'Panamericano','MUNICIPIO'),
	(25, 'Pedro María Ureña','MUNICIPIO'),
	(25, 'Rafael Urdaneta','MUNICIPIO'),
	(25, 'Samuel Darío Maldonado','MUNICIPIO'),
	(25, 'San Cristóbal','MUNICIPIO'),
	(25, 'Seboruco','MUNICIPIO'),
	(25, 'Simón Rodríguez','MUNICIPIO'),
	(25, 'Sucre','MUNICIPIO'),
	(25, 'Torbes','MUNICIPIO'),
	(25, 'Uribante','MUNICIPIO'),
	(25, 'San Judas Tadeo','MUNICIPIO'),
	(26, 'Andrés Bello','MUNICIPIO'),
	(26, 'Boconó','MUNICIPIO'),
	(26, 'Bolívar','MUNICIPIO'),
	(26, 'Candelaria','MUNICIPIO'),
	(26, 'Carache','MUNICIPIO'),
	(26, 'Escuque','MUNICIPIO'),
	(26, 'José Felipe Márquez Cañizalez','MUNICIPIO'),
	(26, 'Juan Vicente Campos Elías','MUNICIPIO'),
	(26, 'La Ceiba','MUNICIPIO'),
	(26, 'Miranda','MUNICIPIO'),
	(26, 'Monte Carmelo','MUNICIPIO'),
	(26, 'Motatán','MUNICIPIO'),
	(26, 'Pampán','MUNICIPIO'),
	(26, 'Pampanito','MUNICIPIO'),
	(26, 'Rafael Rangel','MUNICIPIO'),
	(26, 'San Rafael de Carvajal','MUNICIPIO'),
	(26, 'Sucre','MUNICIPIO'),
	(26, 'Trujillo','MUNICIPIO'),
	(26, 'Urdaneta','MUNICIPIO'),
	(26, 'Valera','MUNICIPIO'),
	(27, 'Vargas','MUNICIPIO'),
	(28, 'Arístides Bastidas','MUNICIPIO'),
	(28, 'Bolívar','MUNICIPIO'),
	(28, 'Bruzual','MUNICIPIO'),
	(28, 'Cocorote','MUNICIPIO'),
	(28, 'Independencia','MUNICIPIO'),
	(28, 'José Antonio Páez','MUNICIPIO'),
	(28, 'La Trinidad','MUNICIPIO'),
	(28, 'Manuel Monge','MUNICIPIO'),
	(28, 'Nirgua','MUNICIPIO'),
	(28, 'Peña','MUNICIPIO'),
	(28, 'San Felipe','MUNICIPIO'),
	(28, 'Sucre','MUNICIPIO'),
	(28, 'Urachiche','MUNICIPIO'),
	(28, 'José Joaquín Veroes','MUNICIPIO'),
	(29, 'Almirante Padilla','MUNICIPIO'),
	(29, 'Baralt','MUNICIPIO'),
	(29, 'Cabimas','MUNICIPIO'),
	(29, 'Catatumbo','MUNICIPIO'),
	(29, 'Colón','MUNICIPIO'),
	(29, 'Francisco Javier Pulgar','MUNICIPIO'),
	(29, 'Páez','MUNICIPIO'),
	(29, 'Jesús Enrique Losada','MUNICIPIO'),
	(29, 'Jesús María Semprún','MUNICIPIO'),
	(29, 'La Cañada de Urdaneta','MUNICIPIO'),
	(29, 'Lagunillas','MUNICIPIO'),
	(29, 'Machiques de Perijá','MUNICIPIO'),
	(29, 'Mara','MUNICIPIO'),
	(29, 'Maracaibo','MUNICIPIO'),
	(29, 'Miranda','MUNICIPIO'),
	(29, 'Rosario de Perijá','MUNICIPIO'),
	(29, 'San Francisco','MUNICIPIO'),
	(29, 'Santa Rita','MUNICIPIO'),
	(29, 'Simón Bolívar','MUNICIPIO'),
	(29, 'Sucre','MUNICIPIO'),
	(29, 'Valmore Rodríguez','MUNICIPIO'),	
	(30, 'Libertador','MUNICIPIO');	
	
INSERT INTO Lugar (lugar_l_cod, l_nombre, l_tipo) VALUES
	(31, 'Alto Orinoco','PARROQUIA'),
	(31, 'Huachamacare Acanaña','PARROQUIA'),
	(31, 'Marawaka Toky Shamanaña','PARROQUIA'),
	(31, 'Mavaka Mavaka','PARROQUIA'),
	(31, 'Sierra Parima Parimabé','PARROQUIA'),

	(32, 'Ucata Laja Lisa','PARROQUIA'),
	(32, 'Yapacana Macuruco','PARROQUIA'),
	(32, 'Caname Guarinuma','PARROQUIA'),
	(32, 'San Fernando de Atabapo','PARROQUIA'),

	(33, 'Fernando Girón Tovar','PARROQUIA'),
	(33, 'Luis Alberto Gómez','PARROQUIA'),
	(33, 'Pahueña Limón de Parhueña','PARROQUIA'),
	(33, 'Platanillal Platanillal','PARROQUIA'),

	(34, 'Samariapo','PARROQUIA'),
	(34, 'Sipapo','PARROQUIA'),
	(34, 'Munduapo','PARROQUIA'),
	(34, 'Guayapo','PARROQUIA'),
	(34, 'Isla Ratón','PARROQUIA'),

	(35, 'Alto Ventuari','PARROQUIA'),
	(35, 'Medio Ventuari','PARROQUIA'),
	(35, 'Bajo Ventuari','PARROQUIA'),
	(35, 'San Juan de Manapiare','PARROQUIA'),

	(36, 'Maroa','PARROQUIA'),
	(36, 'Victorino','PARROQUIA'),
	(36, 'Comunidad','PARROQUIA'),

	(37, 'Casiquiare','PARROQUIA'),
	(37, 'Cocuy','PARROQUIA'),
	(37, 'San Carlos de Río Negro','PARROQUIA'),
	(37, 'Solano','PARROQUIA'),

	(38, 'Anaco','PARROQUIA'),
	(38, 'San Joaquín','PARROQUIA'),
	(38, 'Buena Vista','PARROQUIA'),

	(39, 'Cachipo','PARROQUIA'),
	(39, 'Aragua de Barcelona','PARROQUIA'),

	(40, 'Clarines','PARROQUIA'),
	(40, 'Guanape','PARROQUIA'),
	(40, 'Sabana de Uchire','PARROQUIA'),

	(41, 'Lechería','PARROQUIA'),
	(41, 'El Morro','PARROQUIA'),

	(42, 'Puerto Píritu','PARROQUIA'),
	(42, 'San Miguel','PARROQUIA'),
	(42, 'Sucre','PARROQUIA'),

	(43, 'Valle de Guanape','PARROQUIA'),
	(43, 'Santa Bárbara','PARROQUIA'),

	(44, 'El Chaparro','PARROQUIA'),
	(44, 'Tomás Alfaro','PARROQUIA'),
	(44, 'Calatrava','PARROQUIA'),

	(45, 'Guanta','PARROQUIA'),
	(45, 'Chorrerón','PARROQUIA'),

	(46, 'Mamo','PARROQUIA'),
	(46, 'Soledad','PARROQUIA'),

	(47, 'Mapire','PARROQUIA'),
	(47, 'Piar','PARROQUIA'),
	(47, 'Santa Clara','PARROQUIA'),
	(47, 'San Diego de Cabrutica','PARROQUIA'),
	(47, 'Uverito','PARROQUIA'),
	(47, 'Zuata','PARROQUIA'),

	(48,'Puerto La Cruz','PARROQUIA'),
	(48,'Pozuelos','PARROQUIA'),

	(49, 'Onoto','PARROQUIA'),
	(49, 'San Pablo','PARROQUIA'),

	(50, 'San Mateo','PARROQUIA'),
	(50, 'El Carito','PARROQUIA'),
	(50, 'Santa Inés','PARROQUIA'),
	(50, 'La Romereña','PARROQUIA'),

	(51, 'Atapirire','PARROQUIA'),
	(51, 'Boca del Pao','PARROQUIA'),
	(51, 'El Pao','PARROQUIA'),
	(51, 'Pariaguán','PARROQUIA'),

	(52, 'Cantaura','PARROQUIA'),
	(52, 'Libertador','PARROQUIA'),
	(52, 'Santa Rosa','PARROQUIA'),
	(52, 'Urica','PARROQUIA'),

	(53, 'Píritu','PARROQUIA'),
	(53, 'San Francisco','PARROQUIA'),

	(54, 'San José de Guanipa','PARROQUIA'),

	(55, 'Boca de Uchire','PARROQUIA'),
	(55, 'Boca de Chávez','PARROQUIA'),

	(56, 'Pueblo Nuevo','PARROQUIA'),
	(56, 'Santa Ana','PARROQUIA'),

	(57, 'Bergantín','PARROQUIA'),
	(57, 'Caigua','PARROQUIA'),
	(57, 'El Carmen','PARROQUIA'),
	(57, 'El Pilar','PARROQUIA'),
	(57, 'Naricual','PARROQUIA'),
	(57, 'San Crsitóbal','PARROQUIA'),

	(58, 'Edmundo Barrios','PARROQUIA'),
	(58, 'Miguel Otero Silva','PARROQUIA'),


	(59, 'Achaguas','PARROQUIA'),
	(59, 'Apurito','PARROQUIA'),
	(59, 'El Yagual','PARROQUIA'),
	(59, 'Guachara','PARROQUIA'),
	(59, 'Mucuritas','PARROQUIA'),
	(59, 'Queseras del medio','PARROQUIA'),

	(60, 'Biruaca','PARROQUIA'),

	(61, 'Bruzual','PARROQUIA'),
	(61, 'Mantecal','PARROQUIA'),
	(61, 'Quintero','PARROQUIA'),
	(61, 'Rincón Hondo','PARROQUIA'),
	(61, 'San Vicente','PARROQUIA'),

	(62, 'Guasdualito','PARROQUIA'),
	(62, 'Aramendi','PARROQUIA'),
	(62, 'El Amparo','PARROQUIA'),
	(62, 'San Camilo','PARROQUIA'),
	(62, 'Urdaneta','PARROQUIA'),

	(63, 'San Juan de Payara','PARROQUIA'),
	(63, 'Codazzi','PARROQUIA'),
	(63, 'Cunaviche','PARROQUIA'),

	(64, 'Elorza','PARROQUIA'),
	(64, 'La Trinidad','PARROQUIA'),

	(65, 'San Fernando','PARROQUIA'),
	(65, 'El Recreo','PARROQUIA'),
	(65, 'Peñalver','PARROQUIA'),
	(65, 'San Rafael de Atamaica','PARROQUIA'),

	(66, 'Pedro José Ovalles','PARROQUIA'),
	(66, 'Joaquín Crespo','PARROQUIA'),
	(66, 'José Casanova Godoy','PARROQUIA'),
	(66, 'Madre María de San José','PARROQUIA'),
	(66, 'Andrés Eloy Blanco','PARROQUIA'),
	(66, 'Los Tacarigua','PARROQUIA'),
	(66, 'Las Delicias','PARROQUIA'),
	(66,'Choroní','PARROQUIA'),

	(67, 'Bolívar','PARROQUIA'),

	(68, 'Camatagua','PARROQUIA'),
	(68, 'Carmen de Cura','PARROQUIA'),

	(69, 'Santa Rita','PARROQUIA'),
	(69, 'Francisco de Miranda','PARROQUIA'),
	(69, 'Moseñor Feliciano González','PARROQUIA'),

	(70, 'Santa Cruz','PARROQUIA'),

	(71, 'José Félix Ribas','PARROQUIA'),
	(71, 'Castor Nieves Ríos','PARROQUIA'),
	(71, 'Las Guacamayas','PARROQUIA'),
	(71, 'Pao de Zárate','PARROQUIA'),
	(71, 'Zuata','PARROQUIA'),

	(72, 'José Rafael Revenga','PARROQUIA'),
	(72, 'El Consejo','PARROQUIA'),

	(73, 'Palo Negro','PARROQUIA'),
	(73, 'San Martín de Porres','PARROQUIA'),

	(74, 'Ocumare de la Costa','PARROQUIA'),

	(75, 'San Casimiro','PARROQUIA'),
	(75, 'Güiripa','PARROQUIA'),
	(75, 'Ollas de Caramacate','PARROQUIA'),
	(75, 'Valle Morín','PARROQUIA'),

	(76, 'El Limón','PARROQUIA'),
	(76, 'Caña de Azúcar','PARROQUIA'),

	(77, 'San Sebastían','PARROQUIA'),

	(78, 'Turmero','PARROQUIA'),
	(78, 'Arevalo Aponte','PARROQUIA'),
	(78, 'Chuao','PARROQUIA'),
	(78, 'Samán de Güere','PARROQUIA'),
	(78, 'Alfredo Pacheco Miranda','PARROQUIA'),

	(79, 'Santos Michelena','PARROQUIA'),
	(79, 'Tiara','PARROQUIA'),

	(80, 'Cagua','PARROQUIA'),
	(80, 'Bella Vista','PARROQUIA'),

	(81, 'Tovar','PARROQUIA'),

	(82, 'Urdaneta','PARROQUIA'),
	(82, 'Las Peñitas','PARROQUIA'),
	(82, 'San Francisco de Cara','PARROQUIA'),
	(82, 'Taguay','PARROQUIA'),

	(83, 'Zamora','PARROQUIA'),
	(83, 'Magdaleno','PARROQUIA'),
	(83, 'San Francisco de Asís','PARROQUIA'),
	(83, 'Valles de Tucutunemo','PARROQUIA'),
	(83, 'Augusto Mijares','PARROQUIA'),

	(84, 'Sabaneta','PARROQUIA'),
	(84, 'Juan Antonio Rodríguez Domínguez','PARROQUIA'),

	(85, 'El Cantón','PARROQUIA'),
	(85, 'Santa Cruz de Guacas','PARROQUIA'),
	(85, 'Puerto Vivas','PARROQUIA'),

	(86, 'Ticoporo','PARROQUIA'),
	(86, 'Nicolás Pulido','PARROQUIA'),
	(86, 'Andrés Bello','PARROQUIA'),

	(87, 'Arismendi','PARROQUIA'),
	(87, 'Guadarrama','PARROQUIA'),
	(87, 'La Unión','PARROQUIA'),
	(87, 'San Antonio','PARROQUIA'),

	(88, 'Barinas','PARROQUIA'),
	(88, 'Alberto Arvelo Larriva','PARROQUIA'),
	(88, 'San Silvestre','PARROQUIA'),
	(88, 'Santa Inés','PARROQUIA'),
	(88, 'Santa Lucía','PARROQUIA'),
	(88, 'Torumos','PARROQUIA'),
	(88, 'El Carmen','PARROQUIA'),
	(88, 'Rómulo Betancourt','PARROQUIA'),
	(88, 'Corazón de Jesús','PARROQUIA'),
	(88, 'Ramón Ignacio Méndez','PARROQUIA'),
	(88, 'Alto Barinas','PARROQUIA'),
	(88, 'Manuel Palacio Fajardo','PARROQUIA'),
	(88, 'Juan Antonio Rodríguez Domínguez','PARROQUIA'),
	(88, 'Dominga Ortiz de Páez','PARROQUIA'),

	(89, 'Barinitas','PARROQUIA'),
	(89, 'Altamira de Cáceres','PARROQUIA'),
	(89, 'Calderas','PARROQUIA'),

	(90, 'Barrancas','PARROQUIA'),
	(90, 'El Socorro','PARROQUIA'),
	(90, 'Mazparrito','PARROQUIA'),

	(91, 'Santa Bárbara','PARROQUIA'),
	(91, 'Pedro Briceño Méndez','PARROQUIA'),
	(91, 'Ramón Ignacio Méndez','PARROQUIA'),
	(91, 'José Ignacio del Pumar','PARROQUIA'),

	(92, 'Obispos','PARROQUIA'),
	(92, 'Guasimitos','PARROQUIA'),
	(92, 'El Real','PARROQUIA'),
	(92, 'La Luz','PARROQUIA'),

	(93, 'Ciudad Bolívia','PARROQUIA'),
	(93, 'José Ignacio Briceño','PARROQUIA'),
	(93, 'José Félix Ribas','PARROQUIA'),
	(93, 'Páez','PARROQUIA'),

	(94, 'Libertad','PARROQUIA'),
	(94, 'Dolores','PARROQUIA'),
	(94, 'Santa Rosa','PARROQUIA'),
	(94, 'Palacio Fajardo','PARROQUIA'),
	(94, 'Simón Rodríguez','PARROQUIA'),

	(95, 'Ciudad de Nutrias','PARROQUIA'),
	(95, 'El Regalo','PARROQUIA'),
	(95, 'Puerto Nutrias','PARROQUIA'),
	(95, 'Santa Catalina','PARROQUIA'),
	(95, 'Simón Bolívar','PARROQUIA'),

	(96, 'Cachamay','PARROQUIA'),
	(96, 'Chirica','PARROQUIA'),
	(96, 'Dalla Costa','PARROQUIA'),
	(96, 'Once de Abril','PARROQUIA'),
	(96, 'Simón Bolívar','PARROQUIA'),
	(96, 'Unare','PARROQUIA'),
	(96, 'Universidad','PARROQUIA'),
	(96, 'Vista al Sol','PARROQUIA'),
	(96, 'Pozo Verde','PARROQUIA'),
	(96, 'Yocoima','PARROQUIA'),
	(96, '5 de Julio','PARROQUIA'),

	(97, 'Cedeño','PARROQUIA'),
	(97, 'Altagracia','PARROQUIA'),
	(97, 'Ascensión Farreras','PARROQUIA'),
	(97, 'Guaniamo','PARROQUIA'),
	(97, 'La Urbana','PARROQUIA'),
	(97, 'Pijiguaos','PARROQUIA'),

	(98, 'El Callao','PARROQUIA'),

	(99, 'Gran Sabana','PARROQUIA'),
	(99, 'Ikabarú','PARROQUIA'),

	(100, 'Catedral','PARROQUIA'),
	(100, 'Zea','PARROQUIA'),
	(100, 'Orinoco','PARROQUIA'),
	(100, 'José Antonio Páez','PARROQUIA'),
	(100, 'Marhuanta','PARROQUIA'),
	(100, 'Agua Salada','PARROQUIA'),
	(100, 'Vista Hermosa','PARROQUIA'),
	(100, 'La Sabanita','PARROQUIA'),
	(100, 'Panapana','PARROQUIA'),

	(101, 'Andrés Eloy Blanco','PARROQUIA'),
	(101, 'Upata','PARROQUIA'),
	(101, 'Pedro Cova','PARROQUIA'),

	(102, 'Raúl Leoni','PARROQUIA'),
	(102, 'Barceloneta','PARROQUIA'),
	(102, 'Santa Bárbara','PARROQUIA'),
	(102, 'San Francisco','PARROQUIA'),

	(103, 'Roscio','PARROQUIA'),
	(103, 'Salóm','PARROQUIA'),

	(104, 'Sifontes','PARROQUIA'),
	(104, 'Dalla Costa','PARROQUIA'),
	(104, 'San Isidro','PARROQUIA'),

	(105, 'Sucre','PARROQUIA'),
	(105, 'Aripao','PARROQUIA'),
	(105, 'Guarataro','PARROQUIA'),
	(105, 'Las Majadas','PARROQUIA'),
	(105, 'Moitaco','PARROQUIA'),

	(106, 'Padre Pedro Chien','PARROQUIA'),
	(106, 'Río Grande','PARROQUIA'),

	(107, 'Canoabo','PARROQUIA'),
	(107, 'Simón Bolívar','PARROQUIA'),

	(108, 'Güigüe','PARROQUIA'),
	(108, 'Carabobo','PARROQUIA'),
	(108, 'Tacarigua','PARROQUIA'),

	(109, 'Mariara','PARROQUIA'),
	(109, 'Aguas Calientes','PARROQUIA'),

	(110, 'Ciudad Alianza','PARROQUIA'),
	(110, 'Guacara','PARROQUIA'),
	(110, 'Yagua','PARROQUIA'),

	(111, 'Morón','PARROQUIA'),
	(111, 'Yagua','PARROQUIA'),

	(112, 'Tocuyito','PARROQUIA'),
	(112, 'Independencia','PARROQUIA'),
		
	(113, 'Los Guayos','PARROQUIA'),

	(114, 'Miranda','PARROQUIA'),

	(115, 'Montalbán','PARROQUIA'),

	(116, 'Naguanagua','PARROQUIA'),


	(117, 'Bartolomé Salóm','PARROQUIA'),
	(117, 'Democracia','PARROQUIA'),
	(117, 'Fraternidad','PARROQUIA'),
	(117, 'Goaigoaza','PARROQUIA'),
	(117, 'Juan José Flores','PARROQUIA'),
	(117, 'Unión','PARROQUIA'),
	(117, 'Borburata','PARROQUIA'),
	(117, 'Patanemo','PARROQUIA'),

	(118, 'San Diego','PARROQUIA'),

	(119, 'San Joaquín','PARROQUIA'),

	(120, 'Candelaria','PARROQUIA'),
	(120, 'Catedral','PARROQUIA'),
	(120, 'El Socorro','PARROQUIA'),
	(120, 'Miguel Peña','PARROQUIA'),
	(120, 'Rafael Urdaneta','PARROQUIA'),
	(120, 'San Blas','PARROQUIA'),
	(120, 'San José','PARROQUIA'),
	(120, 'Santa Rosa','PARROQUIA'),
	(120, 'Negro Primero','PARROQUIA'),

	(121, 'Cojedes','PARROQUIA'),
	(121, 'Juan de Mata Suárez','PARROQUIA'),

	(122, 'Tinaquillo','PARROQUIA'),

	(123, 'El Baúl','PARROQUIA'),
	(123, 'Sucre','PARROQUIA'),

	(124, 'La Aguadita','PARROQUIA'),
	(124, 'Macapo','PARROQUIA'),


	(125, 'El Pao','PARROQUIA'),

	(126, 'El Amparo','PARROQUIA'),
	(126, 'Libertad de Cojedes','PARROQUIA'),

	(127, 'Rómulo Gallegos','PARROQUIA'),

	(128, 'San Carlos de Austria','PARROQUIA'),
	(128, 'Juan Ángel Bravo','PARROQUIA'),
	(128, 'Manuel Manrique','PARROQUIA'),

	(129, 'General en Jefe José Laurencio Silva','PARROQUIA'),

	(130, 'Curiapo','PARROQUIA'),
	(130, 'Almirante Luis Brión','PARROQUIA'),
	(130, 'Francisco Aniceto Lugo','PARROQUIA'),
	(130, 'Manuel Renaud','PARROQUIA'),
	(130, 'Padre Barral','PARROQUIA'),
	(130, 'Santos de Abelgas','PARROQUIA'),

	(131, 'Imataca','PARROQUIA'),
	(131, 'Juan Bautista Arismendi','PARROQUIA'),
	(131, 'Manuel Piar','PARROQUIA'),
	(131, 'Rómulo Gallegos','PARROQUIA'),

	(132, 'Pedernales','PARROQUIA'),
	(132, 'Luis Beltrán Prieto Figueroa','PARROQUIA'),

	(133, 'San José','PARROQUIA'),
	(133, 'José Vidal Marcano','PARROQUIA'),
	(133, 'Juan Millán','PARROQUIA'),
	(133, 'Leonardo Ruíz Pineda','PARROQUIA'),
	(133, 'Mariscal Antonio José de Sucre','PARROQUIA'),
	(133, 'Monseñor Argimiro García','PARROQUIA'),
	(133, 'San Rafael (Delta Amacuro)','PARROQUIA'),
	(133, 'Virgen del Valle','PARROQUIA'),

	(134, 'Capadare','PARROQUIA'),
	(134, 'La Pastora','PARROQUIA'),
	(134, 'Libertador','PARROQUIA'),
	(134, 'San Juan de los Cayos','PARROQUIA'),

	(135, 'Aracua','PARROQUIA'),
	(135, 'La Peña','PARROQUIA'),
	(135, 'San Luis','PARROQUIA'),

	(136, 'Bariro','PARROQUIA'),
	(136, 'Borojó','PARROQUIA'),
	(136, 'Capatárida','PARROQUIA'),
	(136, 'Guajiro','PARROQUIA'),
	(136, 'Seque','PARROQUIA'),
	(136, 'Zazárida','PARROQUIA'),
	(136, 'Valle de Eroa','PARROQUIA'),

	(137, 'Cacique Manaure','PARROQUIA'),

	(138, 'Norte','PARROQUIA'),
	(138, 'Carirubana','PARROQUIA'),
	(138, 'Santa Ana','PARROQUIA'),
	(138, 'Urbana Punta Cardón','PARROQUIA'),

	(139, 'La Vela de Coro','PARROQUIA'),
	(139, 'Acurigua','PARROQUIA'),
	(139, 'Guaibacoa','PARROQUIA'),
	(139, 'Las Calderas','PARROQUIA'),
	(139, 'Macoruca','PARROQUIA'),

	(140, 'Dabajuro','PARROQUIA'),

	(141, 'Agua Clara','PARROQUIA'),
	(141, 'Avaria','PARROQUIA'),
	(141, 'Pedregal','PARROQUIA'),
	(141, 'Piedra Grande','PARROQUIA'),
	(141, 'Purureche','PARROQUIA'),

	(142, 'Adaure','PARROQUIA'),
	(142, 'Adícora','PARROQUIA'),
	(142, 'Baraived','PARROQUIA'),
	(142, 'Buena Vista','PARROQUIA'),
	(142, 'Jadacaquiva','PARROQUIA'),
	(142, 'El Vínculo','PARROQUIA'),
	(142, 'El Hato','PARROQUIA'),
	(142, 'Moruy','PARROQUIA'),
	(142, 'Pueblo Nuevo','PARROQUIA'),

	(143, 'Agua Larga','PARROQUIA'),
	(143, 'Churuguara','PARROQUIA'),
	(143, 'El Paují','PARROQUIA'),
	(143, 'Independencia','PARROQUIA'),
	(143, 'Mapararí','PARROQUIA'),

	(144, 'Agua Linda','PARROQUIA'),
	(144, 'Araurima','PARROQUIA'),
	(144, 'Jacura','PARROQUIA'),

	(145, 'Tucacas','PARROQUIA'),
	(145, 'Boca de Aroa','PARROQUIA'),

	(146, 'Los Taques','PARROQUIA'),
	(146, 'Judibana','PARROQUIA'),

	(147, 'Mene de Mauroa','PARROQUIA'),
	(147, 'San Félix','PARROQUIA'),
	(147, 'Casigua','PARROQUIA'),

	(148, 'Guzmán Guillermo','PARROQUIA'),
	(148, 'Mitare','PARROQUIA'),
	(148, 'Río Seco','PARROQUIA'),
	(148, 'Sabaneta','PARROQUIA'),
	(148, 'San Antonio','PARROQUIA'),
	(148, 'San Gabriel','PARROQUIA'),
	(148, 'Santa Ana','PARROQUIA'),

	(149, 'Boca del Tocuyo','PARROQUIA'),
	(149, 'Chichiriviche','PARROQUIA'),
	(149, 'Tocuyo de la Costa','PARROQUIA'),

	(150, 'Palmasola','PARROQUIA'),

	(151, 'Cabure','PARROQUIA'),
	(151, 'Colina','PARROQUIA'),
	(151, 'Curimagua','PARROQUIA'),

	(152, 'San José de la Costa','PARROQUIA'),
	(152, 'Píritu','PARROQUIA'),

	(153, 'San Francisco','PARROQUIA'),

	(154, 'Sucre','PARROQUIA'),
	(154, 'Pecaya','PARROQUIA'),

	(155, 'Tocópero','PARROQUIA'),

	(156, 'El Charal','PARROQUIA'),
	(156, 'Las Vegas del Tuy','PARROQUIA'),
	(156, 'Santa Cruz de Bucaral','PARROQUIA'),

	(157, 'Bruzual','PARROQUIA'),
	(157, 'Urumaco','PARROQUIA'),

	(158, 'Puerto Cumarebo','PARROQUIA'),
	(158, 'La Ciénaga','PARROQUIA'),
	(158, 'La Soledad','PARROQUIA'),
	(158, 'Pueblo Cumarebo','PARROQUIA'),
	(158, 'Zazárida','PARROQUIA'),

	(159, 'Camaguán','PARROQUIA'),
	(159, 'Puerto Miranda','PARROQUIA'),
	(159, 'Uverito','PARROQUIA'),

	(160, 'Chaguaramas','PARROQUIA'),

	(161, 'El Socorro','PARROQUIA'),

	(162, 'Tucupido','PARROQUIA'),
	(162, 'San Rafael de Laya','PARROQUIA'),

	(163, 'Altagracia de Orituco','PARROQUIA'),
	(163, 'San Rafael de Orituco','PARROQUIA'),
	(163, 'San Francisco Javier de Lezama','PARROQUIA'),
	(163, 'Paso Real de Macaira','PARROQUIA'),
	(163, 'Carlos Soublette','PARROQUIA'),
	(163, 'San Francisco de Macaira','PARROQUIA'),
	(163, 'Libertad de Orituco','PARROQUIA'),

	(164, 'Cantagallo','PARROQUIA'),
	(164, 'San Juan de los Morros','PARROQUIA'),
	(164, 'Parapara','PARROQUIA'),

	(165, 'El Sombrero','PARROQUIA'),
	(165, 'Sosa','PARROQUIA'),


	(166, 'Las Mercedes','PARROQUIA'),
	(166, 'Cabruta','PARROQUIA'),
	(166, 'Santa Rita de Manapire','PARROQUIA'),

	(167, 'Valle de la Pascua','PARROQUIA'),
	(167, 'Espino','PARROQUIA'),

	(168, 'San José de Unare','PARROQUIA'),
	(168, 'Zaraza','PARROQUIA'),

	(169, 'San José de Tiznados','PARROQUIA'),
	(169, 'San Francisco de Tiznados','PARROQUIA'),
	(169, 'San Lorenzo de Tiznados','PARROQUIA'),
	(169, 'Ortiz','PARROQUIA'),

	(170, 'Guayabal','PARROQUIA'),
	(170, 'Cazorla','PARROQUIA'),

	(171, 'San José de Guaribe','PARROQUIA'),

	(172, 'Santa María de Ipire','PARROQUIA'),
	(172, 'Altamira','PARROQUIA'),

	(173, 'El Calvario','PARROQUIA'),
	(173, 'El Rastro','PARROQUIA'),
	(173, 'Guardatinajas','PARROQUIA'),
	(173, 'Capital Urbana Calabozo','PARROQUIA'),

	(174, 'Quebrada Honda de Guache','PARROQUIA'),
	(174, 'Pío Tamayo','PARROQUIA'),
	(174, 'Yacambú','PARROQUIA'),

	(175, 'Fréitez','PARROQUIA'),
	(175, 'José María Blanco','PARROQUIA'),

	(176, 'Catedral','PARROQUIA'),
	(176, 'Concepción','PARROQUIA'),
	(176, 'El Cují','PARROQUIA'),
	(176, 'Juan de Villegas','PARROQUIA'),
	(176, 'Santa Rosa','PARROQUIA'),
	(176, 'Tamaca','PARROQUIA'),
	(176, 'Unión','PARROQUIA'),
	(176, 'Aguedo Felipe Alvarado','PARROQUIA'),
	(176, 'Buena Vista','PARROQUIA'),
	(176, 'Juárez','PARROQUIA'),

	(177, 'Juan Bautista Rodríguez','PARROQUIA'),
	(177, 'Cuara','PARROQUIA'),
	(177, 'Diego de Lozada','PARROQUIA'),
	(177, 'Paraíso de San José','PARROQUIA'),
	(177, 'San Miguel','PARROQUIA'),
	(177, 'Tintorero','PARROQUIA'),
	(177, 'José Bernardo Dorante','PARROQUIA'),
	(177, 'Coronel Mariano Peraza ','PARROQUIA'),


	(178, 'Bolívar','PARROQUIA'),
	(178, 'Anzoátegui','PARROQUIA'),
	(178, 'Guarico','PARROQUIA'),
	(178, 'Hilario Luna y Luna','PARROQUIA'),
	(178, 'Humocaro Alto','PARROQUIA'),
	(178, 'Humocaro Bajo','PARROQUIA'),
	(178, 'La Candelaria','PARROQUIA'),
	(178, 'Morán','PARROQUIA'),

	(179, 'Cabudare','PARROQUIA'),
	(179, 'José Gregorio Bastidas','PARROQUIA'),
	(179, 'Agua Viva','PARROQUIA'),

	(180,'Sarare','PARROQUIA'),
	(180,'Buría','PARROQUIA'),
	(180,'Gustavo Vegas León','PARROQUIA'),

	(181,'Trinidad Samuel','PARROQUIA'),
	(181,'Antonio Díaz','PARROQUIA'),
	(181,'Camacaro','PARROQUIA'),
	(181,'Castañeda','PARROQUIA'),
	(181,'Cecilio Zubillaga','PARROQUIA'),
	(181,'Chiquinquirá','PARROQUIA'),
	(181,'El Blanco','PARROQUIA'),
	(181,'Espinoza de los Monteros','PARROQUIA'),
	(181,'Lara','PARROQUIA'),
	(181,'Las Mercedes','PARROQUIA'),
	(181,'Manuel Morillo','PARROQUIA'),
	(181,'Montaña Verde','PARROQUIA'),
	(181,'Montes de Oca','PARROQUIA'),
	(181,'Torres','PARROQUIA'),
	(181,'Heriberto Arroyo','PARROQUIA'),
	(181,'Reyes Vargas','PARROQUIA'),
	(181,'Altagracia','PARROQUIA'),

	(182, 'Siquisique','PARROQUIA'),
	(182, 'Moroturo','PARROQUIA'),
	(182, 'San Miguel','PARROQUIA'),
	(182, 'Xaguas','PARROQUIA'),

	(183, 'Presidente Betancourt','PARROQUIA'),
	(183, 'Presidente Páez','PARROQUIA'),
	(183, 'Presidente Rómulo Gallegos','PARROQUIA'),
	(183, 'Gabriel Picón González','PARROQUIA'),
	(183, 'Héctor Amable Mora','PARROQUIA'),
	(183, 'José Nucete Sardi','PARROQUIA'),
	(183, 'Pulido Méndez','PARROQUIA'),

	(184, 'La Azulita','PARROQUIA'),

	(185, 'Santa Cruz de Mora','PARROQUIA'),
	(185, 'Mesa Bolívar','PARROQUIA'),
	(185, 'Mesa de Las Palmas','PARROQUIA'),

	(186, 'Aricagua','PARROQUIA'),
	(186, 'San Antonio','PARROQUIA'),

	(187, 'Canagua','PARROQUIA'),
	(187, 'Capurí','PARROQUIA'),
	(187, 'Chacantá','PARROQUIA'),
	(187, 'El Molino','PARROQUIA'),
	(187, 'Guaimaral','PARROQUIA'),
	(187, 'Mucutuy','PARROQUIA'),
	(187, 'Mucuchachí','PARROQUIA'),

	(188, 'Fernández Peña','PARROQUIA'),
	(188, 'Matriz','PARROQUIA'),
	(188, 'Montalbán','PARROQUIA'),
	(188, 'Acequias','PARROQUIA'),
	(188, 'Jají','PARROQUIA'),
	(188, 'La Mesa','PARROQUIA'),
	(188, 'San José del Sur','PARROQUIA'),

	(189, 'Tucaní','PARROQUIA'),
	(189, 'Florencio Ramírez','PARROQUIA'),

	(190, 'Santo Domingo','PARROQUIA'),
	(190, 'Las Piedras','PARROQUIA'),

	(191, 'Guaraque','PARROQUIA'),
	(191, 'Mesa de Quintero','PARROQUIA'),
	(191, 'Río Negro','PARROQUIA'),

	(192, 'Arapuey','PARROQUIA'),
	(192, 'Palmira','PARROQUIA'),

	(193, 'San Cristóbal de Torondoy','PARROQUIA'),
	(193, 'Torondoy','PARROQUIA'),

	(194, 'Antonio Spinetti Dini','PARROQUIA'),
	(194, 'Arias','PARROQUIA'),
	(194, 'Caracciolo Parra Pérez','PARROQUIA'),
	(194, 'Domingo Peña','PARROQUIA'),
	(194, 'El Llano','PARROQUIA'),
	(194, 'Gonzalo Picón Febres','PARROQUIA'),
	(194, 'Jacinto Plaza','PARROQUIA'),
	(194, 'Juan Rodríguez Suárez','PARROQUIA'),
	(194, 'Lasso de la Vega','PARROQUIA'),
	(194, 'Mariano Picón Salas','PARROQUIA'),
	(194, 'Milla','PARROQUIA'),
	(194, 'Osuna Rodríguez','PARROQUIA'),
	(194, 'Sagrario','PARROQUIA'),
	(194, 'El Morro','PARROQUIA'),
	(194, 'Los Nevados','PARROQUIA'),

	(195, 'Andrés Eloy Blanco','PARROQUIA'),
	(195, 'La Venta','PARROQUIA'),
	(195, 'Piñango','PARROQUIA'),
	(195, 'Timotes','PARROQUIA'),

	(196, 'Eloy Paredes','PARROQUIA'),
	(196, 'San Rafael de Alcázar','PARROQUIA'),
	(196, 'Santa Elena de Arenales','PARROQUIA'),

	(197, 'Santa María de Caparo','PARROQUIA'),

	(198, 'Pueblo Llano','PARROQUIA'),

	(199, 'Cacute','PARROQUIA'),
	(199, 'La Toma','PARROQUIA'),
	(199, 'Mucuchíes','PARROQUIA'),
	(199, 'Mucurubá','PARROQUIA'),
	(199, 'San Rafael','PARROQUIA'),


	(200, 'Gerónimo Maldonado','PARROQUIA'),
	(200, 'Bailadores','PARROQUIA'),

	(201, 'Tabay','PARROQUIA'),

	(202, 'Chiguará','PARROQUIA'),
	(202, 'Estánquez','PARROQUIA'),
	(202, 'Lagunillas','PARROQUIA'),
	(202, 'La Trampa','PARROQUIA'),
	(202, 'Pueblo Nuevo del Sur','PARROQUIA'),
	(202, 'San Juan','PARROQUIA'),

	(203, 'El Amparo','PARROQUIA'),
	(203, 'El Llano','PARROQUIA'),
	(203, 'San Francisco','PARROQUIA'),
	(203, 'Tovar','PARROQUIA'),

	(204, 'Independencia','PARROQUIA'),
	(204, 'María de la Concepción Palacios Blanco','PARROQUIA'),
	(204, 'Nueva Bolivia','PARROQUIA'),
	(204, 'Santa Apolonia','PARROQUIA'),

	(205, 'Caño El Tigre','PARROQUIA'),
	(205, 'Zea','PARROQUIA'),

	(206, 'Aragüita','PARROQUIA'),
	(206, 'Arévalo González','PARROQUIA'),
	(206, 'Capaya','PARROQUIA'),
	(206, 'Caucagua','PARROQUIA'),
	(206, 'Panaquire','PARROQUIA'),
	(206, 'Ribas','PARROQUIA'),
	(206, 'El Café','PARROQUIA'),
	(206, 'Marizapa','PARROQUIA'),

	(207, 'Cumbo','PARROQUIA'),
	(207, 'San José de Barlovento','PARROQUIA'),

	(208, 'El Cafetal','PARROQUIA'),
	(208, 'Las Minas','PARROQUIA'),

	(209, 'Higuerote','PARROQUIA'),
	(209, 'Curiepe','PARROQUIA'),
	(209, 'Tacarigua de Brión','PARROQUIA'),

	(210, 'Mamporal','PARROQUIA'),

	(211, 'Carrizal','PARROQUIA'),

	(212, 'Chacao','PARROQUIA'),

	(213, 'Charallave','PARROQUIA'),
	(213, 'Las Brisas','PARROQUIA'),

	(214, 'El Hatillo','PARROQUIA'),

	(215, 'Altagracia de la Montaña','PARROQUIA'),
	(215, 'Cecilio Acosta','PARROQUIA'),
	(215, 'Los Teques','PARROQUIA'),
	(215, 'El Jarillo','PARROQUIA'),
	(215, 'San Pedro','PARROQUIA'),
	(215, 'Tácata','PARROQUIA'),
	(215, 'Paracotos','PARROQUIA'),

	(216, 'Cartanal','PARROQUIA'),
	(216, 'Santa Teresa del Tuy','PARROQUIA'),

	(217, 'La Democracia','PARROQUIA'),
	(217, 'Ocumare del Tuy','PARROQUIA'),
	(217, 'Santa Bárbara','PARROQUIA'),

	(218, 'San Antonio de los Altos','PARROQUIA'),

	(219, 'Río Chico','PARROQUIA'),
	(219, 'El Guapo','PARROQUIA'),
	(219, 'Tacarigua de la Laguna','PARROQUIA'),
	(219, 'Paparo','PARROQUIA'),
	(219, 'San Fernando del Guapo','PARROQUIA'),

	(220, 'Santa Lucía del Tuy','PARROQUIA'),

	(221, 'Cúpira','PARROQUIA'),
	(221, 'Machurucuto','PARROQUIA'),

	(222, 'Guarenas','PARROQUIA'),

	(223, 'San Antonio de Yare','PARROQUIA'),
	(223, 'San Francisco de Yare','PARROQUIA'),

	(224, 'Leoncio Martínez','PARROQUIA'),
	(224, 'Petare','PARROQUIA'),
	(224, 'Caucagüita','PARROQUIA'),
	(224, 'Filas de Mariche','PARROQUIA'),
	(224, 'La Dolorita','PARROQUIA'),

	(225, 'Cúa','PARROQUIA'),
	(225, 'Nueva Cúa','PARROQUIA'),

	(226, 'Guatire','PARROQUIA'),
	(226, 'Bolívar','PARROQUIA'),

	(227, 'San Antonio de Maturín','PARROQUIA'),
	(227, 'San Francisco de Maturín','PARROQUIA'),

	(228, 'Aguasay','PARROQUIA'),

	(229, 'Caripito','PARROQUIA'),

	(230, 'El Guácharo','PARROQUIA'),
	(230, 'La Guanota','PARROQUIA'),
	(230, 'Sabana de Piedra','PARROQUIA'),
	(230, 'San Agustín','PARROQUIA'),
	(230, 'Teresen','PARROQUIA'),
	(230, 'Caripe','PARROQUIA'),


	(231, 'Areo','PARROQUIA'),
	(231, 'Capital Cedeño','PARROQUIA'),
	(231, 'San Félix de Cantalicio','PARROQUIA'),
	(231, 'Viento Fresco','PARROQUIA'),

	(232, 'El Tejero','PARROQUIA'),
	(232, 'Punta de Mata','PARROQUIA'),

	(233, 'Chaguaramas','PARROQUIA'),
	(233, 'Las Alhuacas','PARROQUIA'),
	(233, 'Tabasca','PARROQUIA'),
	(233, 'Temblador','PARROQUIA'),


	(234, 'Alto de los Godos','PARROQUIA'),
	(234, 'Boquerón','PARROQUIA'),
	(234, 'Las Cocuizas','PARROQUIA'),
	(234, 'La Cruz','PARROQUIA'),
	(234, 'San Simón','PARROQUIA'),
	(234, 'El Corozo','PARROQUIA'),
	(234, 'El Furrial','PARROQUIA'),
	(234, 'Jusepín','PARROQUIA'),
	(234, 'La Pica','PARROQUIA'),
	(234, 'San Vicente','PARROQUIA'),

	(235, 'Aparicio','PARROQUIA'),
	(235, 'Aragua de Maturín','PARROQUIA'),
	(235, 'Chaguamal','PARROQUIA'),
	(235, 'El Pinto','PARROQUIA'),
	(235, 'Guanaguana','PARROQUIA'),
	(235, 'La Toscana','PARROQUIA'),
	(235, 'Taguaya','PARROQUIA'),

	(236, 'Cachipo','PARROQUIA'),
	(236, 'Quiriquire','PARROQUIA'),

	(237, 'Santa Bárbara','PARROQUIA'),
	(237, 'Morón','PARROQUIA'),

	(238, 'Barrancas','PARROQUIA'),
	(238, 'Los Barrancos de Fajardo','PARROQUIA'),

	(239, 'Uracoa','PARROQUIA'),
	
	(240, 'Antolín del Campo','PARROQUIA'),

	(241, 'Arismendi','PARROQUIA'),

	(242, 'García','PARROQUIA'),
	(242, 'Francisco Fajardo','PARROQUIA'),

	(243, 'Bolívar','PARROQUIA'),
	(243, 'Guevara','PARROQUIA'),
	(243, 'Matasiete','PARROQUIA'),
	(243, 'Santa Ana','PARROQUIA'),
	(243, 'Sucre','PARROQUIA'),

	(244, 'Aguirre','PARROQUIA'),
	(244, 'Maneiro','PARROQUIA'),

	(245, 'Adrián','PARROQUIA'),
	(245, 'Juan Griego','PARROQUIA'),

	(246, 'Porlamar','PARROQUIA'),

	(247, 'San Francisco de Macanao','PARROQUIA'),
	(247, 'Boca de Río','PARROQUIA'),

	(248, 'Tubores','PARROQUIA'),
	(248, 'Los Baleales','PARROQUIA'),

	(249, 'Vicente Fuentes','PARROQUIA'),
	(249, 'Villalba','PARROQUIA'),

	(250, 'San Juan Bautista','PARROQUIA'),
	(250, 'Zabala','PARROQUIA'),

	(251, 'Ahua Blanca','PARROQUIA'),

	(252, 'Capital Araure','PARROQUIA'),
	(252, 'Río Acarigua','PARROQUIA'),

	(253, 'Capital Esteller','PARROQUIA'),
	(253, 'Uveral','PARROQUIA'),

	(254, 'Guanare','PARROQUIA'),
	(254, 'Córdoba','PARROQUIA'),
	(254, 'San José de la Montaña','PARROQUIA'),
	(254, 'San Juan de Guanaguanare','PARROQUIA'),
	(254, 'Virgen de la Coromoto','PARROQUIA'),

	(255, 'Guanarito','PARROQUIA'),
	(255, 'Trinidad de la Capilla','PARROQUIA'),
	(255, 'Divina Pastora','PARROQUIA'),

	(256, 'Monseñor José Vicente de Unda','PARROQUIA'),
	(256, 'Peña Blanca','PARROQUIA'),

	(257, 'Capital Ospino','PARROQUIA'),
	(257, 'Aparición','PARROQUIA'),
	(257, 'La Estación','PARROQUIA'),

	(258, 'Páez','PARROQUIA'),
	(258, 'Payara','PARROQUIA'),
	(258, 'Pimpinela','PARROQUIA'),
	(258, 'Ramón Peraza','PARROQUIA'),

	(259, 'Papelón','PARROQUIA'),
	(259, 'Caño Delgadito','PARROQUIA'),

	(260, 'San Genaro de Boconoito','PARROQUIA'),
	(260, 'Antolín Tovar','PARROQUIA'),

	(261, 'San Rafael de Onoto','PARROQUIA'),
	(261, 'Santa Fe','PARROQUIA'),
	(261, 'Thermo Morles','PARROQUIA'),

	(262, 'Santa Rosalía','PARROQUIA'),
	(262, 'Florida','PARROQUIA'),

	(263, 'Sucre','PARROQUIA'),
	(263, 'Concepción','PARROQUIA'),
	(263, 'San Rafael de Palo Alzado','PARROQUIA'),
	(263, 'Uvencio Antonio Velásquez','PARROQUIA'),
	(263, 'San José de Saguaz','PARROQUIA'),
	(263, 'Villa Rosa','PARROQUIA'),

	(264, 'Turén','PARROQUIA'),
	(264, 'Canelones','PARROQUIA'),
	(264, 'Santa Cruz','PARROQUIA'),
	(264, 'San Isidro Labrador','PARROQUIA'),

	(265, 'Mariño','PARROQUIA'),
	(265, 'Rómulo Gallegos','PARROQUIA'),

	(266, 'San José de Aerocuar','PARROQUIA'),
	(266, 'Tavera Acosta','PARROQUIA'),

	(267, 'Río Caribe','PARROQUIA'),
	(267, 'Antonio José de Sucre','PARROQUIA'),
	(267, 'El Morro de Puerto Santo','PARROQUIA'),
	(267, 'Puerto Santo','PARROQUIA'),
	(267, 'San Juan de las Galdonas','PARROQUIA'),

	(268, 'El Pilar','PARROQUIA'),
	(268, 'El Rincón','PARROQUIA'),
	(268, 'General Francisco Antonio Váquez','PARROQUIA'),
	(268, 'Guaraúnos','PARROQUIA'),
	(268, 'Tunapuicito','PARROQUIA'),
	(268, 'Unión','PARROQUIA'),

	(269, 'Santa Catalina','PARROQUIA'),
	(269, 'Santa Rosa','PARROQUIA'),
	(269, 'Santa Teresa','PARROQUIA'),
	(269, 'Bolívar','PARROQUIA'),
	(269, 'Maracapana','PARROQUIA'),

	(270, 'Mariguitar','PARROQUIA'),

	(271, 'Libertad','PARROQUIA'),
	(271, 'El Paujil','PARROQUIA'),
	(271, 'Yaguaraparo','PARROQUIA'),

	(272, 'Cruz Salmerón Acosta','PARROQUIA'),
	(272, 'Chacopata','PARROQUIA'),
	(272, 'Manicuare','PARROQUIA'),

	(273, 'Tunapuy','PARROQUIA'),
	(273, 'Campo Elías','PARROQUIA'),

	(274, 'Irapa','PARROQUIA'),
	(274, 'Campo Claro','PARROQUIA'),
	(274, 'Maraval','PARROQUIA'),
	(274, 'San Antonio de Irapa','PARROQUIA'),
	(274, 'Soro','PARROQUIA'),

	(275, 'Mejía','PARROQUIA'),

	(276, 'Cumanacoa','PARROQUIA'),
	(276, 'Arenas','PARROQUIA'),
	(276, 'Aricagua','PARROQUIA'),
	(276, 'Cogollar','PARROQUIA'),
	(276, 'San Fernando','PARROQUIA'),
	(276, 'San Lorenzo','PARROQUIA'),

	(277, 'Villa Frontado (Muelle de Cariaco)','PARROQUIA'),
	(277, 'Catuaro','PARROQUIA'),
	(277, 'Rendón','PARROQUIA'),
	(277, 'San Cruz','PARROQUIA'),
	(277, 'Santa María','PARROQUIA'),

	(278, 'Altagracia','PARROQUIA'),
	(278, 'Santa Inés','PARROQUIA'),
	(278, 'Valentín Valiente','PARROQUIA'),
	(278, 'Ayacucho','PARROQUIA'),
	(278, 'San Juan','PARROQUIA'),
	(278, 'Raúl Leoni','PARROQUIA'),
	(278, 'Gran Mariscal','PARROQUIA'),

	(279, 'Cristóbal Colón','PARROQUIA'),
	(279, 'Bideau','PARROQUIA'),
	(279, 'Punta de Piedras','PARROQUIA'),
	(279, 'Güiria','PARROQUIA'),

	(280, 'Andrés Bello','PARROQUIA'),

	(281, 'Antonio Rómulo Costa','PARROQUIA'),

	(282, 'Ayacucho','PARROQUIA'),
	(282, 'Rivas Berti','PARROQUIA'),
	(282, 'San Pedro del Río','PARROQUIA'),

	(283, 'Bolívar','PARROQUIA'),
	(283, 'Palotal','PARROQUIA'),
	(283, 'General Juan Vicente Gómez','PARROQUIA'),
	(283, 'Isaías Medina Angarita','PARROQUIA'),

	(284, 'Táriba','PARROQUIA'),
	(284, 'Amenodoro Ángel Lamus','PARROQUIA'),
	(284, 'La Florida','PARROQUIA'),

	(285, 'Córdoba','PARROQUIA'),

	(286, 'Fernández Feo','PARROQUIA'),
	(286, 'Alberto Adriani','PARROQUIA'),
	(286, 'Santo Domingo','PARROQUIA'),

	(287, 'Francisco de Miranda','PARROQUIA'),

	(288, 'García de Hevia','PARROQUIA'),
	(288, 'Boca de Grita','PARROQUIA'),
	(288, 'José Antonio Páez','PARROQUIA'),

	(289, 'Guásimos','PARROQUIA'),

	(290, 'Independencia','PARROQUIA'),
	(290, 'Juan Germán Roscio','PARROQUIA'),
	(290, 'Román Cárdenas','PARROQUIA'),

	(291, 'Jáuregui','PARROQUIA'),
	(291, 'Emilio Constantino Guerrero','PARROQUIA'),
	(291, 'Monseñor Miguel Antonio Salas','PARROQUIA'),

	(292, 'José María Vargas','PARROQUIA'),

	(293, 'Junín','PARROQUIA'),
	(293, 'La Petrólea','PARROQUIA'),
	(293, 'Quinimarí','PARROQUIA'),
	(293, 'Bramón','PARROQUIA'),

	(294, 'Libertad','PARROQUIA'),
	(294, 'Cipriano Castro','PARROQUIA'),
	(294, 'Manuel Felipe Rugeles','PARROQUIA'),

	(295, 'Libertador','PARROQUIA'),
	(295, 'Doradas','PARROQUIA'),
	(295, 'Emeterio Ochoa','PARROQUIA'),
	(295, 'San Joaquín de Navay','PARROQUIA'),

	(296, 'Lobatera','PARROQUIA'),
	(296, 'Constitución','PARROQUIA'),

	(297, 'Michelena','PARROQUIA'),

	(298, 'Panamericano','PARROQUIA'),
	(298, 'La Palmita','PARROQUIA'),

	(299, 'Pedro María Ureña','PARROQUIA'),
	(299, 'Nueva Arcadia','PARROQUIA'),

	(300, 'Delicias','PARROQUIA'),

	(301, 'Samuel Darío Maldonado','PARROQUIA'),
	(301, 'Boconó','PARROQUIA'),
	(301, 'Hernández','PARROQUIA'),

	(302, 'La Concordia','PARROQUIA'),
	(302, 'San Juan Bautista','PARROQUIA'),
	(302, 'Pedro María Morantes','PARROQUIA'),
	(302, 'San Sebastián','PARROQUIA'),
	(302, 'Dr. Francisco Romero Lobo','PARROQUIA'),

	(303, 'Seboruco','PARROQUIA'),

	(304, 'Simón Rodríguez','PARROQUIA'),

	(305, 'Sucre','PARROQUIA'),
	(305, 'Eleazar López Contreras','PARROQUIA'),
	(305, 'San Pablo','PARROQUIA'),

	(306, 'Torbes','PARROQUIA'),

	(307, 'Uribante','PARROQUIA'),
	(307, 'Cárdenas','PARROQUIA'),
	(307, 'Juan Pablo Peñalosa','PARROQUIA'),
	(307, 'Potosí','PARROQUIA'),

	(308, 'San Judas Tadeo','PARROQUIA'),

	(309, 'Araguaney','PARROQUIA'),
	(309, 'El Jaguito','PARROQUIA'),
	(309, 'La Esperanza','PARROQUIA'),
	(309, 'Santa Isabel','PARROQUIA'),

	(310, 'Boconó','PARROQUIA'),
	(310, 'El Carmen','PARROQUIA'),
	(310, 'Mosquey','PARROQUIA'),
	(310, 'Ayacucho','PARROQUIA'),
	(310, 'Burbusay','PARROQUIA'),
	(310, 'General Ribas','PARROQUIA'),
	(310, 'Guaramacal','PARROQUIA'),
	(310, 'Vega de Guaramacal','PARROQUIA'),
	(310, 'Monseñor Jáuregui','PARROQUIA'),
	(310, 'Rafael Rangel','PARROQUIA'),
	(310, 'San Miguel','PARROQUIA'),
	(310, 'San José','PARROQUIA'),

	(311, 'Sabana Grande','PARROQUIA'),
	(311, 'Cheregüé','PARROQUIA'),
	(311, 'Granados','PARROQUIA'),

	(312, 'Arnoldo Gabaldón','PARROQUIA'),
	(312, 'Bolivia','PARROQUIA'),
	(312, 'Carrillo','PARROQUIA'),
	(312, 'Cegarra','PARROQUIA'),
	(312, 'Chejendé','PARROQUIA'),
	(312, 'Manuel Salvador Ulloa','PARROQUIA'),
	(312, 'San José','PARROQUIA'),

	(313, 'Carache','PARROQUIA'),
	(313, 'La Concepción','PARROQUIA'),
	(313, 'Cuicas','PARROQUIA'),
	(313, 'Panamericana','PARROQUIA'),
	(313, 'Santa Cruz','PARROQUIA'),

	(314, 'Escuque','PARROQUIA'),
	(314, 'La Unión','PARROQUIA'),
	(314, 'Santa Rita','PARROQUIA'),
	(314, 'Sabana Libre','PARROQUIA'),

	(315, 'El Socorro','PARROQUIA'),
	(315, 'Los Caprichos','PARROQUIA'),
	(315, 'Antonio José de Sucre','PARROQUIA'),

	(316, 'Campo Elías','PARROQUIA'),
	(316, 'Arnoldo Gabaldón','PARROQUIA'),

	(317, 'Santa Apolonia','PARROQUIA'),
	(317, 'El Progreso','PARROQUIA'),
	(317, 'La Ceiba','PARROQUIA'),
	(317, 'Tres de Febrero','PARROQUIA'),

	(318, 'El Dividive','PARROQUIA'),
	(318, 'Agua Santa','PARROQUIA'),
	(318, 'Agua Caliente','PARROQUIA'),
	(318, 'El Cenizo','PARROQUIA'),
	(318, 'Valerita','PARROQUIA'),

	(319, 'Monte Carmelo','PARROQUIA'),
	(319, 'Buena Vista','PARROQUIA'),
	(319, 'Santa María del Horcón','PARROQUIA'),

	(320, 'Motatán','PARROQUIA'),
	(320, 'El Baño','PARROQUIA'),
	(320, 'Jalisco','PARROQUIA'),

	(321, 'Pampán','PARROQUIA'),
	(321, 'Flor de Patria','PARROQUIA'),
	(321, 'La Paz','PARROQUIA'),
	(321, 'Santa Ana','PARROQUIA'),

	(322, 'Pampanito','PARROQUIA'),
	(322, 'La Concepción','PARROQUIA'),
	(322, 'Pampanito II','PARROQUIA'),

	(323, 'Betijoque','PARROQUIA'),
	(323, 'José Gregorio Hernández','PARROQUIA'),
	(323, 'La Pueblita','PARROQUIA'),
	(323, 'Los Cedros','PARROQUIA'),

	(324, 'Carvajal','PARROQUIA'),
	(324, 'Campo Alegre','PARROQUIA'),
	(324, 'Antonio Nicolás Briceño','PARROQUIA'),
	(324, 'José Leonardo Suárez','PARROQUIA'),

	(325, 'Sabana de Mendoza','PARROQUIA'),
	(325, 'Junín','PARROQUIA'),
	(325, 'Valmore Rodríguez','PARROQUIA'),
	(325, 'El Paraíso','PARROQUIA'),

	(326, 'Andrés Linares','PARROQUIA'),
	(326, 'Chiquinquirá','PARROQUIA'),
	(326, 'Cristóbal Mendoza','PARROQUIA'),
	(326, 'Cruz Carrillo','PARROQUIA'),
	(326, 'Matriz','PARROQUIA'),
	(326, 'Monseñor Carrillo','PARROQUIA'),
	(326, 'Tres Esquinas','PARROQUIA'),

	(327, 'Cabimbú','PARROQUIA'),
	(327, 'Jajó','PARROQUIA'),
	(327, 'La Mesa de Esnujaque','PARROQUIA'),
	(327, 'Santiago','PARROQUIA'),
	(327, 'Tuñame','PARROQUIA'),
	(327, 'La Quebrada','PARROQUIA'),

	(328, 'Juan Ignacio Montilla','PARROQUIA'),
	(328, 'La Beatriz','PARROQUIA'),
	(328, 'La Puerta','PARROQUIA'),
	(328, 'Mendoza del Valle de Momboy','PARROQUIA'),
	(328, 'Mercedes Díaz','PARROQUIA'),
	(328, 'San Luis','PARROQUIA'),

	(329, 'Caraballeda','PARROQUIA'),
	(329, 'Carayaca','PARROQUIA'),
	(329, 'Carlos Soublette','PARROQUIA'),
	(329, 'Caruao Chuspa','PARROQUIA'),
	(329, 'Catia La Mar','PARROQUIA'),
	(329, 'El Junko','PARROQUIA'),
	(329, 'La Guaira','PARROQUIA'),
	(329, 'Macuto','PARROQUIA'),
	(329, 'Maiquetía','PARROQUIA'),
	(329, 'Naiguatá','PARROQUIA'),
	(329, 'Urimare','PARROQUIA'),

	(330, 'Arístides Bastidas','PARROQUIA'),

	(331, 'Bolívar','PARROQUIA'),

	(332, 'Chivacoa','PARROQUIA'),
	(332, 'Campo Elías','PARROQUIA'),

	(333, 'Cocorote','PARROQUIA'),

	(334, 'Independencia','PARROQUIA'),

	(335, 'José Antonio Páez','PARROQUIA'),

	(336, 'La Trinidad','PARROQUIA'),

	(337, 'Manuel Monge','PARROQUIA'),

	(338,'Nirgua','PARROQUIA'),
	(338, 'Salóm','PARROQUIA'),
	(338, 'Temerla','PARROQUIA'),

	(339, 'San Andrés','PARROQUIA'),
	(339, 'Yaritagua','PARROQUIA'),

	(340, 'San Javier','PARROQUIA'),
	(340, 'Albarico','PARROQUIA'),
	(340, 'San Felipe','PARROQUIA'),

	(341, 'Sucre','PARROQUIA'),

	(342, 'Urachiche','PARROQUIA'),

	(343, 'El Guayabo','PARROQUIA'),
	(343, 'Farriar','PARROQUIA'),

	(344, 'Isla de Toas','PARROQUIA'),
	(344, 'Monagas','PARROQUIA'),
	(344, 'San Fernando','PARROQUIA'),

	(345, 'San Timoteo','PARROQUIA'),
	(345, 'General Urdaneta','PARROQUIA'),
	(345, 'Libertador','PARROQUIA'),
	(345, 'Marcelino Briceño','PARROQUIA'),
	(345, 'Pueblo Nuevo','PARROQUIA'),
	(345, 'Manuel Guanipa Matos','PARROQUIA'),

	(346, 'Ambrosio','PARROQUIA'),
	(346, 'Carmen Herrera','PARROQUIA'),
	(346, 'La Rosa','PARROQUIA'),
	(346, 'Germán Ríos Linares','PARROQUIA'),
	(346, 'San Benito','PARROQUIA'),
	(346, 'Rómulo Betancourt','PARROQUIA'),
	(346, 'Jorge Hernández','PARROQUIA'),
	(346, 'Punta Gorda','PARROQUIA'),
	(346, 'Arístides Calvani','PARROQUIA'),

	(347, 'Encontrados','PARROQUIA'),
	(347, 'Udón Pérez','PARROQUIA'),

	(348, 'Moralito','PARROQUIA'),
	(348, 'San Carlos del Zulia','PARROQUIA'),
	(348, 'Santa Cruz del Zulia','PARROQUIA'),
	(348, 'Santa Bárbara','PARROQUIA'),
	(348, 'Urribarrí','PARROQUIA'),

	(349, 'Carlos Quevedo','PARROQUIA'),
	(349, 'Francisco Javier Pulgar','PARROQUIA'),
	(349, 'Simón Rodríguez','PARROQUIA'),
	(349, 'Guamo-Gavilanes','PARROQUIA'),

	(350, 'Sinamaica','PARROQUIA'),
	(350, 'Alta Guajira','PARROQUIA'),
	(350, 'Elías Sánchez Rubio','PARROQUIA'),
	(350, 'Guajira','PARROQUIA'),

	(351, 'La Concepción','PARROQUIA'),
	(351, 'San José','PARROQUIA'),
	(351, 'Mariano Parra León','PARROQUIA'),
	(351, 'José Ramón Yépez','PARROQUIA'),

	(352, 'Jesús María Semprún','PARROQUIA'),
	(352, 'Barí','PARROQUIA'),

	(353, 'Concepción','PARROQUIA'),
	(353, 'Andrés Bello','PARROQUIA'),
	(353, 'Chiquinquirá','PARROQUIA'),
	(353, 'El Carmelo','PARROQUIA'),
	(353, 'Potreritos','PARROQUIA'),

	(354, 'Libertad','PARROQUIA'),
	(354, 'Alonso de Ojeda','PARROQUIA'),
	(354, 'Venezuela','PARROQUIA'),
	(354, 'Eleazar López Contreras','PARROQUIA'),
	(354, 'Campo Lara','PARROQUIA'),

	(355, 'Bartolomé de las Casas','PARROQUIA'),
	(355, 'Libertad','PARROQUIA'),
	(355, 'Río Negro','PARROQUIA'),
	(355, 'San José de Perijá','PARROQUIA'),

	(356, 'San Rafael','PARROQUIA'),
	(356, 'La Sierrita','PARROQUIA'),
	(356, 'Las Parcelas','PARROQUIA'),
	(356, 'Luis de Vicente','PARROQUIA'),
	(356, 'Monseñor Marcos Sergio Godoy','PARROQUIA'),
	(356, 'Ricaurte','PARROQUIA'),
	(356, 'Tamare','PARROQUIA'),

	(357, 'Antonio Borjas Romero','PARROQUIA'),
	(357, 'Bolívar','PARROQUIA'),
	(357, 'Cacique Mara','PARROQUIA'),
	(357, 'Carracciolo Parra Pérez','PARROQUIA'),
	(357, 'Cecilio Acosta','PARROQUIA'),
	(357, 'Cristo de Aranza','PARROQUIA'),
	(357, 'Coquivacoa','PARROQUIA'),
	(357, 'Chiquinquirá','PARROQUIA'),
	(357, 'Francisco Eugenio Bustamante','PARROQUIA'),
	(357, 'Idelfonzo Vásquez','PARROQUIA'),
	(357, 'Juana de Ávila','PARROQUIA'),
	(357, 'Luis Hurtado Higuera','PARROQUIA'),
	(357, 'Manuel Dagnino','PARROQUIA'),
	(357, 'Olegario Villalobos','PARROQUIA'),
	(357, 'Raúl Leoni','PARROQUIA'),
	(357, 'Santa Lucía','PARROQUIA'),
	(357, 'Venancio Pulgar','PARROQUIA'),
	(357, 'San Isidro','PARROQUIA'),

	(358, 'Altagracia','PARROQUIA'),
	(358, 'Faría','PARROQUIA'),
	(358, 'Ana María Campos','PARROQUIA'),
	(358, 'San Antonio','PARROQUIA'),
	(358, 'San José','PARROQUIA'),

	(359, 'Donaldo García','PARROQUIA'),
	(359, 'El Rosario','PARROQUIA'),
	(359, 'Sixto Zambrano','PARROQUIA'),

	(360, 'San Francisco','PARROQUIA'),
	(360, 'El Bajo','PARROQUIA'),
	(360, 'Domitila Flores','PARROQUIA'),
	(360, 'Francisco Ochoa','PARROQUIA'),
	(360, 'Los Cortijos','PARROQUIA'),
	(360, 'Marcial Hernández','PARROQUIA'),
	(360, 'José Domingo Rus','PARROQUIA'),

	(361, 'Santa Rita','PARROQUIA'),
	(361, 'El Mene','PARROQUIA'),
	(361, 'Pedro Lucas Urribarrí','PARROQUIA'),
	(361, 'José Cenobio Urribarrí','PARROQUIA'),

	(362, 'Rafael Maria Baralt','PARROQUIA'),
	(362, 'Manuel Manrique','PARROQUIA'),
	(362, 'Rafael Urdaneta','PARROQUIA'),

	(363, 'Bobures','PARROQUIA'),
	(363, 'Gibraltar','PARROQUIA'),
	(363, 'Heras','PARROQUIA'),
	(363, 'Monseñor Arturo Álvarez','PARROQUIA'),
	(363, 'Rómulo Gallegos','PARROQUIA'),
	(363, 'El Batey','PARROQUIA'),

	(364, 'Rafael Urdaneta','PARROQUIA'),
	(364, 'La Victoria','PARROQUIA'),
	(364, 'Raúl Cuenca','PARROQUIA'),

	(365, 'Altagracia','PARROQUIA'),
	(365, 'Antímano','PARROQUIA'),
	(365, 'Caricuao','PARROQUIA'),
	(365, 'Catedral','PARROQUIA'),
	(365, 'Coche','PARROQUIA'),
	(365, 'El Junquito','PARROQUIA'),
	(365, 'El Paraíso','PARROQUIA'),
	(365, 'El Recreo','PARROQUIA'),
	(365, 'El Valle','PARROQUIA'),
	(365, 'La Candelaria','PARROQUIA'),
	(365, 'La Pastora','PARROQUIA'),
	(365, 'La Vega','PARROQUIA'),
	(365, 'Macarao','PARROQUIA'),
	(365, 'San Agustín','PARROQUIA'),
	(365, 'San Bernardino','PARROQUIA'),
	(365, 'San José','PARROQUIA'),
	(365, 'San Juan','PARROQUIA'),
	(365, 'San Pedro','PARROQUIA'),
	(365, 'Santa Rosalía','PARROQUIA'),
	(365, 'Santa Teresa','PARROQUIA'),
	(365, 'Sucre (Catia)','PARROQUIA'),
	(365, '23 de enero','PARROQUIA');	

INSERT INTO Lugar (l_nombre, l_tipo, Lugar_l_cod) VALUES
	('Brasil', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'America' LIMIT 1)),
	('Estados Unidos', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'America' LIMIT 1)),
	('Panama', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'America' LIMIT 1)),
	('Mexico', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'America' LIMIT 1)),
	('Italia', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1)),
	('Alemania', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1)),
	('España', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1)),
	('Portugal', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1)),
	('Francia', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1)),
	('Egipto', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	('Botsuana', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	('Sudafrica', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	('Marruecos', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	('Zimbabue', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	('China', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),
	('Japon', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),
	('Arabia Saudita', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),
	('Corea del Sur', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),
	('Rusia', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),
	('Australia', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Oceania' LIMIT 1)),
	('Nueva Zelanda', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Oceania' LIMIT 1)),
	('Fiyi', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Oceania' LIMIT 1)),
	('Tuvalu', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Oceania' LIMIT 1)),
	('Papua Nueva Guinea', 'PAIS', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Oceania' LIMIT 1));	

INSERT INTO Lugar (l_nombre, l_tipo, Lugar_l_cod) VALUES
	('Rio de Janeiro', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1)),
	('California', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
	('Panama', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Panama' AND l_tipo = 'PAIS' LIMIT 1)),
	('Jalisco', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1)),
	('Venecia', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1)),
	('Brandeburgo', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1)),
	('Alicante', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
	('Lisboa', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Portugal' LIMIT 1)),
	('Bretaña', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Francia' LIMIT 1)),
	('El Cairo', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Egipto' LIMIT 1)),
	('Kweneng', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Botsuana' LIMIT 1)),
	('Cabo Oriental', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Sudafrica' LIMIT 1)),
	('Casablanca-Settat', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Marruecos' LIMIT 1)),
	('Harare', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Zimbabue' LIMIT 1)),
	('Hubei', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1)),
	('Tokio', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
	('Riad', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Arabia Saudita' LIMIT 1)),
	('Seul', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Corea del Sur' LIMIT 1)),
	('San Petersburgo', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rusia' LIMIT 1)),
	('Nueva Gales del Sur', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1)),
	('Auckland', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Zelanda' LIMIT 1)),
	('Central', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Fiyi' LIMIT 1)),
	('Funafuti', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Tuvalu' LIMIT 1)),
	('Distrito Capital Nacional', 'EDO/PROVINCIA', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Papua Nueva Guinea' LIMIT 1));	
	
INSERT INTO Lugar (l_nombre, l_tipo, Lugar_l_cod) VALUES
	('Rio de Janeiro', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' LIMIT 1)),
	('Los Angeles', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'California' LIMIT 1)),
	('Ciudad de Panama', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Panama' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
	('Guadalajara', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Jalisco' LIMIT 1)),
	('Venecia', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venecia' LIMIT 1)),
	('Postdam', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brandeburgo' LIMIT 1)),
	('Alicante', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' LIMIT 1)),
	('Lisboa', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Lisboa' LIMIT 1)),
	('Rennes', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Bretaña' LIMIT 1)),
	('El Cairo', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Cairo' LIMIT 1)),
	('Molepolole', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Kweneng' LIMIT 1)),
	('Bhisho', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Cabo Oriental' LIMIT 1)),
	('Casablanca', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Casablanca-Settat' LIMIT 1)),
	('Harare', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Harare' LIMIT 1)),
	('Wuhan', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Hubei' LIMIT 1)),
	('Shinjuku', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Tokio' LIMIT 1)),
	('Riad', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Riad' LIMIT 1)),
	('Seul', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Seul' LIMIT 1)),
	('San Petersburgo', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Petersburgo' LIMIT 1)),
	('Sidney', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Gales del Sur' LIMIT 1)),
	('Auckland', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Auckland' LIMIT 1)),
	('Suva', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Central' LIMIT 1)),
	('Funafuti', 'CIUDAD', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Funafuti' LIMIT 1)),
	('Puerto Moresby', 'CIUDAD', (SELECT l1.l_cod FROM Lugar l1, Lugar l2 WHERE l1.l_nombre = 'Distrito Capital Nacional' AND l1.lugar_l_cod = l2.l_cod AND l2.l_nombre = 'Papua Nueva Guinea' LIMIT 1));

INSERT INTO Aerolinea (p_nombre, p_fecha_afiliacion, a_fecha_constitucion, lugar_l_cod) VALUES
	('American Airlines', '2025-11-17', '1926-04-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
	('United Airlines', '2025-02-16', '1926-04-06', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
	('ITA Airways', '2025-08-21', '2020-11-11', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1)),
	('Aeroitalia', '2025-05-02', '2002-08-01', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1)),
	('Aeromexico', '2025-07-28', '2002-06-02', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1)),
	('Volaris', '2025-08-31', '2002-10-28', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1)),
	('Conviasa', '2025-11-18', '2004-03-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Laser', '2025-05-08', '1993-03-11', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Iberia', '2025-07-07', '1927-06-28', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
	('Vueling Airlines', '2025-07-04', '2002-09-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
	('Flyadeal', '2025-10-02', '2002-05-24', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Arabia Saudita' LIMIT 1)),
	('Saudia', '2024-12-28', '2002-08-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Arabia Saudita' LIMIT 1)),
	('Japan Airlines', '2025-02-11', '2002-08-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
	('All Nippon Airways', '2025-10-22', '2002-06-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
	('Air China', '2025-06-02', '2002-08-24', (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1)),
	('Shenzhen Airlines', '2025-01-21', '2002-10-03', (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1)),
	('Qantas Airways', '2025-02-05', '2002-05-07', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1)),
	('Jetstar', '2025-05-08', '2002-08-17', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1)),
	('Red Wings Airlines', '2025-01-19', '2002-03-16', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rusia' LIMIT 1)),
	('S7 Airlines', '2025-10-13', '2002-05-02', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rusia' LIMIT 1));

-- Permisos de Gestión de Usuarios
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_usuario', 'usuario');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_usuario', 'usuario');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_usuario', 'usuario');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_usuarios', 'usuario');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('asignar_rol', 'usuario');

-- Permisos de Gestión de Roles y Permisos
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_rol', 'rol');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_rol', 'rol');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_rol', 'rol');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_roles', 'rol');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('gestionar_permisos', 'rol');

-- Permisos de Servicios (Aerolinea, Crucero, Transporte, Hotel)
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_aerolinea', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_aerolinea', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_aerolinea', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_aerolinea', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_vuelo', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_vuelo', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_vuelo', 'servicio');

INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_crucero', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_crucero', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_crucero', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_crucero', 'servicio');

INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_transporte', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_transporte', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_transporte', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_transporte', 'servicio');

INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_hotel', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_hotel', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_hotel', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_hotel', 'servicio');

INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_operador', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_operador', 'servicio');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_operador', 'servicio');

-- Permisos de Promociones
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_promocion', 'promocion');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_promocion', 'promocion');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('eliminar_promocion', 'promocion');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_promocion', 'promocion');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('activar_promocion', 'promocion');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('desactivar_promocion', 'promocion');

-- Permisos de Reservas
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_reserva', 'reserva');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_reserva', 'reserva');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('cancelar_reserva', 'reserva');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reserva', 'reserva');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('procesar_pago', 'reserva');

-- Permisos de Pagos y Facturación
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_pagos', 'pago');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('procesar_reembolso', 'pago');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('emitir_factura', 'pago');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_transacciones', 'pago');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('gestionar_metodos_pago', 'pago');

-- Permisos de Reportes
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reportes_ventas', 'reporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reportes_financieros', 'reporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reportes_clientes', 'reporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('exportar_reportes', 'reporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reportes_auditoría', 'reporte');

-- Permisos de Soporte y Reclamos
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('crear_reclamo', 'soporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_reclamo', 'soporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('resolver_reclamo', 'soporte');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_reclamo', 'soporte');

-- Permisos de Configuración
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('gestionar_tasa_cambio', 'config');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('gestionar_parametros', 'config');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_auditoria', 'config');

-- Permisos de Clientes
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_mi_perfil', 'cliente');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('editar_mi_perfil', 'cliente');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_mis_reservas', 'cliente');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_mis_millas', 'cliente');
INSERT INTO Permiso (pe_nombre, pe_tipo) VALUES ('ver_mis_pagos', 'cliente');

-- ============================================================================
-- FASE 2: INSERTAR 10 ROLES
-- ============================================================================

INSERT INTO Rol (ro_nombre) VALUES ('Cliente');                    -- ID: 1
INSERT INTO Rol (ro_nombre) VALUES ('Administrador');              -- ID: 2
INSERT INTO Rol (ro_nombre) VALUES ('Gerente de Ventas');          -- ID: 3
INSERT INTO Rol (ro_nombre) VALUES ('Gerente de Operaciones');     -- ID: 4
INSERT INTO Rol (ro_nombre) VALUES ('Empleado Atención Cliente');  -- ID: 5
INSERT INTO Rol (ro_nombre) VALUES ('Proveedor Aerolinea');        -- ID: 6
INSERT INTO Rol (ro_nombre) VALUES ('Proveedor Crucero');          -- ID: 7
INSERT INTO Rol (ro_nombre) VALUES ('Contador/Auditor');           -- ID: 8
INSERT INTO Rol (ro_nombre) VALUES ('Gestor de Contenido');        -- ID: 9
INSERT INTO Rol (ro_nombre) VALUES ('Proveedor Hotel');            -- ID: 10

-- CLIENTE (Permisos básicos para clientes finales)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod) 
SELECT 1, pe_cod FROM Permiso WHERE pe_nombre IN (
  'ver_mi_perfil',
  'editar_mi_perfil',
  'ver_mis_reservas',
  'ver_mis_millas',
  'ver_mis_pagos',
  'crear_reserva',
  'ver_promocion',
  'ver_aerolinea',
  'ver_crucero',
  'ver_transporte',
  'ver_hotel',
  'crear_reclamo',
  'ver_reclamo'
);

-- ADMINISTRADOR (Control total del sistema)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 2, pe_cod FROM Permiso; -- Todos los permisos

-- GERENTE DE VENTAS (Gestiona promociones y reportes de ventas)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 3, pe_cod FROM Permiso WHERE pe_nombre IN (
  'crear_promocion',
  'editar_promocion',
  'eliminar_promocion',
  'ver_promocion',
  'activar_promocion',
  'desactivar_promocion',
  'ver_reportes_ventas',
  'ver_reportes_clientes',
  'exportar_reportes',
  'ver_usuarios',
  'ver_aerolinea',
  'ver_crucero',
  'ver_transporte',
  'ver_hotel',
  'ver_reserva'
);

-- GERENTE DE OPERACIONES (Gestiona proveedores y servicios)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 4, pe_cod FROM Permiso WHERE pe_nombre IN (
  'crear_aerolinea',
  'editar_aerolinea',
  'eliminar_aerolinea',
  'ver_aerolinea',
  'crear_vuelo',
  'editar_vuelo',
  'eliminar_vuelo',
  'crear_crucero',
  'editar_crucero',
  'eliminar_crucero',
  'ver_crucero',
  'crear_transporte',
  'editar_transporte',
  'eliminar_transporte',
  'ver_transporte',
  'crear_hotel',
  'editar_hotel',
  'eliminar_hotel',
  'ver_hotel',
  'crear_operador',
  'editar_operador',
  'eliminar_operador',
  'ver_usuarios',
  'gestionar_tasa_cambio',
  'ver_reportes_clientes'
);

-- EMPLEADO ATENCIÓN AL CLIENTE (Gestiona reclamos y consultas)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 5, pe_cod FROM Permiso WHERE pe_nombre IN (
  'ver_usuarios',
  'crear_reclamo',
  'editar_reclamo',
  'resolver_reclamo',
  'ver_reclamo',
  'ver_reserva',
  'ver_aerolinea',
  'ver_crucero',
  'ver_transporte',
  'ver_hotel',
  'ver_pagos',
  'procesar_reembolso',
  'editar_reserva',
  'cancelar_reserva',
  'ver_mi_perfil'
);

-- PROVEEDOR AEROLINEA (Gestiona sus propios vuelos y promociones)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 6, pe_cod FROM Permiso WHERE pe_nombre IN (
  'editar_aerolinea',
  'ver_aerolinea',
  'crear_vuelo',
  'editar_vuelo',
  'eliminar_vuelo',
  'crear_promocion',
  'editar_promocion',
  'ver_promocion',
  'activar_promocion',
  'desactivar_promocion',
  'ver_mi_perfil',
  'editar_mi_perfil',
  'ver_reserva',
  'ver_pagos',
  'ver_usuarios'
);

-- PROVEEDOR CRUCERO (Gestiona cruceros y camarotes)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 7, pe_cod FROM Permiso WHERE pe_nombre IN (
  'editar_crucero',
  'ver_crucero',
  'crear_promocion',
  'editar_promocion',
  'ver_promocion',
  'activar_promocion',
  'desactivar_promocion',
  'ver_mi_perfil',
  'editar_mi_perfil',
  'ver_reserva',
  'ver_pagos',
  'ver_usuarios'
);

-- CONTADOR/AUDITOR (Acceso a información financiera y auditoría)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 8, pe_cod FROM Permiso WHERE pe_nombre IN (
  'ver_pagos',
  'ver_transacciones',
  'emitir_factura',
  'ver_reportes_financieros',
  'ver_reportes_ventas',
  'ver_reportes_auditoría',
  'exportar_reportes',
  'ver_usuarios',
  'ver_reserva',
  'ver_auditoria',
  'ver_mi_perfil'
);

-- GESTOR DE CONTENIDO (Gestiona promociones y paquetes turísticos)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 9, pe_cod FROM Permiso WHERE pe_nombre IN (
  'crear_promocion',
  'editar_promocion',
  'eliminar_promocion',
  'ver_promocion',
  'activar_promocion',
  'desactivar_promocion',
  'ver_aerolinea',
  'ver_crucero',
  'ver_transporte',
  'ver_hotel',
  'ver_reportes_ventas',
  'exportar_reportes',
  'ver_usuarios',
  'ver_mi_perfil'
);

-- PROVEEDOR HOTEL (Gestiona hoteles y reservas)
INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
SELECT 10, pe_cod FROM Permiso WHERE pe_nombre IN (
  'editar_hotel',
  'ver_hotel',
  'crear_promocion',
  'editar_promocion',
  'ver_promocion',
  'activar_promocion',
  'desactivar_promocion',
  'ver_mi_perfil',
  'editar_mi_perfil',
  'ver_reserva',
  'ver_pagos',
  'ver_usuarios'
);

INSERT INTO Cliente (c_ci, c_p_nombre, c_s_nombre, c_p_apellido, c_s_apellido, c_fecha_nacimiento, c_sexo, c_edo_civil, c_direccion, lugar_l_cod) VALUES
    -- AMAZONAS
	(15890123, 'Pedro', 'Antonio', 'Guarulla', 'Miji', '1982-05-12', 'M', 'CASADO', 'Av. Orinoco, Sector Centro', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Guayapo' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (21450987, 'Yarisma', NULL, 'Diaz', 'Gomez', '1995-09-23', 'F', 'SOLTERO', 'Barrio La Florida, Casa 12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Solano' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- ANZOATEGUI 
	(12567890, 'Jesus', 'Rafael', 'Marcano', 'Rojas', '1978-11-04', 'M', 'CASADO', 'Av. Costanera, Res. El Mar', (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Joaquín' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (24567123, 'Ana', 'Karina', 'Urbaneja', 'Patiño', '1998-02-15', 'F', 'SOLTERO', 'Urb. Nueva Barcelona, Calle 3', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Guanta' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- APURE
	(9876543, 'Ramon', 'Eduardo', 'Gallegos', 'Tovar', '1965-08-30', 'M', 'SOLTERO', 'Av. Carabobo, Sector Los Próceres', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Amparo' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (19876543, 'Maria', 'Nieves', 'Castillo', 'Bruzual', '1990-12-12', 'F', 'CASADO', 'Calle Comercio, Centro', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Elorza' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- ARAGUA
	(14560981, 'Miguel', 'Angel', 'Torres', 'Cabrera', '1980-04-18', 'M', 'CASADO', 'Av. Las Delicias, Torre A', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Joaquín Crespo' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (22345678, 'Daniela', 'Sofia', 'Mendez', 'Aranguren', '1996-07-07', 'F', 'SOLTERO', 'Urb. El Limón, Calle 5', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Camatagua' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- BARINAS
	(11234567, 'Hugo', 'Rafael', 'Chavez', 'Colmenares', '1975-07-28', 'M', 'CASADO', 'Av. 23 de Enero, Res. Sabana', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Ciudad de Nutrias' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (20987123, 'Linda', NULL, 'Barinas', 'Guerrero', '1993-03-21', 'F', 'SOLTERO', 'Urb. Alto Barinas, Vereda 2', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Santa Catalina' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- BOLIVAR
	(13456789, 'Francisco', 'Javier', 'Rangel', 'Gomez', '1979-10-10', 'M', 'CASADO', 'Paseo Orinoco, Casco Histórico', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Gran Sabana' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (23456789, 'Carmen', 'Elena', 'Sifontes', 'Piar', '1997-01-05', 'F', 'SOLTERO', 'Av. Táchira, Qta. Angostura', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Callao' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- CARABOBO
	(16789012, 'Luis', 'Enrique', 'Salas', 'Feo', '1984-06-14', 'M', 'CASADO', 'Av. Bolívar Norte, Res. Camoruco', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mariara' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (25678901, 'Patricia', 'Alejandra', 'Lacava', 'Betancourt', '1999-11-20', 'F', 'SOLTERO', 'Urb. Prebo, Calle 130', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Borburata' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- COJEDES
	(10987654, 'Ezequiel', NULL, 'Zamora', 'Lara', '1970-02-01', 'M', 'SOLTERO', 'Calle Sucre, Centro', (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Carlos de Austria' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (18765432, 'Juana', 'Bautista', 'Manrique', 'Silva', '1989-05-15', 'F', 'CASADO', 'Av. Universidad, Sector Los Samanes', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Manuel Manrique' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- DELTA AMACURO
	(14321098, 'Antonio', 'Jose', 'Diaz', 'Amacuro', '1981-08-09', 'M', 'SOLTERO', 'Calle Manamo, Frente al Malecón', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Imataca' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (21098765, 'Warao', NULL, 'Tucupita', 'Flores', '1994-04-03', 'F', 'CASADO', 'Sector Paloma, Carretera Nacional', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Pedernales' AND l_tipo = 'PARROQUIA' LIMIT 1)),

    -- FALCON 
	(12309876, 'Ali', 'Primera', 'Rossell', 'Manaure', '1977-10-31', 'M', 'CASADO', 'Calle Falcón, Barrio San Nicolás', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Urbana Punta Cardón' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (22123456, 'Coromoto', 'Josefina', 'Lugo', 'Petit', '1995-09-08', 'F', 'SOLTERO', 'Urb. Independencia, 2da Etapa', (SELECT l_cod FROM Lugar WHERE l_nombre = 'La Vela de Coro' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- GUARICO 
	(15678123, 'Juan', 'German', 'Roscio', 'Nievas', '1983-01-25', 'M', 'CASADO', 'Av. Bolívar, Edf. Los Morros', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Calvario' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (23987654, 'Gabriela', 'Maria', 'Chacin', 'Llano', '1998-06-12', 'F', 'SOLTERO', 'Urb. Rómulo Gallegos, Casa 4', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Altagracia de Orituco' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- LARA 
	(11987654, 'Jacinto', NULL, 'Lara', 'Tamayo', '1972-05-28', 'M', 'SOLTERO', 'Av. Lara con Leones', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Fréitez' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (20456789, 'Divina', 'Pastora', 'Yepez', 'Gil', '1992-01-14', 'F', 'CASADO', 'Pueblo de Santa Rosa, Calle Real', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Gustavo Vegas León' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- MERIDA
	(13210987, 'Tulio', 'Febres', 'Cordero', 'Picon', '1979-12-05', 'M', 'CASADO', 'Av. Las Américas, Res. El Rodeo', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Las Piedras' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (21876543, 'Nieve', 'Andina', 'Salas', 'Uzcategui', '1994-03-30', 'F', 'SOLTERO', 'Sector La Hechicera, Vía Principal', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Presidente Betancourt' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- MIRANDA
	(14987123, 'Henrique', NULL, 'Capriles', 'Radonski', '1982-07-11', 'M', 'SOLTERO', 'Av. Pedro Russo Ferrer, El Tambor', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Caucagua' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (24098123, 'Genesis', 'Carolina', 'Rodriguez', 'Petare', '1999-02-27', 'F', 'SOLTERO', 'Urb. La Macarena, Final Calle 2', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Carrizal' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- MONAGAS
	(12876543, 'Jose', 'Tadeo', 'Monagas', 'Burgos', '1976-11-15', 'M', 'CASADO', 'Av. Bella Vista, Las Cayenas', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Boquerón' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (22567891, 'Juana', 'Ramirez', 'La Avanzadora', 'Rojas', '1996-08-02', 'F', 'SOLTERO', 'Sector Los Godos, Calle 4', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Furrial' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- NUEVA ESPARTA
	(10543219, 'Santiago', NULL, 'Mariño', 'Guerra', '1968-09-08', 'M', 'SOLTERO', 'Calle La Unión, Casco Central', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Guevara' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (19654321, 'Virgen', 'Del Valle', 'Brito', 'Subero', '1991-05-04', 'F', 'CASADO', 'Av. 31 de Julio, Sector El Salado', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Matasiete' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- PORTUGUESA
	(13789456, 'Jose', 'Antonio', 'Paez', 'Herrera', '1980-06-13', 'M', 'CASADO', 'Carrera 5, Barrio Sucre', (SELECT l_cod FROM Lugar WHERE l_nombre = 'La Estación' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (21345678, 'Maria', 'Coromoto', 'Guanare', 'Cedeño', '1993-10-21', 'F', 'SOLTERO', 'Av. Unda, Centro', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Capital Ospino' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- SUCRE 
	(11456789, 'Antonio', 'Jose', 'Sucre', 'Alcala', '1974-02-03', 'M', 'CASADO', 'Av. Perimetral, Urb. Gran Mariscal', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Pilar' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (20789123, 'Cruz', 'Maria', 'Salmeron', 'Acosta', '1992-12-24', 'F', 'SOLTERO', 'Calle Mariño, Sector Caigüire', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Santa Catalina' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- TACHIRA 
	(14098765, 'Cipriano', NULL, 'Castro', 'Ruiz', '1981-10-12', 'M', 'CASADO', 'Barrio Obrero, Carrera 22', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Michelena' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (22987654, 'Isaura', 'Beatriz', 'Medina', 'Angarita', '1997-04-19', 'F', 'SOLTERO', 'Av. 19 de Abril, Res. El Parque', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Román Cárdenas' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- TRUJILLO
	(12123456, 'Rafael', NULL, 'Rangel', 'Briceño', '1975-03-15', 'M', 'SOLTERO', 'Av. Carmona, Sector Santa Rosa', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Carache' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (20123987, 'Ana', 'Enriqueta', 'Teran', 'Valera', '1991-07-06', 'F', 'CASADO', 'Sector El Recreo, Calle 2', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Sabana Libre' AND l_tipo = 'PARROQUIA' LIMIT 1)),	
	
    -- YARACUY 
	(13098456, 'Jose', 'Joaquin', 'Veroes', 'Gimenez', '1979-08-22', 'M', 'CASADO', 'Av. Libertador, Centro', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Chivacoa' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (21987345, 'Maria', 'Lionza', 'Yara', 'Nirgua', '1995-01-20', 'F', 'SOLTERO', 'Urb. La Ascensión, Vereda 10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Farriar' AND l_tipo = 'PARROQUIA' LIMIT 1)),
	
    -- ZULIA 
	(15432109, 'Humberto', 'Jose', 'Fernandez', 'Moran', '1983-11-18', 'M', 'CASADO', 'Av. 5 de Julio, Edf. Banco Mara', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Altagracia' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (23765432, 'Chiquinquira', 'Del Carmen', 'Urdaneta', 'Rincon', '1998-05-12', 'F', 'SOLTERO', 'Av. El Milagro, Res. Lago', (SELECT l_cod FROM Lugar WHERE l_nombre = 'La Sierrita' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- LA GUAIRA 
    (11789012, 'Carlos', 'Jose', 'Soublette', 'Vargas', '1973-09-09', 'M', 'SOLTERO', 'Calle Bolívar, Casco Colonial', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Maiquetía' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (20654987, 'Guiomar', NULL, 'Narvaez', 'Maiquetia', '1993-02-14', 'F', 'CASADO', 'Av. Soublette, Frente al Puerto', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Catia La Mar' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    
    -- DISTRITO CAPITAL 
    (16234567, 'Simon', 'Jose', 'Bolivar', 'Palacios', '1985-07-24', 'M', 'SOLTERO', 'Plaza Bolívar, Esquina Gradillas', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Recreo' AND l_tipo = 'PARROQUIA' LIMIT 1)),
    (25123456, 'Manuela', NULL, 'Saenz', 'Caracas', '2000-12-25', 'F', 'SOLTERO', 'Av. Urdaneta, La Candelaria', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Antímano' AND l_tipo = 'PARROQUIA' LIMIT 1)),
	(30714884, 'Jose', 'Daniel', 'Nunes', 'Laguna', '2005-04-02', 'M', 'SOLTERO', 'Urb. El Paraiso, Av. Paez', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Junquito' AND l_tipo = 'PARROQUIA' LIMIT 1));

INSERT INTO Usuario (u_username, u_correo, u_hash_clave, cliente_c_cod, rol_ro_cod) VALUES 
	('dgonnet0', 'sbills0@pcworld.com', '$2a$04$Rl6UTj/wCH6k9RclT59wZO03C4OuIHbqdFHYb9.SjBD9AFAGjKiv.', (SELECT c_cod FROM Cliente WHERE c_ci = 15890123), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('ifeathersby1', 'mmepham1@comsenz.com', '$2a$04$cuB.FXQTMxJr1mee8LdFz.GZjF.EB8r79e5aK5Jn3f0KFnrf59O9W', (SELECT c_cod FROM Cliente WHERE c_ci = 21450987), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('aingledew2', 'mcooksley2@amazon.co.jp', '$2a$04$2rzObhgXxcdcNgXWVAVfCeW8pzzDQzigWchyt.gZQMTS3SwaJPlX2', (SELECT c_cod FROM Cliente WHERE c_ci = 12567890), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('divanovic3', 'phavers3@blogtalkradio.com', '$2a$04$RYsrX/IfUOdpkjAZ78PmuOizF.3WYMQB.yugBhs11JJgY.RUeq00m', (SELECT c_cod FROM Cliente WHERE c_ci = 20123987), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('cjennins4', 'idolphin4@ftc.gov', '$2a$04$BT9tm9H7KcynhtDxNMI4hO0KUiRbenO7FbVnsO9WaeUPvpZCbbh9C', (SELECT c_cod FROM Cliente WHERE c_ci = 22567891), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('vdominiak5', 'cbacup5@amazon.de', '$2a$04$p8PVG93Q/yz4F1Sn/wdP9ODPpmlp3LbakEk1ytj4CeVqG38gSQKva', (SELECT c_cod FROM Cliente WHERE c_ci = 15678123), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('lnaire6', 'vlaval6@yolasite.com', '$2a$04$6LxmmfYJbZRouqd3uGIN3eYPbE1e3Dbuq.G.WySFz3MJcMZ5tRBbO', (SELECT c_cod FROM Cliente WHERE c_ci = 20789123), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('adougherty7', 'fgarham7@so-net.ne.jp', '$2a$04$.ln/OtPeSvd46x.lnv4O5uM.oN2uTZRmtUsSGCcUxfjXVBGRoCNbq', (SELECT c_cod FROM Cliente WHERE c_ci = 22123456), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('mripsher8', 'rbrunstan8@mashable.com', '$2a$04$fPi/Rpnif.ep2GXtNxcNeudruPY9RXcouCK6v7vghkPI7X9vSt7ja', (SELECT c_cod FROM Cliente WHERE c_ci = 22987654), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('upeachment9', 'bserginson9@answers.com', '$2a$04$QeRJEmmmtN/WBdsKEaV3s.qQqHboW9NcMzJtdn8wc20OnYG75SB3m', (SELECT c_cod FROM Cliente WHERE c_ci = 14321098), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente')),
	('josemrmetra', 'jenuneslaguna@gmail.com', 'clavesupersecreta', (SELECT c_cod FROM Cliente WHERE c_ci = 30714884), (SELECT ro_cod FROM Rol WHERE ro_nombre = 'Cliente'));

INSERT INTO Crucero (p_nombre, p_fecha_afiliacion, c_fecha_constitucion, lugar_l_cod) VALUES
	('Royal Caribbean Int.', '2015-06-15', '1968-01-01', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Carnival Cruise Line', '2016-03-22', '1972-03-08', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Costa Cruceros', '2015-09-10', '1854-01-01', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1)), 
    ('AIDA Cruises', '2018-05-12', '1996-06-07', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1)),
    ('NYK Cruises', '2017-11-30', '1991-02-02', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1));

-- Alquiler de Vehículos
INSERT INTO Operador_Turistico (p_nombre, p_fecha_afiliacion, Lugar_l_cod) VALUES
    ('Hertz Car Rental', '2010-05-20', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Avis Rent a Car', '2012-08-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('Enterprise Rent-A-Car', '2015-03-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Sixt Rent a Car', '2018-11-05', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Postdam' LIMIT 1)),
    ('Europcar', '2016-07-22', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rennes' LIMIT 1)),
    ('Localiza', '2014-02-14', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Movida Aluguel de Carros', '2019-09-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1)),
    ('Alamo Rent A Car', '2013-06-18', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Budget Rent a Car', '2011-12-01', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('National Car Rental', '2017-04-25', (SELECT l_cod FROM Lugar WHERE l_nombre = 'California' LIMIT 1)),
    ('Goldcar', '2020-01-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Centauro Rent a Car', '2021-05-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
    ('Maggiore', '2015-08-08', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venecia' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Nippon Rent-A-Car', '2016-10-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1)),
    ('Toyota Rent a Car', '2014-03-03', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
    ('Unidas', '2018-06-20', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Amigos Car Rental', '2022-02-28', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('ACO Rent A Car', '2010-11-11', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
    ('Budget Venezuela', '2013-09-09', (SELECT l_cod FROM Lugar WHERE l_nombre = 'La Guaira' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
    ('Auto Europe', '2019-12-05', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1));

-- Servicio Turístico
INSERT INTO Operador_Turistico (p_nombre, p_fecha_afiliacion, Lugar_l_cod) VALUES
    ('TUI Group', '2005-04-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1)),
    ('CVC Viagens', '2008-09-20', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Despegar', '2010-01-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1)),
    ('Expedia Group', '2001-06-05', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Booking Holdings', '2003-11-25', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Trip.com Group', '2015-08-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1)),
    ('China International Travel Service', '1999-12-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Wuhan' LIMIT 1)),
    ('JTB Corporation', '1995-03-20', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1)),
    ('H.I.S. Co., Ltd.', '2000-07-07', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
    ('Viajes El Corte Ingles', '1998-05-18', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
    ('Logitravel', '2012-02-14', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Carlson Wagonlit Travel', '2006-09-09', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Francia' LIMIT 1)),
    ('American Express Global Business', '2000-01-01', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
    ('Flight Centre', '2010-10-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Sidney' LIMIT 1)),
    ('Intrepid Travel', '2014-04-22', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1)),
    ('Venezuela Tuya', '2005-08-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Turpial Travel', '2018-03-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
    ('Kangaroo Tours', '2019-11-05', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1)),
    ('Sojourn Russia', '2021-06-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Petersburgo' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Desert Adventures', '2016-12-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Riad' AND l_tipo = 'CIUDAD' LIMIT 1));

-- Parques
INSERT INTO Operador_Turistico (p_nombre, p_fecha_afiliacion, Lugar_l_cod) VALUES
    ('Disneyland Park', '1955-07-17', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('Universal Studios Hollywood', '1964-07-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('Six Flags Magic Mountain', '1971-05-29', (SELECT l_cod FROM Lugar WHERE l_nombre = 'California' LIMIT 1)),
    ('Tokyo Disney Resort', '1983-04-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
    ('Parque Nacional Canaima', '1962-06-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Bolivar' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
    ('Parque Nacional Mochima', '1973-12-19', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Sucre' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
    ('Parque Nacional El Avila', '1958-12-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Terra Mitica', '2000-07-27', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Parque Warner', '2002-04-06', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
    ('Ocean Park Hong Kong', '1977-01-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1));

-- 20 Hoteles
INSERT INTO Hotel (p_nombre, p_fecha_afiliacion, h_direccion, Lugar_l_cod) VALUES
    ('Hotel Eurobuilding', '1995-02-14', 'Calle La Guairita, Chuao', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Hotel Humboldt', '1956-12-29', 'Parque Nacional Waraira Repano', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Meliá Caracas', '1998-05-20', 'Av. Casanova, Sabana Grande', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Trinitarias Suites', '2005-08-10', 'Av. Los Leones', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Lara' LIMIT 1)),
    ('Hotel Tibisay', '2010-03-15', 'Av. Universidad', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Merida' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
    ('Hesperia WTC', '2009-11-01', 'Av. Salvador Feo La Cruz', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Valencia' LIMIT 1)),
    ('Lidotel Sambil', '2012-06-30', 'Centro Sambil Margarita', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Esparta' LIMIT 1)),
    ('Copacabana Palace', '1923-08-13', 'Av. Atlântica, 1702', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Fasano Rio', '2007-04-22', 'Av. Vieira Souto, 80', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('The Beverly Hills Hotel', '1912-05-12', '9641 Sunset Boulevard', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('Hotel Ritz Paris', '1898-06-01', '15 Place Vendôme', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Francia' LIMIT 1)),
    ('Park Hyatt Tokyo', '1994-07-09', '3-7-1-2 Nishi-Shinjuku', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1)),
    ('Riyadh Palace Hotel', '1980-01-01', 'Prince Fahad Bin Abdulaziz', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Riad' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Meliá Alicante', '1975-04-04', 'Plaza del Puerto, 3', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Four Seasons Sydney', '1985-09-19', '199 George St', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Sidney' LIMIT 1)),
    ('Corinthia St. Petersburg', '2000-02-28', 'Nevsky Prospekt, 57', (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Petersburgo' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Four Seasons Cairo', '2004-05-15', '35 Giza Street', (SELECT l_cod FROM Lugar WHERE l_nombre = 'El Cairo' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Hyatt Regency Wuhan', '2015-10-12', '188 Donghu Road', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Wuhan' LIMIT 1)),
    ('Pestana CR7 Lisboa', '2016-08-16', 'Rua do Comércio 54', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Lisboa' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Venice Simplon', '1982-05-25', 'Giudecca 10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venecia' AND l_tipo = 'CIUDAD' LIMIT 1));

INSERT INTO Empleado (e_CI, e_p_nombre, e_s_nombre, e_p_apellido, e_s_apellido, e_fecha_nacimiento) VALUES 
	(15432198, 'Juan', 'Carlos', 'Perez', 'Silva', '1982-05-15'),
	(24567890, 'Maria', 'Fernanda', 'Gonzalez', 'Lopez', '1998-11-20'),
	(12987654, 'Luis', 'Antonio', 'Rodriguez', NULL, '1975-03-10'),
	(25678123, 'Ana', NULL, 'Martinez', 'Ruiz', '1999-07-25'),
	(20123456, 'Carlos', 'Eduardo', 'Hernandez', 'Rojas', '1993-09-05'),
	(16789012, 'Sofia', 'Isabel', 'Garcia', 'Mendez', '1985-12-30'),
	(27654321, 'Diego', 'Alejandro', 'Torres', 'Vargas', '2001-02-14'),
	(14567890, 'Valentina', NULL, 'Ramirez', 'Castillo', '1979-08-22'),
	(22334455, 'Javier', 'Ignacio', 'Flores', 'Gil', '1995-04-18'),
	(19876543, 'Andrea', 'Paula', 'Morales', 'Soto', '1988-06-08');

INSERT INTO Ambiente (am_nombre) VALUES 
	('Familiar'), ('Romántico'), ('Ejecutivo'), ('Turístico'), ('Al aire libre'), 
	('Nocturno'), ('Temático'), ('Gourmet'), ('Casual'), ('Campestre'); 

INSERT INTO Restaurante (re_nombre, re_direccion, re_calificacion, Ambiente_am_cod, Lugar_l_cod) VALUES 
    ('Alto Restaurante', '1ra Transversal de Los Palos Grandes, Caracas', 5, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Gourmet' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Mi Ternerita', 'Av. 10 con Calle 72, Maracaibo', 4, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Nocturno' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('El Fondeadero', 'Calle Joaquín Maneiro, Pampatar', 4, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Turístico' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Esparta' LIMIT 1)),
    ('Restaurante El Tiuna', 'Av. Lara con Leones, Barquisimeto', 4, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Familiar' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Lara' LIMIT 1)),
    ('La Paraulata', 'Av. Los Próceres, Mérida', 3, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Campestre' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Merida' AND l_tipo = 'EDO/PROVINCIA' LIMIT 1)),
    ('Restaurante Botín', 'Calle de Cuchilleros 17', 5, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Turístico' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' LIMIT 1)),
    ('Le Meurice', '228 Rue de Rivoli', 5, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Romántico' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rennes' LIMIT 1)),
    ('Joe''s Pizza', '7 Carmine St', 4, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Casual' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'California' LIMIT 1)),
    ('La Pergola', 'Via Alberto Cadlolo 101', 5, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Gourmet' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venecia' LIMIT 1)),
    ('Pujol', 'Tennyson 133, Polanco', 5, (SELECT am_cod FROM Ambiente WHERE am_nombre = 'Ejecutivo' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Jalisco' LIMIT 1));

INSERT INTO Marca (mav_nombre, mav_tipo_vehiculo) VALUES 
	('Boeing',            'AEREO'),
	('Airbus',            'AEREO'),
	('Embraer',           'AEREO'),
	('McDonnell Douglas', 'AEREO'),
	('ATR',               'AEREO'),
	('Bombardier',        'AEREO'),
	('Cessna',            'AEREO'),
	('Antonov',           'AEREO'),
	('Fokker',            'AEREO'),
	('Beechcraft',        'AEREO'),
	('Fincantieri',               'MARITIMO'),
	('Meyer Werft',               'MARITIMO'),
	('Chantiers de l''Atlantique','MARITIMO'), 
	('STX Europe',                'MARITIMO'),
	('Mitsubishi Heavy Ind.',     'MARITIMO'),
	('Lloyd Werft',               'MARITIMO'),
	('Mariotti Shipyard',         'MARITIMO'),
	('Bremer Vulkan',             'MARITIMO'),
	('Kvaerner Masa-Yards',       'MARITIMO'),
	('Samsung Heavy Ind.',        'MARITIMO'),
	('Audi', 'TERRESTRE'),
	('Chevrolet', 'TERRESTRE'),
	('Volkswagen', 'TERRESTRE'),
	('Toyota', 'TERRESTRE'),
	('Tesla', 'TERRESTRE'),
	('Mitsubishi', 'TERRESTRE'),
	('Hyundai', 'TERRESTRE'),
	('Honda', 'TERRESTRE');

INSERT INTO Modelo (mv_nombre, Marca_mav_cod) VALUES 
	('737-800',         (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Boeing')),
    ('787 Dreamliner',  (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Boeing')),
    ('A320neo',         (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Airbus')),
    ('A350-900',        (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Airbus')),
    ('E190',            (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Embraer')),
    ('MD-82',           (SELECT mav_cod FROM Marca WHERE mav_nombre = 'McDonnell Douglas')),
    ('ATR 72-600',      (SELECT mav_cod FROM Marca WHERE mav_nombre = 'ATR')),
    ('CRJ-900',         (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Bombardier')),
    ('Citation X',      (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Cessna')),
    ('F100',            (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Fokker')),
	('Oasis',     		(SELECT mav_cod FROM Marca WHERE mav_nombre = 'Chantiers de l''Atlantique')),
    ('Clase Excel',     (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Vista',     (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Fincantieri')),
    ('Clase Quantum',   (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Helios',    (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Concordia', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Fincantieri')),
    ('Clase Spirit',    (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Solstice',  (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Kvaerner Masa-Yards')),
    ('Clase Freedom',   (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Kvaerner Masa-Yards')),
    ('Clase Fantasia',  (SELECT mav_cod FROM Marca WHERE mav_nombre = 'STX Europe')),
	('A4', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Audi' LIMIT 1)),
	('Q5', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Audi' LIMIT 1)),
	('Silverado', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Chevrolet' LIMIT 1)),
	('Aveo', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Chevrolet' LIMIT 1)),
	('Gol', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Volkswagen' LIMIT 1)),
	('Jetta', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Volkswagen' LIMIT 1)),
	('Corolla', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Toyota' LIMIT 1)),
	('Hilux', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Toyota' LIMIT 1)),
	('Model S', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Tesla' LIMIT 1)),
	('Cybertruck', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Tesla' LIMIT 1)),
	('Montero', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Mitsubishi' LIMIT 1)),
	('Lancer', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Mitsubishi' LIMIT 1)),
	('Tucson', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Hyundai' LIMIT 1)),
	('Elantra', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Hyundai' LIMIT 1)),
	('Civic', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Honda' LIMIT 1)),
	('CR-V', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Honda' LIMIT 1));

INSERT INTO Transporte_Terrestre (p_nombre, p_fecha_afiliacion, lugar_l_cod) VALUES
	('Greyhound Lines', '1995-05-10', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),
	('ALSA', '2000-08-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),
	('Rodovias de Venezuela', '1998-03-20', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Expresos Occidente', '1990-11-05', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('FlixBus', '2013-02-14', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1)),
	('JR Bus', '2005-06-30', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1)),
	('Autobuses de Oriente (ADO)', '1999-09-09', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1)),
	('Aeroexpresos Ejecutivos', '1992-07-24', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1)),
	('Viação Itapemirim', '1985-04-12', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1)),
	('Sitssa', '2008-01-15', (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venezuela' LIMIT 1));

INSERT INTO Barco (mt_capacidad, b_nombre, crucero_p_cod, modelo_mv_cod) VALUES
    (6780, 'Symphony of the Seas', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Oasis' LIMIT 1)),
    (5200, 'Mardi Gras', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Excel' LIMIT 1)),
    (6600, 'Costa Toscana', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Helios' LIMIT 1)),
    (5200, 'AIDAnova', (SELECT p_cod FROM Crucero WHERE p_nombre = 'AIDA Cruises' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Helios' LIMIT 1)),
    (4900, 'Anthem of the Seas', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Quantum' LIMIT 1)),
    (3960, 'Carnival Vista', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Vista' LIMIT 1)),
    (3780, 'Costa Concordia', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Concordia' LIMIT 1)),
    (2850, 'Celebrity Solstice', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Solstice' LIMIT 1)),
    (3690, 'Carnival Freedom', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Freedom' LIMIT 1)),
    (4500, 'MSC Fantasia', (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Clase Fantasia' LIMIT 1)); 

INSERT INTO Automovil (mt_capacidad, a_placa, a_costo_por_km, transporte_terrestre_p_cod, modelo_mv_cod) VALUES
    (5, 'AB123CD', 15.50, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Sitssa' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Aveo' LIMIT 1)),
    (5, 'AA987BB', 20.00, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Rodovias de Venezuela' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Corolla' LIMIT 1)),
    (5, 'MEX-889', 18.25, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Autobuses de Oriente (ADO)' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Hilux' LIMIT 1)),
    (5, 'USA-554', 25.00, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Silverado' LIMIT 1)),
    (5, 'ESP-112', 22.10, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'ALSA' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Jetta' LIMIT 1)),
    (5, 'GER-776', 30.50, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'FlixBus' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A4' LIMIT 1)),
    (7, 'VEN-990', 28.00, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Aeroexpresos Ejecutivos' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Montero' LIMIT 1)),
    (5, 'BRA-443', 12.75, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Gol' LIMIT 1)),
    (5, 'JPN-221', 19.90, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'JR Bus' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Civic' LIMIT 1)),
    (5, 'CCS-001', 35.00, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Sitssa' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'Tucson' LIMIT 1));

INSERT INTO Aeronave (mt_capacidad, aerolinea_p_cod, modelo_mv_cod) VALUES
    (160, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'American Airlines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = '737-800' LIMIT 1)),
    (290, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'United Airlines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = '787 Dreamliner' LIMIT 1)),
    (100, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Conviasa' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'E190' LIMIT 1)),
    (165, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Laser' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'MD-82' LIMIT 1)),
    (325, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A350-900' LIMIT 1)),
    (180, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Volaris' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A320neo' LIMIT 1)),
    (240, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Aeromexico' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = '787 Dreamliner' LIMIT 1)),
    (72,  (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Aeroitalia' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'ATR 72-600' LIMIT 1)),
    (90,  (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Red Wings Airlines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'CRJ-900' LIMIT 1)),
    (325, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Japan Airlines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A350-900' LIMIT 1)),
    (186, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Vueling Airlines' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A320neo' LIMIT 1)),
    (298, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Saudia' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = '787 Dreamliner' LIMIT 1)),
    (165, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Saudia' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A320neo' LIMIT 1)),
    (312, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Air China' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = 'A350-900' LIMIT 1)),
    (160, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Air China' LIMIT 1), (SELECT mv_cod FROM Modelo WHERE mv_nombre = '737-800' LIMIT 1));

INSERT INTO Servicio_Barco (sb_descripcion, sb_costo) VALUES
    ('Paquete de Internet Premium (Starlink)', 25.00),
    ('Cena en Restaurante de Especialidad (Steakhouse)', 45.00),
    ('Masaje Relajante en Spa (50 min)', 90.00),
    ('Acceso a Zona Termal Exclusiva', 35.00),
    ('Paquete de Bebidas Ilimitadas', 65.00),
    ('Excursión Guiada en Puerto', 120.00),
    ('Clase de Cocina Privada', 30.00),
    ('Servicio de Lavandería Express', 15.00),
    ('Sesión de Fotos Profesional', 20.00),
    ('Acceso VIP a Casino y Torneos', 50.00);

INSERT INTO Bar_Ser (servicio_barco_sb_cod, barco_mt_cod) VALUES
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Paquete de Internet%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Cena en Restaurante%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Paquete de Bebidas%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Mardi Gras' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Masaje Relajante%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Excursión Guiada%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'AIDAnova' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Acceso VIP%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Anthem of the Seas' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Clase de Cocina%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Carnival Vista' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Sesión de Fotos%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Concordia' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Servicio de Lavandería%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'Celebrity Solstice' LIMIT 1)),
    ((SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Acceso a Zona Termal%' LIMIT 1), (SELECT mt_cod FROM Barco WHERE b_nombre = 'MSC Fantasia' LIMIT 1));

INSERT INTO Tipo_Camarote (tc_nombre, tc_descripcion, tc_capacidad, tc_costo) VALUES
    ('Interior Standard', 'Camarote interior sin ventana, ideal para presupuesto bajo.', 2, 80.00),
    ('Interior Superior', 'Camarote interior con mayor metraje y ubicación céntrica.', 2, 100.00),
    ('Vista al Mar (Ojo de Buey)', 'Camarote con pequeña ventana circular en cubierta baja.', 2, 140.00),
    ('Vista al Mar Panorámica', 'Camarote con ventanal grande en cubierta superior.', 2, 180.00),
    ('Balcón Deluxe', 'Camarote con balcón privado y vista al mar.', 2, 250.00),
    ('Balcón Premium', 'Camarote con balcón extendido y tumbonas.', 3, 300.00),
    ('Mini Suite', 'Suite pequeña con área de estar separada y balcón.', 4, 450.00),
    ('Grand Suite', 'Suite de lujo con mayordomo, jacuzzi y balcón amplio.', 4, 900.00),
    ('Family Harbor', 'Camarote temático familiar con capacidad extra.', 5, 500.00),
    ('The Haven / Yacht Club', 'Suite exclusiva en área privada del barco con acceso VIP.', 4, 1500.00);

INSERT INTO Bar_Tip (bt_cant_camarotes, barco_mt_cod, tipo_camarote_tc_cod) VALUES
    (500, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Balcón Deluxe' LIMIT 1)),
    (200, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Interior Standard' LIMIT 1)),
    (50,  (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Grand Suite' LIMIT 1)),
    (300, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Mardi Gras' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Vista al Mar Panorámica' LIMIT 1)),
    (150, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Mardi Gras' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Family Harbor' LIMIT 1)),
    (400, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Balcón Premium' LIMIT 1)),
    (100, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Mini Suite' LIMIT 1)),
    (250, (SELECT mt_cod FROM Barco WHERE b_nombre = 'AIDAnova' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Interior Superior' LIMIT 1)),
    (20,  (SELECT mt_cod FROM Barco WHERE b_nombre = 'MSC Fantasia' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'The Haven / Yacht Club' LIMIT 1)),
    (350, (SELECT mt_cod FROM Barco WHERE b_nombre = 'Anthem of the Seas' LIMIT 1), (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Vista al Mar (Ojo de Buey)' LIMIT 1));	

INSERT INTO Clase_Asiento (ca_nombre, ca_descripcion, ca_costo) VALUES
    ('Economy Basic', 'Tarifa más baja, sin equipaje de mano ni selección de asiento.', 0.00),
    ('Economy Standard', 'Incluye equipaje de mano y selección de asiento estándar.', 40.00),
    ('Economy Plus', 'Espacio extra para las piernas (Exit Row).', 90.00),
    ('Premium Economy', 'Asiento más ancho, mayor reclinación y comida mejorada.', 250.00),
    ('Business Class Regional', 'Asiento central bloqueado en vuelos cortos (Europa).', 150.00),
    ('Business Class Lie-Flat', 'Asiento cama totalmente reclinable para vuelos largos.', 1200.00),
    ('First Class Suite', 'Suite privada con puerta y servicio personalizado.', 4500.00),
    ('The Residence', 'Apartamento privado de 3 habitaciones en el aire.', 12000.00),
    ('Turista Flex', 'Clase turista con cambios y reembolsos permitidos.', 80.00),
    ('Business Lite', 'Clase ejecutiva sin acceso a sala VIP ni maleta extra.', 800.00);

INSERT INTO Aer_Cla (ac_cant_asientos, aeronave_mt_cod, clase_asiento_ca_cod) VALUES
    (140, (SELECT mt_cod FROM Aeronave WHERE modelo_mv_cod = (SELECT mv_cod FROM Modelo WHERE mv_nombre = '737-800') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1)),
    (20,  (SELECT mt_cod FROM Aeronave WHERE modelo_mv_cod = (SELECT mv_cod FROM Modelo WHERE mv_nombre = '737-800') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Plus' LIMIT 1)),
    (200, (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'United Airlines') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1)),
    (48,  (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'United Airlines') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Business Class Lie-Flat' LIMIT 1)),
    (290, (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1)),
    (31,  (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Business Class Lie-Flat' LIMIT 1)),
    (24,  (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Premium Economy' LIMIT 1)),
    (100, (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Conviasa') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1)),
    (8,   (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Japan Airlines') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'First Class Suite' LIMIT 1)),
    (180, (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Volaris') LIMIT 1), (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Basic' LIMIT 1));	

INSERT INTO Tasa_Cambio (tca_divisa_origen, tca_valor_tasa, tca_fecha_hora_tasa, tca_fecha_hora_fin) VALUES
    ('USD', 60.50, '2025-11-01 09:00:00', '2025-11-08 08:59:59'),
    ('USD', 61.20, '2025-11-08 09:00:00', '2025-11-15 08:59:59'),
    ('USD', 62.00, '2025-11-15 09:00:00', '2025-11-22 08:59:59'),
    ('USD', 63.50, '2025-11-22 09:00:00', '2025-12-01 08:59:59'),
    ('USD', 251.88, '2025-12-01 09:00:00', NULL),

    ('EUR', 65.00, '2025-11-01 09:00:00', '2025-11-08 08:59:59'),
    ('EUR', 66.10, '2025-11-08 09:00:00', '2025-11-15 08:59:59'),
    ('EUR', 67.20, '2025-11-15 09:00:00', '2025-11-22 08:59:59'),
    ('EUR', 68.50, '2025-11-22 09:00:00', '2025-12-01 08:59:59'),
    ('EUR', 293.88, '2025-12-01 09:00:00', NULL),

    ('JPY', 0.4030, '2025-11-01 09:00:00', '2025-11-08 08:59:59'),
    ('JPY', 0.4080, '2025-11-08 09:00:00', '2025-11-15 08:59:59'),
    ('JPY', 0.4130, '2025-11-15 09:00:00', '2025-11-22 08:59:59'),
    ('JPY', 0.4230, '2025-11-22 09:00:00', '2025-12-01 08:59:59'),
    ('JPY', 1.61, '2025-12-01 09:00:00', NULL),

    ('MILLA', 0.25, '2025-10-01 00:00:00', '2025-10-15 23:59:59'),
    ('MILLA', 0.28, '2025-10-16 00:00:00', '2025-11-01 23:59:59'),
    ('MILLA', 0.30, '2025-11-02 00:00:00', '2025-11-15 23:59:59'),
    ('MILLA', 0.32, '2025-11-16 00:00:00', '2025-12-01 23:59:59'),
    ('MILLA', 0.35, '2025-12-02 00:00:00', NULL);	

INSERT INTO Tas_Lug VALUES 
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1)),	
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Africa' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Francia' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1)),
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1)),	
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1)),	
	((SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'JPY' AND tca_fecha_hora_fin IS NULL LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Asia' LIMIT 1));	

INSERT INTO Terminal_Operacion (to_direccion, Transporte_terrestre_p_cod, lugar_l_cod) VALUES
    ('Terminal Privado, Av. Libertador, Colegio de Ingenieros', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Rodovias de Venezuela' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Av. Principal de Bello Campo, Chacao', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Aeroexpresos Ejecutivos' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Terminal La Bandera, Av. Nueva Granada', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Sitssa' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1)),
    ('Terminal de Pasajeros Genaro Mendez, La Concordia', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Expresos Occidente' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Cristóbal' LIMIT 1)),
    ('1716 E 7th St, Downtown LA', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1)),
    ('Muelle de Poniente, s/n, Estación de Autobuses', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'ALSA' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Central de Autobuses de Guadalajara, Tlaquepaque', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Autobuses de Oriente (ADO)' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Guadalajara' LIMIT 1)),
    ('Rodoviária Novo Rio, Av. Francisco Bicalho', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1)),
    ('Busta Shinjuku 4F, Shibuya City', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'JR Bus' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1)),
    ('ZOB am Funkturm, Masurenallee', (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'FlixBus' LIMIT 1), (SELECT l_cod FROM Lugar WHERE l_nombre = 'Postdam' LIMIT 1));	

INSERT INTO Tipo_Habitacion (th_nombre, th_descripcion) VALUES
    ('Individual', 'Habitación diseñada para una persona, generalmente con una cama individual.'),
    ('Doble Estándar', 'Habitación para dos personas con dos camas individuales o una cama doble.'),
    ('Matrimonial', 'Habitación con una cama grande (Queen o King Size) ideal para parejas.'),
    ('Twin', 'Habitación con dos camas individuales separadas, ideal para amigos o compañeros de trabajo.'),
    ('Suite Junior', 'Habitación más amplia que la estándar con una pequeña área de estar integrada.'),
    ('Suite Ejecutiva', 'Habitación espaciosa con escritorio de trabajo, sala de estar y servicios VIP.'),
    ('Suite Presidencial', 'La habitación más lujosa del hotel, con múltiples ambientes, jacuzzi y mayordomo.'),
    ('Familiar', 'Habitación de gran tamaño o conectada, con capacidad para 4 o más personas.'),
    ('Habitación Conectada', 'Dos habitaciones con una puerta interna que permite el acceso entre ellas.'),
    ('Habitación Accesible', 'Diseñada específicamente para personas con movilidad reducida, con baños adaptados.');

-- CCS -> MAD (Iberia)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (850.00, 4300) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'IB6674', '2025-11-20 18:00:00', 7000, 9, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia' LIMIT 1) LIMIT 1) FROM s;

-- JFK -> LHR (American Airlines)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (600.00, 3400) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'AA100', '2025-12-01 18:30:00', 5500, 7, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'American Airlines' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1), -- Asumiendo JFK en USA
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'American Airlines' LIMIT 1) LIMIT 1) FROM s;

-- HND -> LAX (Japan Airlines)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1200.00, 5400) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'JL016', '2025-11-25 17:00:00', 8800, 10, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Japan Airlines' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Japon' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Japan Airlines' LIMIT 1) LIMIT 1) FROM s;

-- FCO -> MEX (ITA Airways)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (950.00, 6000) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'AZ676', '2025-12-10 10:00:00', 10200, 13, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Aeroitalia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Aeroitalia' LIMIT 1) LIMIT 1) FROM s;

-- CCS -> PMV (Conviasa - Nacional)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (50.00, 200) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'V03012', '2025-11-18 07:00:00', 300, 1, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Conviasa' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Esparta' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Conviasa' LIMIT 1) LIMIT 1) FROM s;

-- SYD -> AKL (Qantas)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (300.00, 1300) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'QF143', '2025-11-30 09:00:00', 2100, 3, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Red Wings Airlines' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Australia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Nueva Zelanda' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Red Wings Airlines' LIMIT 1) LIMIT 1) FROM s;

-- PEK -> SZX (Air China)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (200.00, 1000) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'CA1301', '2025-12-05 14:00:00', 1900, 3, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Air China' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1), -- PEK (Beijing) genérico
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'China' LIMIT 1), -- SZX (Shenzhen) genérico
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Air China' LIMIT 1) LIMIT 1) FROM s;

-- MAD -> BCN (Vueling)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (80.00, 300) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'VY1001', '2025-11-22 08:00:00', 500, 1, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Vueling Airlines' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Vueling Airlines' LIMIT 1) LIMIT 1) FROM s;

-- RUH -> JED (Saudia)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (120.00, 500) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'SV1020', '2025-12-15 11:00:00', 850, 2, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Saudia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Riad' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Arabia Saudita' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Saudia' LIMIT 1) LIMIT 1) FROM s;

-- MEX -> LAX (Volaris)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (250.00, 1500) RETURNING s_cod)
INSERT INTO Vuelo (s_cod, v_cod_vue, v_fecha_hora_salida, v_distancia_km, v_duracion_horas, aerolinea_p_cod, lugar_l_cod, lugar_l_cod2, aeronave_mt_cod)
SELECT s_cod, 'Y4900', '2025-11-28 16:00:00', 2500, 4, 
    (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Volaris' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1),
    (SELECT mt_cod FROM Aeronave WHERE aerolinea_p_cod = (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Volaris' LIMIT 1) LIMIT 1) FROM s;	

-- Rodovias CCS
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (30.00, 50) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 300, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Rodovias de Venezuela' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Libertador%' LIMIT 1) FROM s;

-- Aeroexpresos CCS
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (35.00, 60) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 400, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Aeroexpresos Ejecutivos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Bello Campo%' LIMIT 1) FROM s;

-- Greyhound LA
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (50.00, 100) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 200, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Downtown LA%' LIMIT 1) FROM s;

-- ALSA Alicante
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (40.00, 80) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 150, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'ALSA' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alicante' AND l_tipo = 'CIUDAD' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Muelle%' LIMIT 1) FROM s;

-- Expresos Occidente San Cristobal
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (25.00, 40) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 800, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Expresos Occidente' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'San Cristóbal' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Genaro%' LIMIT 1) FROM s;

-- FlixBus Alemania
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (20.00, 30) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 60, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'FlixBus' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Postdam' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%ZOB%' LIMIT 1) FROM s;

-- ADO Mexico
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (45.00, 90) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 500, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Autobuses de Oriente (ADO)' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Guadalajara' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Tlaquepaque%' LIMIT 1) FROM s;

-- JR Bus Japon
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (60.00, 120) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 100, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'JR Bus' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Busta%' LIMIT 1) FROM s;

-- Itapemirim Rio
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (55.00, 110) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 450, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%Novo Rio%' LIMIT 1) FROM s;

-- Sitssa Interurbano
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (15.00, 20) RETURNING s_cod)
INSERT INTO Traslado (s_cod, t_distancia_km, transporte_terrestre_p_cod, lugar_l_cod, terminal_operacion_to_cod)
SELECT s_cod, 120, 
    (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Sitssa' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1),
    (SELECT to_cod FROM Terminal_Operacion WHERE to_direccion LIKE '%La Bandera%' LIMIT 1) FROM s;	

-- Royal Caribbean (Caribe)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1200.00, 5000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-12-20 16:00:00', 7, 3000,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1) FROM s;

-- Carnival (Caribe)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (900.00, 3000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2026-01-10 15:00:00', 5, 2000,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Mardi Gras' LIMIT 1) FROM s;

-- Costa (Mediterráneo)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1500.00, 6000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-11-15 18:00:00', 10, 4000,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana' LIMIT 1) FROM s;

-- AIDA (Canarias)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1100.00, 4500) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-12-05 17:00:00', 7, 2500,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'AIDA Cruises' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Alemania' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'AIDAnova' LIMIT 1) FROM s;

-- Royal Caribbean (Transatlántico)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (2000.00, 8000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2026-03-01 14:00:00', 14, 6000,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Europa' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Anthem of the Seas' LIMIT 1) FROM s;

-- Carnival (Pacífico)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (850.00, 3200) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-11-25 15:30:00', 4, 1500,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Carnival Vista' LIMIT 1) FROM s;

-- Costa (Adriático)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1300.00, 5500) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2026-02-14 18:00:00', 8, 3000,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Venecia' AND l_tipo = 'CIUDAD' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Italia' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Concordia' LIMIT 1) FROM s;

-- Celebrity (Alaska - Usando Royal como proxy)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1800.00, 7000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2026-05-20 16:00:00', 7, 2800,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Celebrity Solstice' LIMIT 1) FROM s;

-- Carnival (Caribe Oeste)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (700.00, 2500) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-12-12 15:00:00', 5, 1800,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Carnival Cruise Line' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Mexico' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'Carnival Freedom' LIMIT 1) FROM s;

-- MSC (Sudamérica - Usando Costa como proxy)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1000.00, 4000) RETURNING s_cod)
INSERT INTO Viaje (s_cod, vi_fecha_hora_salida, vi_duracion_dias, vi_distancia_km, crucero_p_cod, lugar_l_cod, lugar_l_cod2, barco_mt_cod)
SELECT s_cod, '2025-11-30 17:00:00', 7, 3200,
    (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Brasil' LIMIT 1),
    (SELECT mt_cod FROM Barco WHERE b_nombre = 'MSC Fantasia' LIMIT 1) FROM s;	

-- Alquiler Hertz USA
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (300.00, 600) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Alquiler SUV Semanal', 'Renta de Ford Explorer o similar por 7 días', 5,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Hertz Car Rental' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1) FROM s;

-- Entrada Disney
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (150.00, 150) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Entrada 1 Día Park Hopper', 'Acceso a ambos parques de Disneyland Resort', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Disneyland Park' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1) FROM s;

-- Tour Canaima
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (500.00, 1000) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Excursión Salto Ángel', 'Tour de 3 días y 2 noches con pernocta', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Parque Nacional Canaima' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Gran Sabana' AND l_tipo = 'PARROQUIA' LIMIT 1) FROM s;

-- Alquiler Localiza Rio
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (200.00, 400) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Alquiler Compacto', 'Renta de Fiat Mobi o similar por 5 días', 4,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Localiza' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Rio de Janeiro' AND l_tipo = 'CIUDAD' LIMIT 1) FROM s;

-- Entrada Universal
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (130.00, 130) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Entrada Universal Express', 'Acceso rápido a atracciones', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Universal Studios Hollywood' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Los Angeles' LIMIT 1) FROM s;

-- Booking Hotel Reserva (Agencia)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (50.00, 100) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Comisión de Reserva', 'Tarifa de gestión por reserva de hotel', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Booking Holdings' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Estados Unidos' LIMIT 1) FROM s;

-- Tour Avila
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (20.00, 40) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Subida en Teleférico', 'Ticket ida y vuelta al Hotel Humboldt', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Parque Nacional El Avila' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Distrito Capital' LIMIT 1) FROM s;

-- Alquiler Sixt Alemania
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (400.00, 800) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Alquiler Sedan Lujo', 'BMW Serie 3 por fin de semana', 5,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Sixt Rent a Car' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Postdam' LIMIT 1) FROM s;

-- Entrada Warner
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (60.00, 60) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'Entrada General', 'Acceso a Parque Warner Madrid', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Parque Warner' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'España' LIMIT 1) FROM s;

-- Tour Japon (JTB)
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (150.00, 300) RETURNING s_cod)
INSERT INTO Servicio_Adicional (s_cod, sa_nombre, sa_descripcion, sa_capacidad, operador_turistico_p_cod, lugar_l_cod)
SELECT s_cod, 'City Tour Tokyo', 'Recorrido guiado por templos y zonas modernas', 1,
    (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'JTB Corporation' LIMIT 1),
    (SELECT l_cod FROM Lugar WHERE l_nombre = 'Shinjuku' LIMIT 1) FROM s;	

-- Eurobuilding Caracas - Individual
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (120.00, 240) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '101', 1,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Eurobuilding' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Individual' LIMIT 1) FROM s;

-- Eurobuilding Caracas - Suite
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (300.00, 600) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '505', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Eurobuilding' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Suite Ejecutiva' LIMIT 1) FROM s;

-- Humboldt - Suite Presidencial
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (500.00, 1000) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, 'PH-01', 4,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Humboldt' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Suite Presidencial' LIMIT 1) FROM s;

-- Beverly Hills Hotel - Matrimonial
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (800.00, 1600) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '204', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'The Beverly Hills Hotel' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Matrimonial' LIMIT 1) FROM s;

-- Ritz Paris - Suite
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (1200.00, 2400) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '300', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Ritz Paris' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Suite Junior' LIMIT 1) FROM s;

-- Copacabana Palace - Doble
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (450.00, 900) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '402', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Copacabana Palace' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Doble Estándar' LIMIT 1) FROM s;

-- Meliá Caracas - Twin
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (150.00, 300) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '610', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Meliá Caracas' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Twin' LIMIT 1) FROM s;

-- Pestana Lisboa - Familiar
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (250.00, 500) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '105', 4,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Pestana CR7 Lisboa' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Familiar' LIMIT 1) FROM s;

-- Park Hyatt Tokyo - Accesible
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (600.00, 1200) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '202A', 2,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Park Hyatt Tokyo' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Habitación Accesible' LIMIT 1) FROM s;

-- Hesperia Valencia - Conectada
WITH s AS (INSERT INTO Servicio (s_costo, s_millas_otorgar) VALUES (180.00, 360) RETURNING s_cod)
INSERT INTO Habitacion (s_cod, ha_numero, ha_capacidad, hotel_p_cod, tipo_habitacion_th_cod)
SELECT s_cod, '308-309', 4,
    (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hesperia WTC' LIMIT 1),
    (SELECT th_cod FROM Tipo_Habitacion WHERE th_nombre = 'Habitación Conectada' LIMIT 1) FROM s;	

INSERT INTO Etiqueta (et_nombre) VALUES
    ('Lujo'),
    ('Aventura'),
    ('Familiar'),
    ('Negocios'),
    ('Ecoturismo'),
    ('Romántico'),
    ('Playa'),
    ('Mascotas'),
    ('Gastronómico'),
    ('Económico');

INSERT INTO Eti_Cli (cliente_c_cod, etiqueta_et_cod) VALUES
    ((SELECT c_cod FROM Cliente WHERE c_ci = 15890123), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Aventura')),
	((SELECT c_cod FROM Cliente WHERE c_ci = 15890123), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 24567123), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Playa')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 14560981), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Negocios')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 19876543), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 25678901), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Lujo')),
	((SELECT c_cod FROM Cliente WHERE c_ci = 25678901), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar')),
	((SELECT c_cod FROM Cliente WHERE c_ci = 25678901), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Ecoturismo')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 20456789), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Gastronómico')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 16234567), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Ecoturismo')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 21450987), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Económico')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 25123456), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Romántico')),
    ((SELECT c_cod FROM Cliente WHERE c_ci = 20987123), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Mascotas'));	

INSERT INTO Eti_Ser (servicio_s_cod, etiqueta_et_cod) VALUES
    ((SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'IB6674' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Negocios')),
    ((SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'Y4900' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Económico')),
    ((SELECT s_cod FROM Habitacion WHERE ha_numero = 'PH-01' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Lujo')),
    ((SELECT s_cod FROM Habitacion WHERE ha_numero = '105' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar')),
    ((SELECT s_cod FROM Viaje WHERE barco_mt_cod = (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana' LIMIT 1) LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Romántico')),
    ((SELECT s_cod FROM Servicio_Adicional WHERE sa_nombre = 'Excursión Salto Ángel' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Ecoturismo')),
    ((SELECT s_cod FROM Servicio_Adicional WHERE sa_nombre LIKE 'Entrada 1 Día%' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar')),
    ((SELECT s_cod FROM Servicio_Adicional WHERE sa_nombre = 'Alquiler SUV Semanal' LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Aventura')),
    ((SELECT s_cod FROM Traslado WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines') LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Económico')),
    ((SELECT s_cod FROM Viaje WHERE barco_mt_cod = (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1) LIMIT 1), (SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Playa'));	

INSERT INTO Telefono (t_cod_pais, t_cod_area, t_numero, cliente_c_cod, operador_turistico_p_cod) VALUES
    (58, 0414, 5891234, (SELECT c_cod FROM Cliente WHERE c_ci = 15890123 LIMIT 1), NULL),
    (58, 0424, 8765432, (SELECT c_cod FROM Cliente WHERE c_ci = 24567123 LIMIT 1), NULL),
    (58, 0212, 5551830, (SELECT c_cod FROM Cliente WHERE c_ci = 16234567 LIMIT 1), NULL),
    (58, 0412, 9988776, (SELECT c_cod FROM Cliente WHERE c_ci = 14560981 LIMIT 1), NULL),
    (58, 0416, 3332211, (SELECT c_cod FROM Cliente WHERE c_ci = 25123456 LIMIT 1), NULL),
    (1, 800, 6543131, NULL, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Hertz Car Rental' LIMIT 1)),
    (1, 714, 7814636, NULL, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Disneyland Park' LIMIT 1)),
    (58, 0286, 9620456, NULL, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Parque Nacional Canaima' LIMIT 1)),
    (49, 511, 5660000, NULL, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'TUI Group' LIMIT 1)),
    (55, 21, 3003000, NULL, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Localiza' LIMIT 1));

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, aerolinea_p_cod)
    VALUES ('Black Flydays', 20, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Iberia' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, v.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Vuelo v
	JOIN Servicio s ON v.s_cod = s.s_cod
	WHERE v.v_cod_vue = 'IB6674' LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, hotel_p_cod)
    VALUES ('Staycation Caracas', 15, (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Eurobuilding' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, h.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Habitacion h
	JOIN Servicio s ON h.s_cod = s.s_cod
	WHERE h.ha_numero = '505' AND h.hotel_p_cod = (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Eurobuilding') LIMIT 1;

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, crucero_p_cod)
    VALUES ('Sail Away Special', 10, (SELECT p_cod FROM Crucero WHERE p_nombre = 'Royal Caribbean Int.' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, vi.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Viaje vi
	JOIN Servicio s ON vi.s_cod = s.s_cod
	WHERE vi.barco_mt_cod = (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas') LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, transporte_terrestre_p_cod)
    VALUES ('Ruta Nacional', 5, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Rodovias de Venezuela' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, t.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Traslado t
	JOIN Servicio s ON t.s_cod = s.s_cod
	WHERE t.transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Rodovias de Venezuela') LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, operador_turistico_p_cod)
    VALUES ('Aventura Selva', 20, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Parque Nacional Canaima' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, sa.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Servicio_Adicional sa
	JOIN Servicio s ON sa.s_cod = s.s_cod
	WHERE sa.sa_nombre = 'Excursión Salto Ángel' LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, aerolinea_p_cod)
    VALUES ('Venta Anual Volaris', 30, (SELECT p_cod FROM Aerolinea WHERE p_nombre = 'Volaris' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, v.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Vuelo v
	JOIN Servicio s ON v.s_cod = s.s_cod
	WHERE v.v_cod_vue = 'Y4900' LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, hotel_p_cod)
    VALUES ('Altura VIP', 10, (SELECT p_cod FROM Hotel WHERE p_nombre = 'Hotel Humboldt' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, h.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Habitacion h
	JOIN Servicio s ON h.s_cod = s.s_cod
	WHERE h.ha_numero = 'PH-01' LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, crucero_p_cod)
    VALUES ('Mediterráneo Azul', 15, (SELECT p_cod FROM Crucero WHERE p_nombre = 'Costa Cruceros' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, vi.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Viaje vi
	JOIN Servicio s ON vi.s_cod = s.s_cod
	WHERE vi.barco_mt_cod = (SELECT mt_cod FROM Barco WHERE b_nombre = 'Costa Toscana') LIMIT 1;	

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, transporte_terrestre_p_cod)
    VALUES ('USA Pass', 10, (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, t.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Traslado t
	JOIN Servicio s ON t.s_cod = s.s_cod
	WHERE t.transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines') LIMIT 1;

WITH nueva_promo AS (
    INSERT INTO Promocion (pr_nombre, pr_porcentaje, operador_turistico_p_cod)
    VALUES ('Magia Familiar', 5, (SELECT p_cod FROM Operador_Turistico WHERE p_nombre = 'Disneyland Park' LIMIT 1))
    RETURNING pr_cod, pr_porcentaje
)
INSERT INTO Pro_Ser (promocion_pr_cod, servicio_s_cod, ps_monto)
	SELECT np.pr_cod, sa.s_cod, (s.s_costo * np.pr_porcentaje / 100.0)
	FROM nueva_promo np, Servicio_Adicional sa
	JOIN Servicio s ON sa.s_cod = s.s_cod
	WHERE sa.sa_nombre LIKE 'Entrada 1 Día%' LIMIT 1;	

INSERT INTO Restriccion_Paquete (rp_caracteristica, rp_operador, rp_valor_restriccion) VALUES
    ('c_edo_civil', '=', 'CASADO'),
    ('EDAD', '>=', '18'),
    ('c_edo_civil', '=', 'SOLTERO'),
    ('EDAD', '>=', '60'),
    ('c_sexo', '=', 'F'),
    ('c_sexo', '=', 'M'),
    ('PAIS', '=', 'Venezuela'),
    ('EDAD', 'BETWEEN', '18 AND 25'),
    ('EDAD', '<=', '12'),
    ('PAIS', 'IN', '("España", "Italia", "Alemania", "Francia", "Portugal")');	

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (2, 'Luna de Miel en las Alturas', 'Fin de semana romántico en la cima del Avila con todo incluido.', 500.00, 1000, 
    (SELECT rp_cod FROM Restriccion_Paquete WHERE rp_valor_restriccion = 'CASADO' LIMIT 1))
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, s.s_cod FROM pkg, Servicio s
	LEFT JOIN Habitacion h ON s.s_cod = h.s_cod
	LEFT JOIN Servicio_Adicional sa ON s.s_cod = sa.s_cod
	WHERE (h.ha_numero = 'PH-01') -- Suite Humboldt
	   OR (sa.sa_nombre = 'Subida en Teleférico');

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (4, 'Sueño Californiano Familiar', 'Viaje inolvidable a Los Angeles para 4 personas.', 1100.00, 2200, NULL)
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, s.s_cod FROM pkg, Servicio s
	LEFT JOIN Vuelo v ON s.s_cod = v.s_cod
	LEFT JOIN Servicio_Adicional sa ON s.s_cod = sa.s_cod
	LEFT JOIN Habitacion h ON s.s_cod = h.s_cod
	WHERE (v.v_cod_vue = 'Y4900') -- Vuelo Volaris
	   OR (sa.sa_nombre LIKE 'Entrada 1 Día%') -- Disney
	   OR (h.ha_numero = '204'); -- Beverly Hills Hotel

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (1, 'Aventura en la Selva', 'Expedición extrema al Salto Ángel.', 450.00, 900, 
    (SELECT rp_cod FROM Restriccion_Paquete WHERE rp_caracteristica = 'EDAD' AND rp_operador = '>=' LIMIT 1))
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, sa.s_cod FROM pkg, Servicio_Adicional sa
	WHERE sa.sa_nombre = 'Excursión Salto Ángel';

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (2, 'Experiencia Tokio Total', 'Inmersión cultural y lujo en la capital japonesa.', 1800.00, 3600, NULL)
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, s.s_cod FROM pkg, Servicio s
	LEFT JOIN Vuelo v ON s.s_cod = v.s_cod
	LEFT JOIN Habitacion h ON s.s_cod = h.s_cod
	LEFT JOIN Servicio_Adicional sa ON s.s_cod = sa.s_cod
	WHERE (v.v_cod_vue = 'JL016') -- Vuelo JAL
	   OR (h.ha_numero = '202A') -- Park Hyatt
	   OR (sa.sa_nombre = 'City Tour Tokyo');

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (2, 'Carioca Escape', 'Playa, sol y libertad para recorrer Rio.', 600.00, 1200, NULL)
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, s.s_cod FROM pkg, Servicio s
	LEFT JOIN Habitacion h ON s.s_cod = h.s_cod
	LEFT JOIN Servicio_Adicional sa ON s.s_cod = sa.s_cod
	WHERE (h.ha_numero = '402') -- Copacabana Palace
	   OR (sa.sa_nombre = 'Alquiler Compacto'); -- Localiza

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (1, 'Solteros en el Pacífico', 'Fiesta y diversión a bordo por la costa oeste.', 800.00, 1600, 
    (SELECT rp_cod FROM Restriccion_Paquete WHERE rp_valor_restriccion = 'SOLTERO' LIMIT 1))
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, vi.s_cod FROM pkg, Viaje vi
	JOIN Barco b ON vi.barco_mt_cod = b.mt_cod
	WHERE b.b_nombre = 'Carnival Vista';

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (1, 'Eurotrip Express', 'Conexión rápida Caracas - Madrid - Barcelona.', 900.00, 1800, NULL)
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, v.s_cod FROM pkg, Vuelo v
	WHERE v.v_cod_vue IN ('IB6674', 'VY1001');

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (2, 'Relax Dorado en Lisboa', 'Estadía tranquila diseñada para adultos mayores.', 220.00, 440, 
    (SELECT rp_cod FROM Restriccion_Paquete WHERE rp_caracteristica = 'EDAD' AND rp_valor_restriccion = '60' LIMIT 1))
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, h.s_cod FROM pkg, Habitacion h
	WHERE h.ha_numero = '105'; -- Pestana


WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (1, 'Ejecutivo Nacional', 'Logística resuelta para su viaje de negocios a la capital.', 140.00, 280, 
    (SELECT rp_cod FROM Restriccion_Paquete WHERE rp_valor_restriccion = 'Venezuela' LIMIT 1))
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, s.s_cod FROM pkg, Servicio s
	LEFT JOIN Traslado t ON s.s_cod = t.s_cod
	LEFT JOIN Habitacion h ON s.s_cod = h.s_cod
	LEFT JOIN Transporte_Terrestre tt ON t.transporte_terrestre_p_cod = tt.p_cod
	WHERE (tt.p_nombre = 'Aeroexpresos Ejecutivos')
	   OR (h.ha_numero = '101'); -- Eurobuilding Individual

WITH pkg AS (
    INSERT INTO Paquete_Turistico (pt_cant_personas, pt_nombre, pt_descripcion, pt_costo, pt_costo_millas, restriccion_paquete_rp_cod)
    VALUES (1, 'Diversión Warner', 'Full day en el parque temático.', 55.00, 110, NULL)
    RETURNING pt_cod
)
INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
	SELECT pkg.pt_cod, sa.s_cod FROM pkg, Servicio_Adicional sa
	WHERE sa.sa_nombre = 'Entrada General';	

INSERT INTO Eti_Paq (etiqueta_et_cod, paquete_turistico_pt_cod) VALUES
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Romántico' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Luna de Miel en las Alturas' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Sueño Californiano Familiar' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Aventura' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Aventura en la Selva' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Ecoturismo' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Aventura en la Selva' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Lujo' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Experiencia Tokio Total' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Playa' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Carioca Escape' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Aventura' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Solteros en el Pacífico' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Negocios' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Ejecutivo Nacional' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Gastronómico' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Relax Dorado en Lisboa' LIMIT 1)),
    ((SELECT et_cod FROM Etiqueta WHERE et_nombre = 'Familiar' LIMIT 1), (SELECT pt_cod FROM Paquete_Turistico WHERE pt_nombre = 'Diversión Warner' LIMIT 1));

INSERT INTO Compra (co_fecha_hora, co_monto_total, co_millas_a_agregar, co_compensacion_huella, co_estado, cliente_c_cod)
	SELECT 
	    ('2025-01-01'::timestamp + (random() * (interval '45 days'))),
	    0,
	    0,
	    CASE WHEN random() > 0.5 THEN ROUND((random() * 20 + 5)::numeric, 2) ELSE 0.00 END,
	    'FINALIZADO',
	    c_cod
	FROM Cliente;	

-- Insertar Viajero 1 por cada Compra
INSERT INTO Viajero (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento)
	SELECT 
	    'ViajeroA', 
	    CAST(co_cod AS VARCHAR), -- Guardamos el ID de compra en el segundo nombre para vincularlo luego
	    'ApellidoA', 
	    'Genérico', 
	    'viajeroA_' || co_cod || '@email.com', 
	    '1990-01-01'
	FROM Compra;

-- Insertar Viajero 2 por cada Compra
INSERT INTO Viajero (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento)
	SELECT 
	    'ViajeroB', 
	    CAST(co_cod AS VARCHAR), 
	    'ApellidoB', 
	    'Genérico', 
	    'viajeroB_' || co_cod || '@email.com', 
	    '1995-05-15'
	FROM Compra;

-- Insertar Vuelo
INSERT INTO Boleto_Vuelo (compra_co_cod, vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, clase_asiento_ca_cod, tasa_cambio_tca_cod)
	SELECT c.co_cod,
	    (SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'IB6674' LIMIT 1), -- Vuelo a Caracas
	    850.00 * 2 + (SELECT ca_costo FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1),
	    FALSE,
	    2,
	    (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
		FROM Compra c WHERE c.co_cod % 5 = 0;

-- Insertar Hotel
INSERT INTO Detalle_Hospedaje (compra_co_cod, habitacion_s_cod, res_costo_sub_total, res_anulado, dh_cant_noches, dh_fecha_hora_check_in, dh_fecha_hora_check_out, dh_fecha_hora_out_real, tasa_cambio_tca_cod)
	SELECT c.co_cod,
	    (SELECT s_cod FROM Habitacion WHERE ha_numero = '101' LIMIT 1), -- Eurobuilding
	    240.00,
	    FALSE,
	    2,
	    c.co_fecha_hora + interval '1 day',
	    c.co_fecha_hora + interval '3 days',
	    NULL,
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 0;

-- Insertar Vuelo
INSERT INTO Boleto_Vuelo (compra_co_cod, vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, clase_asiento_ca_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'AA100' LIMIT 1),
	    600.00 * 2 + (SELECT ca_costo FROM Clase_Asiento WHERE ca_nombre = 'Economy Plus' LIMIT 1),
	    FALSE,
	    2,
	    (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Plus' LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 1;

-- Insertar Traslado
INSERT INTO Detalle_Traslado (compra_co_cod, traslado_s_cod, res_costo_sub_total, res_anulado, dt_fecha_hora, automovil_mt_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Traslado WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1) LIMIT 1),
	    50.00 + ((SELECT a_costo_por_km FROM Automovil WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1) LIMIT 1)*(SELECT t_distancia_km FROM Traslado WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1) LIMIT 1)),
	    FALSE,
	    c.co_fecha_hora + interval '5 hours',
	    (SELECT mt_cod FROM Automovil WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Greyhound Lines' LIMIT 1) LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 1;


-- Insertar Vuelo (Conexión)
INSERT INTO Boleto_Vuelo (compra_co_cod, vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, clase_asiento_ca_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'Y4900' LIMIT 1),
	    250.00 * 2 + (SELECT ca_costo FROM Clase_Asiento WHERE ca_nombre = 'Economy Basic' LIMIT 1),
	    FALSE,
	    2,
	    (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Basic' LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 2;

-- Insertar Crucero
INSERT INTO Boleto_Viaje (compra_co_cod, viaje_s_cod, res_costo_sub_total, res_anulado, bvi_cant_pasajeros, tipo_camarote_tc_cod, servicio_barco_sb_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Viaje WHERE barco_mt_cod = (SELECT mt_cod FROM Barco WHERE b_nombre = 'Symphony of the Seas' LIMIT 1) LIMIT 1),
	    1200.00 * 2 + (SELECT sb_costo FROM Servicio_Barco WHERE sb_descripcion LIKE 'Paquete de Bebidas%' LIMIT 1) + (SELECT tc_costo FROM Tipo_Camarote WHERE tc_nombre = 'Balcón Deluxe' LIMIT 1),
	    FALSE,
	    2,
	    (SELECT tc_cod FROM Tipo_Camarote WHERE tc_nombre = 'Balcón Deluxe' LIMIT 1),
	    (SELECT sb_cod FROM Servicio_Barco WHERE sb_descripcion LIKE 'Paquete de Bebidas%' LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 2;

-- Insertar Vuelo
INSERT INTO Boleto_Vuelo (compra_co_cod, vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, clase_asiento_ca_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Vuelo WHERE v_cod_vue = 'JL016' LIMIT 1),
	    1200.00 * 2 + (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1),
	    FALSE,
	    2,
	    (SELECT ca_cod FROM Clase_Asiento WHERE ca_nombre = 'Economy Standard' LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 3;

-- Insertar Entrada Digital
INSERT INTO Entrada_Digital (compra_co_cod, servicio_adicional_s_cod, res_costo_sub_total, res_anulado, ed_cant_personas, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Servicio_Adicional WHERE sa_nombre LIKE 'Entrada 1 Día%' LIMIT 1),
	    150.00 * 2,
	    FALSE,
	    2,
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 3;

-- Insertar Hotel
INSERT INTO Detalle_Hospedaje (compra_co_cod, habitacion_s_cod, res_costo_sub_total, res_anulado, dh_cant_noches, dh_fecha_hora_check_in, dh_fecha_hora_check_out, dh_fecha_hora_out_real, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Habitacion WHERE ha_numero = '402' LIMIT 1),
	    450.00 * 3,
	    FALSE,
	    3,
	    c.co_fecha_hora + interval '1 day',
	    c.co_fecha_hora + interval '4 days',
	    NULL,
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 4;

-- Insertar Traslado
INSERT INTO Detalle_Traslado (compra_co_cod, traslado_s_cod, res_costo_sub_total, res_anulado, dt_fecha_hora, automovil_mt_cod, tasa_cambio_tca_cod)
	SELECT 
	    c.co_cod,
	    (SELECT s_cod FROM Traslado WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1) LIMIT 1),
	    55.00 + ((SELECT a_costo_por_km FROM Automovil WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1) LIMIT 1)*(SELECT t_distancia_km FROM Traslado WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1) LIMIT 1)),
	    FALSE,
	    c.co_fecha_hora + interval '2 hours',
	    (SELECT mt_cod FROM Automovil WHERE transporte_terrestre_p_cod = (SELECT p_cod FROM Transporte_Terrestre WHERE p_nombre = 'Viação Itapemirim' LIMIT 1) LIMIT 1),
	    (SELECT tca_cod FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' AND tca_fecha_hora_fin IS NULL LIMIT 1)
	FROM Compra c WHERE c.co_cod % 5 = 4;	

INSERT INTO Via_Res (viajero_via_cod, boleto_vuelo_co_cod, boleto_vuelo_s_cod)
	SELECT 
	    v.via_cod, bv.compra_co_cod, bv.vuelo_s_cod
	FROM Boleto_Vuelo bv
	JOIN Viajero v ON v.via_s_nombre = CAST(bv.compra_co_cod AS VARCHAR);

INSERT INTO Via_Res (viajero_via_cod, detalle_traslado_co_cod, detalle_traslado_s_cod)
	SELECT 
	    v.via_cod, dt.compra_co_cod, dt.traslado_s_cod
	FROM Detalle_Traslado dt
	JOIN Viajero v ON v.via_s_nombre = CAST(dt.compra_co_cod AS VARCHAR);

INSERT INTO Via_Res (viajero_via_cod, boleto_viaje_co_cod, boleto_viaje_s_cod)
	SELECT 
	    v.via_cod, bvi.compra_co_cod, bvi.viaje_s_cod
	FROM Boleto_Viaje bvi
	JOIN Viajero v ON v.via_s_nombre = CAST(bvi.compra_co_cod AS VARCHAR);

INSERT INTO Via_Res (viajero_via_cod, entrada_digital_co_cod, entrada_digital_s_cod)
	SELECT 
	    v.via_cod, ed.compra_co_cod, ed.servicio_adicional_s_cod
	FROM Entrada_Digital ed
	JOIN Viajero v ON v.via_s_nombre = CAST(ed.compra_co_cod AS VARCHAR);

INSERT INTO Via_Res (viajero_via_cod, detalle_hospedaje_co_cod, detalle_hospedaje_s_cod)
	SELECT 
	    v.via_cod, dh.compra_co_cod, dh.habitacion_s_cod
	FROM Detalle_Hospedaje dh
	JOIN Viajero v ON v.via_s_nombre = CAST(dh.compra_co_cod AS VARCHAR);	

UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ricky', 'Devy', 'Dover', null, 'rnoel0@boston.com', '1980-07-15') 								WHERE via_cod = 1;                                   
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Byrle', 'Morgun', 'Geharke', 'Bartleman', 'bbartleman1@spotify.com', '2005-10-03') 				WHERE via_cod = 2;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Rurik', null, 'Gorst', null, 'rbuckner2@utexas.edu', '1993-12-11') 								WHERE via_cod = 3;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Hastings', 'Redford', 'Brightwell', 'Hughlin', 'hhughlin3@blogs.com', '1992-09-23') 				WHERE via_cod = 4;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Tammy', 'Joanna', 'Broadey', 'enzley', 'tenzley4@netvibes.com', '1993-04-20') 					WHERE via_cod = 5;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Hector', 'Ingram', 'O''Caine', null, 'hvedeniktov5@dedecms.com', '2000-11-19')                    WHERE via_cod = 6;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Jule', null, 'Amthor', null, 'jarnaudin6@360.cn', '1988-07-06')                                   WHERE via_cod = 7;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Natale', null, 'Joseland', 'Lenz', 'nlenz7@pinterest.com', '1992-04-18')                          WHERE via_cod = 8;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Elliott', null, 'Greenig', 'Gooderridge', 'egooderridge8@scientificamerican.com', '1989-12-18')   WHERE via_cod = 9;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Huntlee', null, 'Rosenzwig', 'Teideman', 'hteideman9@reverbnation.com', '1996-11-11')             WHERE via_cod = 10;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Shannon', 'Xena', 'Sharman', 'Parrin', 'sparrina@admin.ch', '1985-06-16')                         WHERE via_cod = 11;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('West', 'Sondra', 'Hawthorne', 'Marusic', 'wmarusicb@imgur.com', '1982-03-09')                     WHERE via_cod = 12;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ewan', null, 'Piken', null, 'eworboysc@hhs.gov', '1998-03-13')                                    WHERE via_cod = 13;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Willem', 'Alanna', 'Darrigoe', 'Berthel', 'wbertheld@utexas.edu', '1987-08-20')                   WHERE via_cod = 14;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Eddy', null, 'Hengoed', 'Ramlot', 'eramlote@techcrunch.com', '1992-07-22')                        WHERE via_cod = 15;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Robby', null, 'Blaney', 'Loisi', 'rloisif@miitbeian.gov.cn', '1986-08-09')                        WHERE via_cod = 16;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Matt', 'Gustav', 'Lombard', 'Crabbe', 'mcrabbeg@edublogs.org', '1983-09-29')                      WHERE via_cod = 17;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Antonio', 'Ruby', 'Burdikin', 'Raubheim', 'araubheimh@huffingtonpost.com', '1999-03-20')          WHERE via_cod = 18;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Carly', 'Northrup', 'Heinle', 'Helmke', 'chelmkei@jigsy.com', '2000-04-15')                       WHERE via_cod = 19;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Bartholemy', null, 'Norville', 'Cribbin', 'bcribbinj@tripadvisor.com', '1986-08-10')              WHERE via_cod = 20;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Yves', 'Rozalie', 'Deary', 'Fraschetti', 'yfraschettik@ameblo.jp', '1999-02-09')                  WHERE via_cod = 21;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lorenzo', 'Hilliary', 'Stickley', 'Wimbridge', 'lwimbridgel@ameblo.jp', '1980-10-26')             WHERE via_cod = 22;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Winifield', 'Mordecai', 'Lauder', null, 'wdunseithm@goo.ne.jp', '1992-05-18')                     WHERE via_cod = 23;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Kristian', 'Alta', 'Haking', 'Gillooly', 'kgilloolyn@jimdo.com', '1992-01-11')                    WHERE via_cod = 24;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lenci', 'Lila', 'Pays', 'Glendinning', 'lglendinningo@walmart.com', '1983-09-08')                 WHERE via_cod = 25;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Davidson', null, 'Clayfield', null, 'dkennerp@about.me', '2002-02-18')                            WHERE via_cod = 26;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Rawley', 'Edan', 'Czajkowska', 'Spatoni', 'rspatoniq@cbsnews.com', '1992-05-26')                  WHERE via_cod = 27;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Spencer', 'Zola', 'Huttley', 'Chason', 'schasonr@oakley.com', '1985-08-18')                       WHERE via_cod = 28;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Hobart', 'Jacques', 'Neeves', 'Reuther', 'hreuthers@dropbox.com', '1996-09-30')                   WHERE via_cod = 29;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Codi', 'Harriet', 'Digg', 'Szachniewicz', 'cszachniewiczt@cafepress.com', '1983-02-24')           WHERE via_cod = 30;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Archer', 'Celestina', 'Tanswell', 'Spillard', 'aspillardu@reverbnation.com', '1990-05-28')        WHERE via_cod = 31;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ban', null, 'Emmanuel', 'Zorzenoni', 'bzorzenoniv@google.com', '1980-06-12')                      WHERE via_cod = 32;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Gaby', null, 'Stalley', 'Allport', 'gallportw@indiegogo.com', '1998-11-10')                       WHERE via_cod = 33;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Shannan', 'Leyla', 'Abley', 'Rangell', 'srangellx@china.com.cn', '1995-08-19')                    WHERE via_cod = 34;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Park', 'Kristoforo', 'Forte', 'Guymer', 'pguymery@i2i.jp', '1987-09-07')                          WHERE via_cod = 35;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Orv', null, 'Smallman', 'Lenard', 'olenardz@seesaa.net', '1981-05-03')                            WHERE via_cod = 36;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Clement', 'Graham', 'Shields', 'Duigan', 'cduigan10@w3.org', '1990-09-09')                        WHERE via_cod = 37;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Forester', null, 'Durrett', 'Matteau', 'fmatteau11@cdbaby.com', '1988-12-08')                     WHERE via_cod = 38;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Artemis', null, 'Zavattieri', 'Dogerty', 'adogerty12@nationalgeographic.com', '1998-10-10')       WHERE via_cod = 39;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Jarid', 'Jackie', 'Cashmore', null, 'jingledew13@canalblog.com', '2002-01-17')                    WHERE via_cod = 40;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Carrol', 'Nye', 'Keslake', null, 'cchittim14@networkadvertising.org', '2000-02-16')               WHERE via_cod = 41;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Jacques', 'Skye', 'Jannings', 'Komorowski', 'jkomorowski15@cyberchimps.com', '2000-08-30')        WHERE via_cod = 42;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Tore', 'Wilone', 'Durand', 'Dobell', 'tdobell16@arstechnica.com', '1997-06-18')                   WHERE via_cod = 43;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Care', 'Heath', 'Retallick', 'Pilmoor', 'cpilmoor17@tuttocitta.it', '1988-09-05')                 WHERE via_cod = 44;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Harv', null, 'Kleinpeltz', 'Etheridge', 'hetheridge18@salon.com', '2002-02-26')                   WHERE via_cod = 45;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Reuben', 'Judd', 'Craxford', 'Chipp', 'rchipp19@irs.gov', '1987-11-22')                           WHERE via_cod = 46;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Sigfried', 'Abramo', 'Walklot', 'Skipper', 'sskipper1a@wordpress.org', '1995-10-19')              WHERE via_cod = 47;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Farleigh', 'Happy', 'Passingham', 'Lindholm', 'flindholm1b@census.gov', '1992-04-28')             WHERE via_cod = 48;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Bertram', null, 'Torpie', 'Collerd', 'bcollerd1c@mapquest.com', '1996-10-11')                     WHERE via_cod = 49;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ursula', 'Brit', 'Checketts', 'Hanbury', 'uhanbury0@netvibes.com', '2005-05-14')                  WHERE via_cod = 50;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Maressa', 'Adelina', 'Squeers', 'Pockett', 'mpockett1@upenn.edu', '2004-11-18')                   WHERE via_cod = 51;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Flss', 'Didi', 'Brightling', 'Menico', 'fmenico2@paginegialle.it', '1998-06-18')                  WHERE via_cod = 52;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ingunna', 'Joya', 'Mertgen', 'Suett', 'isuett3@paypal.com', '1992-05-23')                         WHERE via_cod = 53;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Marysa', 'Luella', 'Stallibrass', 'Handasyde', 'mhandasyde4@netvibes.com', '1995-08-13')          WHERE via_cod = 54;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Bridie', null, 'Bettenay', null, 'bjendrys5@bandcamp.com', '1987-09-30')                          WHERE via_cod = 55;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Leah', 'Abner', 'Gheorghe', 'Hazelgreave', 'lhazelgreave6@issuu.com', '2001-09-13')               WHERE via_cod = 56;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Katharina', 'Nanette', 'Tumioto', 'Hugnin', 'khugnin7@pen.io', '2005-08-22')                      WHERE via_cod = 57;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Maible', 'Stanley', 'Mathon', 'Dobby', 'mdobby8@wired.com', '1988-07-18')                         WHERE via_cod = 58;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lilia', 'Jamill', 'Laughnan', 'Bannester', 'lbannester9@globo.com', '1989-08-13')                 WHERE via_cod = 59;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Andrei', 'Carmita', 'Symcock', 'Witten', 'awittena@vk.com', '1992-05-10')                         WHERE via_cod = 60;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Mariejeanne', null, 'Rivard', 'Gioani', 'mgioanib@istockphoto.com', '1981-03-26')                 WHERE via_cod = 61;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Herminia', 'Peirce', 'Shearwood', 'Portwaine', 'hportwainec@jugem.jp', '1995-05-01')              WHERE via_cod = 62;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ranee', null, 'Bompass', 'Walczak', 'rwalczakd@free.fr', '2000-01-04')                            WHERE via_cod = 63;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Zulema', null, 'Leney', 'Yeaman', 'zyeamane@mozilla.com', '2001-12-23')                           WHERE via_cod = 64;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Vanni', 'Inglebert', 'Timeby', 'Cargill', 'vcargillf@auda.org.au', '1986-02-24')                  WHERE via_cod = 65;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Saidee', 'Gwyn', 'Coultas', 'Ellsworthe', 'sellswortheg@biglobe.ne.jp', '1993-09-28')             WHERE via_cod = 66;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Bria', 'Brear', 'Hooke', 'Goslin', 'bgoslinh@pbs.org', '2003-01-17')                              WHERE via_cod = 67;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ilka', 'Ivar', 'Roscoe', 'Robb', 'irobbi@1688.com', '1991-08-11')                                 WHERE via_cod = 68;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Marcelia', 'Fenelia', 'Filippucci', null, 'mgrandj@freewebs.com', '1990-03-27')                   WHERE via_cod = 69;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Valida', null, 'McKinna', null, 'vsimpkissk@samsung.com', '1999-02-27')                           WHERE via_cod = 70;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Marian', 'Kattie', 'Langrick', 'Tregian', 'mtregianl@mail.ru', '1998-11-05')                      WHERE via_cod = 71;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Marcia', null, 'Cooper', 'Runnicles', 'mrunniclesm@epa.gov', '2004-10-24')                        WHERE via_cod = 72;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Julita', null, 'Crumpe', 'Rubinovici', 'jrubinovicin@shop-pro.jp', '1996-09-15')                  WHERE via_cod = 73;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Darcy', 'Torrin', 'Paszek', null, 'dshallo@theglobeandmail.com', '1983-07-27')                    WHERE via_cod = 74;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Delcina', null, 'Poon', 'Trusse', 'dtrussep@bing.com', '1991-03-22')                              WHERE via_cod = 75;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Fanchette', 'Mirabella', 'Hanshawe', 'Perrygo', 'fperrygoq@jiathis.com', '1996-06-18')            WHERE via_cod = 76;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Timmi', null, 'Sibley', 'Yesenin', 'tyeseninr@ustream.tv', '1991-01-16')                          WHERE via_cod = 77;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Barbe', 'Nettie', 'Pietri', 'Thring', 'bthrings@columbia.edu', '2000-11-21')                      WHERE via_cod = 78;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Cherry', null, 'Rosenstock', 'Dartan', 'cdartant@amazon.de', '1984-01-26')                        WHERE via_cod = 79;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Jermaine', 'Orelie', 'Quigg', 'Fearby', 'jfearbyu@who.int', '1997-10-15')                         WHERE via_cod = 80;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Wendie', null, 'Kruschev', 'Meneur', 'wmeneurv@time.com', '1986-09-16')                           WHERE via_cod = 81;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Amelie', 'Lurleen', 'Edison', 'Buston', 'abustonw@tumblr.com', '1997-10-21')                      WHERE via_cod = 82;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Jsandye', 'Alyson', 'Ladel', null, 'joveyx@scribd.com', '2002-02-06')                             WHERE via_cod = 83;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Abbye', null, 'Ben', 'Cressy', 'acressyy@bandcamp.com', '1983-02-26')                             WHERE via_cod = 84;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lurette', 'Kimmi', 'Beltzner', 'Prestner', 'lprestnerz@dell.com', '2005-09-06')                   WHERE via_cod = 85;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Merissa', 'Niven', 'Goudard', 'Van Velden', 'mvanvelden10@youtube.com', '1991-01-16')             WHERE via_cod = 86;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Marketa', 'Lonnie', 'Garton', 'Gligorijevic', 'mgligorijevic11@biglobe.ne.jp', '1995-11-26')      WHERE via_cod = 87;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Elbertina', null, 'Balcombe', null, 'ethreadgould12@ning.com', '1995-07-20')                      WHERE via_cod = 88;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Xylia', null, 'Yurkin', 'Delahunty', 'xdelahunty13@apache.org', '1997-11-17')                     WHERE via_cod = 89;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Janna', 'Cross', 'Heal', 'Kubala', 'jkubala14@disqus.com', '2004-04-16')                          WHERE via_cod = 90;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Carmelina', 'Daveen', 'Cunrado', 'Trahar', 'ctrahar15@wisc.edu', '2003-06-07')                    WHERE via_cod = 91;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lucine', 'Connie', 'Bartlomiejczyk', 'Urwen', 'lurwen16@spotify.com', '1996-02-05')               WHERE via_cod = 92;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ermina', null, 'McComb', null, 'emarriott17@goo.ne.jp', '2001-05-09')                             WHERE via_cod = 93;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Ronny', 'Erasmus', 'Gaffey', 'Scarsbrick', 'rscarsbrick18@uiuc.edu', '1998-11-30')                WHERE via_cod = 94;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Cacilie', 'Ragnar', 'Tresler', 'Danaher', 'cdanaher19@comcast.net', '1985-12-17')                 WHERE via_cod = 95;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Florida', null, 'Seviour', 'Graffin', 'fgraffin1a@plala.or.jp', '2001-03-21')                     WHERE via_cod = 96;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Olive', 'Carlye', 'Cubbinelli', 'Goman', 'ogoman1b@vistaprint.com', '1986-11-12')                 WHERE via_cod = 97;
UPDATE Viajero SET (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento) = ('Lexis', 'Sherwin', 'Harlick', null, 'lkasting1c@cbsnews.com', '1983-01-21')                       WHERE via_cod = 98;

WITH Calculos_Compra AS (
    SELECT 
        co_cod_calc,
        SUM(monto_parcial) AS total_monto_calculado,
        SUM(millas_parcial) AS total_millas_calculadas
    FROM (
        -- BOLETO VUELO
        SELECT 
            compra_co_cod AS co_cod_calc, 
            res_costo_sub_total AS monto_parcial, 
            s.s_millas_otorgar AS millas_parcial
        FROM Boleto_Vuelo bv
        JOIN Servicio s ON bv.vuelo_s_cod = s.s_cod

        UNION ALL

        -- BOLETO VIAJE
        SELECT 
            compra_co_cod, 
            res_costo_sub_total, 
            s.s_millas_otorgar
        FROM Boleto_Viaje bvi
        JOIN Servicio s ON bvi.viaje_s_cod = s.s_cod

        UNION ALL

        -- DETALLE TRASLADO
        SELECT 
            compra_co_cod, 
            res_costo_sub_total, 
            s.s_millas_otorgar
        FROM Detalle_Traslado dt
        JOIN Servicio s ON dt.traslado_s_cod = s.s_cod

        UNION ALL

        -- DETALLE HOSPEDAJE
        SELECT 
            compra_co_cod, 
            res_costo_sub_total, 
            s.s_millas_otorgar
        FROM Detalle_Hospedaje dh
        JOIN Servicio s ON dh.habitacion_s_cod = s.s_cod

        UNION ALL

        -- ENTRADA DIGITAL
        SELECT 
            compra_co_cod, 
            res_costo_sub_total, 
            s.s_millas_otorgar
        FROM Entrada_Digital ed
        JOIN Servicio s ON ed.servicio_adicional_s_cod = s.s_cod
    ) t
    GROUP BY co_cod_calc
)
UPDATE Compra c SET co_monto_total = calc.total_monto_calculado + c.co_compensacion_huella, co_millas_a_agregar = calc.total_millas_calculadas
FROM Calculos_Compra calc
WHERE c.co_cod = calc.co_cod_calc;

INSERT INTO Deseo_Paquete VALUES (1, 1), (1, 7), (10, 4), (10, 5), (3, 49), (4, 49), (2, 27), (6, 36), (9, 33), (2, 2);
INSERT INTO Deseo_Servicio VALUES (9, 1), (10, 1), (11, 1), (23, 49), (17, 31), (18, 25), (7, 7), (20, 40), (21, 40), (10, 10);

INSERT INTO Tipo_Documento (td_nombre) VALUES
    ('Pasaporte'),
    ('Cédula de Identidad'),
    ('Visa de Turista'),
    ('Licencia de Conducir'),
    ('Certificado de Vacunación Internacional'),
    ('Seguro de Viaje'),
    ('Permiso de Viaje para Menores'),
    ('Tarjeta de Embarque (Boarding Pass)'),
    ('Comprobante de Pago'),
    ('Constancia de Reserva');

INSERT INTO Documento (do_descripcion, do_nombre_archivo, tipo_documento_td_cod, cliente_c_cod) VALUES
    ('Escaneo página principal pasaporte vigente', 'pasaporte_pguarulla.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Pasaporte' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 15890123 LIMIT 1)),

    ('Visa B1/B2 aprobada para viaje a Los Angeles', 'visa_usa_aurbaneja.jpg', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Visa de Turista' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 24567123 LIMIT 1)),

    ('Cédula laminada vigente', 'cedula_sbolivar.png', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Cédula de Identidad' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 16234567 LIMIT 1)),

    ('Licencia de conducir de 3ra grado', 'licencia_mtorres.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Licencia de Conducir' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 14560981 LIMIT 1)),

    ('Certificado internacional para viaje a Brasil', 'fiebre_amarilla_mnieves.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Certificado de Vacunación Internacional' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 19876543 LIMIT 1)),

    ('Póliza de seguro cobertura amplia Europa', 'seguro_placava.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Seguro de Viaje' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 25678901 LIMIT 1)),

    ('Boleto aéreo digital ida y vuelta', 'boarding_dpastora.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Tarjeta de Embarque (Boarding Pass)' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 20456789 LIMIT 1)),

    ('Permiso notariado para viaje con un solo padre', 'permiso_menor_ydiaz.jpg', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Permiso de Viaje para Menores' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 21450987 LIMIT 1)),

    ('Comprobante de transferencia bancaria paquete turístico', 'pago_msaenz.png', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Comprobante de Pago' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 25123456 LIMIT 1)),

    ('Pasaporte prórroga activa', 'pasaporte_lbarinas.pdf', 
     (SELECT td_cod FROM Tipo_Documento WHERE td_nombre = 'Pasaporte' LIMIT 1),
     (SELECT c_cod FROM Cliente WHERE c_ci = 20987123 LIMIT 1));	

INSERT INTO Banco (ba_nombre) VALUES
    ('Banco de Venezuela'),
    ('Banesco'),
    ('Banco Mercantil'),
    ('BBVA Provincial'),
    ('Bancamiga'),
    ('Banco Nacional de Crédito (BNC)'),
    ('Bank of America'),
    ('JPMorgan Chase'),
    ('Wells Fargo'),
    ('Santander');	 

INSERT INTO Reembolso (ree_razon, ree_fecha_hora, boleto_vuelo_co_cod, boleto_vuelo_s_cod, 
												  detalle_traslado_co_cod, detalle_traslado_s_cod, 
												  boleto_viaje_co_cod, boleto_viaje_s_cod, 
												  entrada_digital_co_cod, entrada_digital_s_cod, 
												  detalle_hospedaje_co_cod, detalle_hospedaje_s_cod) VALUES
    ('Cancelación voluntaria del cliente por motivos personales', '2025-11-05 09:30:00', null, null, 21, 13, null, null, null, null, null, null),
    ('Servicio cancelado por el operador debido a mantenimiento', '2025-11-10 14:15:00', null, null, null, null, null, null, null, null, 45, 41),
    ('Error en el cobro duplicado de la tarjeta de crédito', '2025-11-12 11:00:00', 10, 1, null, null, null, null, null, null, null, null),
    ('Emergencia médica comprobada del titular', '2025-11-20 08:45:00', null, null, 4, 19, null, null, null, null, null, null),
    ('Cambio de itinerario mayor a 4 horas no aceptado', '2025-11-25 16:20:00', null, null, null, null, null, null, 3, 32, null, null),
    ('Fuerza mayor / Condiciones climáticas adversas', '2025-12-01 10:10:00', null, null, null, null, null, null, 8, 32, null, null),
    ('Reembolso parcial por servicio incompleto', '2025-12-05 13:00:00', null, null, null, null, null, null, 23, 32, null, null),
    ('Denegación de visado o documentos de entrada', '2025-12-08 09:00:00', 21, 2, null, null, null, null, null, null, null, null),
    ('Sobreventa (Overbooking) por parte del proveedor', '2025-12-12 18:30:00', 18, 3, null, null, null, null, null, null, null, null),
    ('Desistimiento dentro del plazo legal de retracto', '2025-12-15 15:00:00', null, null, 46, 13, null, null, null, null, null, null);

INSERT INTO Queja (q_descripcion, q_resuelta, empleado_e_cod, boleto_vuelo_co_cod, boleto_vuelo_s_cod, 
												  			  detalle_traslado_co_cod, detalle_traslado_s_cod, 
												  			  boleto_viaje_co_cod, boleto_viaje_s_cod, 
												 			  entrada_digital_co_cod, entrada_digital_s_cod, 
												  			  detalle_hospedaje_co_cod, detalle_hospedaje_s_cod) VALUES
    ('Retraso significativo en el horario de inicio del servicio sin previo aviso.', TRUE, 1, null, null, null, null, null, null, null, null, 45, 41),
    ('Las instalaciones no cumplían con los estándares de higiene mostrados en fotos.', FALSE, 1, null, null, 4, 19, null, null, null, null, null, null),
    ('El personal de atención tuvo un trato descortés al momento del registro.', TRUE, 3, 18, 3, null, null, null, null, null, null, null, null),
    ('Se realizaron cobros adicionales no especificados en la reserva original.', FALSE, 4, 7, 10, null, null, null, null, null, null, null, null),
    ('Pérdida temporal de equipaje o pertenencias bajo custodia del operador.', TRUE, 8, null, null, null, null, 32, 21, null, null, null, null),
    ('El aire acondicionado o climatización no funcionaba correctamente.', TRUE, 5, 38, 3, null, null, null, null, null, null, null, null),
    ('La comida ofrecida estaba en mal estado o no correspondía al menú.', FALSE, 5, null, null, null, null, null, null, 28, 32, null, null),
    ('Ruidos excesivos impidieron el descanso durante el servicio.', TRUE, 5, null, null, null, null, null, null, 23, 32, null, null),
    ('No se entregaron los beneficios VIP prometidos en el paquete.', FALSE, 7, null, null, null, null, 22, 21, null, null, null, null),
    ('Dificultad para acceder a las instalaciones (falta de accesibilidad).', TRUE, 10, null, null, null, null, null, null, null, null, 5, 41);

INSERT INTO Resena (r_calificacion, r_comentario, boleto_vuelo_co_cod, boleto_vuelo_s_cod, 
												  detalle_traslado_co_cod, detalle_traslado_s_cod, 
												  boleto_viaje_co_cod, boleto_viaje_s_cod, 
												  entrada_digital_co_cod, entrada_digital_s_cod, 
												  detalle_hospedaje_co_cod, detalle_hospedaje_s_cod) VALUES
    (10, 'Una experiencia inolvidable, todo salió perfecto y el servicio fue de primera.', null, null, null, null, null, null, null, null, 9, 46),
    (8, 'Muy buen servicio en general, aunque el proceso de check-in fue un poco lento.', null, null, null, null, null, null, null, null, 10, 41),
    (5, 'La experiencia fue promedio. Cumplieron con lo básico pero no hubo nada especial.', 15, 1, null, null, null, null, null, null, null, null),
    (2, 'Terrible organización. Nadie sabía darnos información y perdimos mucho tiempo.', 20, 1, null, null, null, null, null, null, null, null),
    (9, 'Excelente relación calidad-precio. Sin duda volvería a contratar este servicio.', null, null, 29, 19, null, null, null, null, null, null),
    (7, 'El lugar es bonito y cómodo, pero la atención al cliente podría mejorar.', 33, 3, null, null, null, null, null, null, null, null),
    (0, 'La peor experiencia de mi vida. Todo salió mal desde el principio. No lo recomiendo.', null, null, null, null, 7, 21, null, null, null, null),
    (10, 'Superó mis expectativas. La atención a los detalles marcó la diferencia.', null, null, 16, 13, null, null, null, null, null, null),
    (6, 'Aceptable, pero las instalaciones se ven un poco descuidadas para el precio.', null, null, null, null, null, null, null, null, 35, 41),
    (4, 'No volvería. Hubo muchos problemas de logística que arruinaron el momento.', 22, 10, null, null, null, null, null, null, null, null);	

INSERT INTO Metodo_Pago (Cliente_c_cod, mp_tipo, t_numero, t_cod_seguridad, t_nombre_titular, t_fecha_vencimiento, t_Banco_cod, t_emisor) VALUES
    (1, 'TARJETA', 4123456789012345, 123, 'PEDRO GUARULLA', '2028-12-01', (SELECT ba_cod FROM Banco WHERE ba_nombre = 'Banco de Venezuela' LIMIT 1), 'VISA'),
    (2, 'TARJETA', 5432109876543210, 456, 'PATRICIA LACAVA', '2029-06-30', (SELECT ba_cod FROM Banco WHERE ba_nombre = 'Bank of America' LIMIT 1), 'MASTERCARD');

INSERT INTO Metodo_Pago (Cliente_c_cod, mp_tipo, c_codigo_cuenta, c_numero, c_Banco_cod, c_fecha_emision) VALUES
    (3, 'CHEQUE', 010500001122334, 5000001, (SELECT ba_cod FROM Banco WHERE ba_nombre = 'Banco Mercantil' LIMIT 1), '2025-11-01'),
    (4, 'CHEQUE', 010800009988776, 9000002, (SELECT ba_cod FROM Banco WHERE ba_nombre = 'BBVA Provincial' LIMIT 1), '2025-11-05');

INSERT INTO Metodo_Pago (Cliente_c_cod, mp_tipo, de_num_referencia, de_num_destino, de_Banco_cod) VALUES
    (5, 'DEPOSITO', 111222333, 013400001234567, (SELECT ba_cod FROM Banco WHERE ba_nombre = 'Banesco' LIMIT 1)),
    (6, 'DEPOSITO', 444555666, 019100009876543, (SELECT ba_cod FROM Banco WHERE ba_nombre = 'Banco Nacional de Crédito (BNC)' LIMIT 1));

INSERT INTO Metodo_Pago (Cliente_c_cod, mp_tipo, od_num_referencia) VALUES
    (7, 'OPERACION_DIGITAL', 987654321),
    (8, 'OPERACION_DIGITAL', 123456789);

INSERT INTO Metodo_Pago (Cliente_c_cod, mp_tipo, u_hash_id, u_direccion_billetera) VALUES
    (9, 'USDT', '0xabc123def4567890abcdef1234567890abcdef12', 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t'),
    (10, 'USDT', '0x999888777666555444333222111000aaabbbccc', 'T9yD14Nj9j7xAB4dbGeiX9h8ipGzTz8t');

INSERT INTO Metodo_Pago (cliente_c_cod, mp_tipo, de_num_referencia, de_num_destino, de_banco_cod) VALUES	
	(11, 'DEPOSITO', 188571306, 600447932188082, 4),
	(12, 'DEPOSITO', 502203270, 814668413468281, 5),
	(13, 'DEPOSITO', 404729062, 958386752295964, 7),
	(14, 'DEPOSITO', 622550378, 532395037731326, 3),
	(15, 'DEPOSITO', 206461737, 362772377633043, 7),
	(16, 'DEPOSITO', 606589268, 783313382558405, 10),
	(17, 'DEPOSITO', 199041825, 326456347774908, 7),
	(18, 'DEPOSITO', 819086855, 944425687993620, 4),
	(19, 'DEPOSITO', 297806845, 233525313485802, 9),
	(20, 'DEPOSITO', 789317165, 493688292757358, 9),
	(21, 'DEPOSITO', 643731915, 144742617181517, 6),
	(22, 'DEPOSITO', 475982407, 573554413725175, 8),
	(23, 'DEPOSITO', 919201536, 253507437359908, 7),
	(24, 'DEPOSITO', 294496244, 525083746040916, 6),
	(25, 'DEPOSITO', 813540037, 356680983931447, 6),
	(26, 'DEPOSITO', 345857280, 825869263129911, 5),
	(27, 'DEPOSITO', 580645054, 965297549753028, 6),
	(28, 'DEPOSITO', 957654618, 627924603385419, 7),
	(29, 'DEPOSITO', 279815869, 148830136186485, 6),
	(30, 'DEPOSITO', 913450030, 836392466072077, 3);

INSERT INTO Metodo_Pago (cliente_c_cod, mp_tipo, od_num_referencia) VALUES
	(31, 'OPERACION_DIGITAL', 486895067),
	(32, 'OPERACION_DIGITAL', 616172069),
	(33, 'OPERACION_DIGITAL', 913582373),
	(34, 'OPERACION_DIGITAL', 302960660),
	(35, 'OPERACION_DIGITAL', 609001691),
	(36, 'OPERACION_DIGITAL', 389130750),
	(37, 'OPERACION_DIGITAL', 438245829),
	(38, 'OPERACION_DIGITAL', 449906763),
	(39, 'OPERACION_DIGITAL', 492291221),
	(40, 'OPERACION_DIGITAL', 185941812),
	(41, 'OPERACION_DIGITAL', 960375375),
	(42, 'OPERACION_DIGITAL', 917005061),
	(43, 'OPERACION_DIGITAL', 587375157),
	(44, 'OPERACION_DIGITAL', 639911171),
	(45, 'OPERACION_DIGITAL', 796423056),
	(46, 'OPERACION_DIGITAL', 128311401),
	(47, 'OPERACION_DIGITAL', 982834726),
	(48, 'OPERACION_DIGITAL', 881190331),
	(49, 'OPERACION_DIGITAL', 752560150);

INSERT INTO Pago 
SELECT co.co_monto_total, co.co_fecha_hora, co.co_cod, mp.mp_cod 
FROM Compra co, Cliente c, Metodo_Pago mp
WHERE mp.mp_cod NOT BETWEEN 1 AND 49 AND c.c_cod = co.cliente_c_cod AND c.c_cod = mp.cliente_c_cod;  

INSERT INTO Auditoria (a_tipo_accion_realizada, a_tabla_afectada, a_fecha_hora, a_descripcion, usuario_u_cod) VALUES
    ('INSERT', 'Cliente', '2025-11-01 10:15:00', 'Registro de nuevo cliente: Pedro Guarulla desde formulario web', 1),
    ('UPDATE', 'Vuelo', '2025-11-02 08:30:00', 'Actualización de hora de salida vuelo IB6674 por retraso operativo', 1),
    ('DELETE', 'Boleto_Vuelo', '2025-11-03 14:20:00', 'Eliminación física de reserva temporal no pagada #1005', 2),
    ('UPDATE', 'Tasa_Cambio', '2025-11-05 09:00:00', 'Actualización diaria de tasa USD/VES a 60.50', 3),
    ('INSERT', 'Reembolso', '2025-11-06 11:45:00', 'Generación automática de nota de crédito por anulación de vuelo', 1),
    ('UPDATE', 'Habitacion', '2025-11-08 16:10:00', 'Cambio de estado a Mantenimiento: Habitación 505 Eurobuilding', 2),
    ('INSERT', 'Paquete_Turistico', '2025-11-10 10:00:00', 'Creación de nuevo paquete promocional: Luna de Miel en las Alturas', 3),
    ('UPDATE', 'Cliente', '2025-11-12 13:25:00', 'Actualización de datos de contacto (Correo) para cliente Ana Urbaneja', 1),
    ('DELETE', 'Promocion', '2025-11-15 23:59:00', 'Eliminación lógica de promoción vencida: Black Flydays', 2),
    ('INSERT', 'Queja', '2025-11-18 09:15:00', 'Registro de incidente reportado por cliente en mostrador', 2);

INSERT INTO Metodo_Pago (cliente_c_cod, mp_tipo, od_num_referencia) VALUES
	(1, 'OPERACION_DIGITAL', 9283174019),
	(1, 'OPERACION_DIGITAL', 9283174020),
	(1, 'OPERACION_DIGITAL', 8783174020),
	(2, 'OPERACION_DIGITAL', 0192833315),
	(2, 'OPERACION_DIGITAL', 8411118532),
	(3, 'OPERACION_DIGITAL', 7774391751),
	(3, 'OPERACION_DIGITAL', 1442983016),
	(4, 'OPERACION_DIGITAL', 7749289921),
	(4, 'OPERACION_DIGITAL', 8433332855),
	(5, 'OPERACION_DIGITAL', 9283339221),
	(5, 'OPERACION_DIGITAL', 8447392885);

INSERT INTO Cuota (cu_monto, cu_fecha_hora_final, compra_co_cod) VALUES 
	(3173.44, '2025-02-07 17:30:39.529598', 1),
	(3173.44, '2025-03-07 17:30:39.529598', 1),
	(1607.50, '2025-02-14 00:34:53.015431', 2),
	(1607.50, '2025-03-14 00:34:53.015431', 2),
	(1351.00, '2025-02-06 12:36:52.928483', 3),
	(1351.00, '2025-03-06 12:36:52.928483', 3),
	(3581.61, '2025-02-24 02:05:25.263141', 4),
	(3581.61, '2025-03-24 02:05:25.263141', 4),
	(990.00, '2025-02-24 21:09:36.910572', 5),
	(990.00, '2025-03-24 21:09:36.910572', 5);

INSERT INTO Pago_Cuota VALUES
	(1586.72, '2025-02-01 15:00:00', 1, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 9283174019)),
	(1586.72, '2025-02-01 15:07:00', 1, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 9283174020)),
	(3173.44, '2025-02-16 17:24:38', 2, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 8783174020)),
	(1607.50, '2025-02-10 08:17:03', 3, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 0192833315)),
	(1607.50, '2025-02-28 09:45:26', 4, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 8411118532)),
	(1351.00, '2025-02-05 12:12:42', 5, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 7774391751)),
	(1351.00, '2025-02-28 13:04:45', 6, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 1442983016)),
	(3581.61, '2025-02-01 17:22:41', 7, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 7749289921)),
	(3581.61, '2025-02-28 15:07:04', 8, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 8433332855)),
	(990.00, '2025-02-01 17:22:41', 9, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 9283339221)),
	(990.00, '2025-02-28 15:07:04', 10, (SELECT mp_cod FROM Metodo_Pago WHERE od_num_referencia = 8447392885));
	