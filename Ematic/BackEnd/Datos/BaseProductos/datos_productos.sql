BEGIN TRANSACTION;

	INSERT OR ROLLBACK INTO Producto(Descripcion) VALUES
	("Fotografia"), ("Banner"), ("Biombo"), ("Album"),
	("Foto book"), ("Videoclip"), ("Secuencia de fotos"),
	("Prueba"), ("Identificacion"), ("Marco de foto");

	INSERT OR ROLLBACK INTO Medidas(Alto, Ancho) VALUES
	(20, 24), (16, 20), (11, 14), (8, 10), (30, 40),
	(5, 7), (3, 3);

	INSERT OR ROLLBACK INTO
		MedidasProducto(CVE_Producto, CVE_Medidas, Precio) VALUES
	(1, 1, 2650), (1, 2, 2150), (1, 3, 1250), (1, 4, 950), (1, 5, 4800),
	(10, 1, 600), (10, 2, 450), (10, 4, 390), (10, 5, 900), (2, NULL, 1200),
	(3, NULL, 1800), (4, NULL, 250), (5, NULL, 3500), (6, NULL, 2500),
	(7, NULL, 1900), (8, 6, 35), (9, 7, 70)
	
COMMIT;