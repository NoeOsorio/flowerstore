import 'package:flowerstore/services/productos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../types/producto.dart';

final productosProvider = FutureProvider<List<Producto>>((ref) async {
  return obtenerProductos();
});
