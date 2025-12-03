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
	('Clase Oasis',     (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Chantiers de l''Atlantique')),
    ('Clase Excel',     (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Vista',     (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Fincantieri')),
    ('Clase Quantum',   (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Helios',    (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Concordia', (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Fincantieri')),
    ('Clase Spirit',    (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Meyer Werft')),
    ('Clase Solstice',  (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Kvaerner Masa-Yards')),
    ('Clase Freedom',   (SELECT mav_cod FROM Marca WHERE mav_nombre = 'Kvaerner Masa-Yards')),
    ('Clase Fantasia',  (SELECT mav_cod FROM Marca WHERE mav_nombre = 'STX Europe'));

