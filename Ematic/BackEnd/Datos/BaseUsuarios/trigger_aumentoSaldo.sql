DROP TRIGGER IF EXISTS AumentoSaldo;

CREATE TRIGGER IF NOT EXISTS AumentoSaldo
BEFORE INSERT ON ProductosPedido
BEGIN
	UPDATE
		PedidoCliente
	SET Saldo = Saldo + (NEW.PrecioProductos * NEW.Cantidad)
	WHERE PedidoCliente.CVE_Pedido = NEW.CVE_Pedido;
END;