from __future__ import annotations
from typing import Final
from attr import s, ib
from datetime import datetime

def validar_campo(Campo: str, Valor: float | str) -> bool:
    pass

async def en_base(CVE_usuario: int) -> bool:
    pass

async def CrearUsuario(**Campos) -> int:
    pass

@s(frozen=True)
class Usuario:
    CVE_usuario: int = ib(init=True, type=int)
    PedidoActivo: bool = ib(init=False, type=bool)
    FechaRegistro: datetime = ib(init=False, type=datetime)
    Nombre: str = ib(init=False, type=str)
    ApellidoPaterno: str = ib(init=False, type=str)
    ApellidoMaterno: str = ib(init=False, type=str)
    Correo: str = ib(init=False, type=str)
    Telefono: str = ib(init=False, type=str)
    __usuario_llenado: bool = False
    __en_base: bool = False
    __pedido_activo: bool = False
    __ubicacion_base: Final = "./BaseUsuarios/BaseUsuarios.db"

    def __usuario_usable(self) -> bool:
        pass

    async def llamar_datos(self) -> bool:
        pass

    async def borrar_usuario(self) -> bool:
        pass

    async def actualizar_datos(self, **Campos) -> bool:
        pass