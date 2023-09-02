BEGIN TRANSACTION;

	CREATE TABLE IF NOT EXISTS Cliente(
		CVE_cliente INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		FechaRegistro CHAR(10) DEFAULT (date('now')),
		Nombre VARCHAR(30) NOT NULL,
		ApellidoPaterno VARCHAR(30) NOT NULL,
		ApellidoMaterno VARCHAR(30) NOT NULL,
		Correo VARCHAR(320) NOT NULL,
		Telefono VARCHAR(20) NOT NULL -- Necesario por numeros internacionales
	);

	CREATE TABLE IF NOT EXISTS PedidoCliente(
		CVE_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
		CVE_cliente INTEGER NOT NULL, -- Cliente que hizo el pedido
		CVE_ProductosPedido INTEGER NOT NULL, -- Productos ya que se pueden tener muchos productos
		FechaPedido CHAR(10) DEFAULT (date('now')),
		FechaMinimaEntrega CHAR(10) DEFAULT (date('now', '+1 months')), -- Un mes despues de hacer el pedido
		FechaLimiteEntrega CHAR(10) DEFAULT (date('now', '+1 year')),
		AplicaPenalizacion INT NOT NULL DEFAULT 0,
		Saldo INTEGER DEFAULT 0 NOT NULL,
		CHECK(AplicaPenalizacion IN (0,1)),
		FOREIGN KEY(CVE_cliente)
			REFERENCES Cliente(CVE_cliente),
		FOREIGN KEY(CVE_ProductosPedido)
			REFERENCES ProductosPedido(CVE_ProductosPedido)
	);

	CREATE TABLE IF NOT EXISTS ProductosPedido(
		CVE_ProductosPedido INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		CVE_Pedido INTEGER NOT NULL, -- Conocer de donde viene el pedido
		CVE_MedidasProducto INTEGER NOT NULL, -- Todos los productos productos que tiene pedidos
		Cantidad INTEGER NOT NULL DEFAULT 1,
		PrecioProductos INT NOT NULL,
		CHECK(Cantidad >= 1 AND Cantidad <= 5),
		FOREIGN KEY(CVE_Pedido)
			REFERENCES PedidoCliente(CVE_Pedido)
	);

COMMIT;