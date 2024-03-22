class Producto {
  final String imagen;
  final String titulo;
  final String codigo;
  final double precio;
  final String tipoYTiempoEnvio;

  Producto({
    required this.imagen,
    required this.titulo,
    required this.codigo,
    required this.precio,
    required this.tipoYTiempoEnvio,
  });
}

class ProductoCarrito extends Producto {
  int cantidad;

  ProductoCarrito({
    required super.imagen,
    required super.titulo,
    required super.codigo,
    required super.precio,
    required this.cantidad,
    required super.tipoYTiempoEnvio,
  });
}