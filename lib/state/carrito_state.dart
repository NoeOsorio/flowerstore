import 'package:flower_store/types/producto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarritoState {
  final List<ProductoCarrito> productos;
  final double costoEnvio;

  CarritoState({this.productos = const [], this.costoEnvio = 5.99});

  double get subtotal => productos.fold(0, (total, current) => total + current.precio * current.cantidad);

  double get total => subtotal + costoEnvio;
}

class CarritoNotifier extends StateNotifier<CarritoState> {
  CarritoNotifier() : super(CarritoState());

  void agregarAlCarrito(ProductoCarrito item) {
    state = CarritoState(
      productos: [...state.productos, item],
      costoEnvio: state.costoEnvio,
    );
  }

  void removerDelCarrito(String codigo) {
    state = CarritoState(
      productos: state.productos.where((i) => i.codigo != codigo).toList(),
      costoEnvio: state.costoEnvio,
    );
  }

  void aumentarCantidad(String codigo) {
    state = CarritoState(
      productos: state.productos.map((i) {
        if (i.codigo == codigo) {
          return ProductoCarrito(
            id: i.id,
            imagen: i.imagen,
            titulo: i.titulo,
            codigo: i.codigo,
            precio: i.precio,
            tipoYTiempoEnvio: i.tipoYTiempoEnvio,
            descripcion: i.descripcion,
            cantidad: i.cantidad + 1,
          );
        }
        return i;
      }).toList(),
      costoEnvio: state.costoEnvio,
    );
  }

  void reducirCantidad(String codigo) {
    state = CarritoState(
      productos: state.productos.map((i) {
        if (i.codigo == codigo) {
          return ProductoCarrito(
            id: i.id,
            imagen: i.imagen,
            titulo: i.titulo,
            codigo: i.codigo,
            precio: i.precio,
            tipoYTiempoEnvio: i.tipoYTiempoEnvio,
            descripcion: i.descripcion,
            cantidad: i.cantidad - 1,
          );
        }
        return i;
      }).toList(),
      costoEnvio: state.costoEnvio,
    );
  }

  // void calcularTotal() {
  //   double tempSubtotal = 0;
  //   for (var producto in productos) {
  //     tempSubtotal += producto.precio * producto.cantidad;
  //   }
  //   setState(() {
  //     subtotal = tempSubtotal;
  //     total = subtotal + costoEnvio;
  //   });
  // }

  // void eliminarProducto(int index) {
  //   setState(() {
  //     productos.removeAt(index);
  //     calcularTotal();
  //   });
  // }

  // void aumentarCantidad(int index) {
  //   setState(() {
  //     productos[index].cantidad++;
  //     calcularTotal();
  //   });
  // }

  // void reducirCantidad(int index) {
  //   setState(() {
  //     if (productos[index].cantidad > 1) {
  //       productos[index].cantidad--;
  //       calcularTotal();
  //     }
  //   });
  // }
}

final carritoProvider = StateNotifierProvider<CarritoNotifier, CarritoState>((ref) {
  return CarritoNotifier();
});
