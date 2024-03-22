class Producto {
  final String imagen;
  final String titulo;
  final String codigo;
  final double precio;
  final String tipoYTiempoEnvio;
  final String descripcion;

  Producto({
    required this.imagen,
    required this.titulo,
    required this.codigo,
    required this.precio,
    required this.tipoYTiempoEnvio,
    required this.descripcion,
  });
}

class ProductoCarrito extends Producto {
  int cantidad;

  ProductoCarrito({
    required super.imagen,
    required super.titulo,
    required super.codigo,
    required super.precio,
    required super.tipoYTiempoEnvio,
    required super.descripcion,
    required this.cantidad,
  });
}