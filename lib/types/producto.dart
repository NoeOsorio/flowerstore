class Producto {
  final String id;
  final String imagen;
  final String titulo;
  final String codigo;
  final double precio;
  final String tipoYTiempoEnvio;
  final String descripcion;

  Producto({
    required this.id,
    required this.imagen,
    required this.titulo,
    required this.codigo,
    required this.precio,
    required this.tipoYTiempoEnvio,
    required this.descripcion,
  });

  factory Producto.fromFirebase(Map<String, dynamic> data, String id) {
    return Producto(
      id: id,
      imagen: data['imagen'],
      titulo: data['titulo'],
      codigo: data['codigo'],
      precio: data['precio'],
      tipoYTiempoEnvio: data['tipoYTiempoEnvio'],
      descripcion: data['descripcion'],
    );
  }
}

class ProductoCarrito extends Producto {
  int cantidad;

  ProductoCarrito({
    required super.id,
    required super.imagen,
    required super.titulo,
    required super.codigo,
    required super.precio,
    required super.tipoYTiempoEnvio,
    required super.descripcion,
    required this.cantidad,
  });
}
