import 'package:flowerstore/state/carrito_state.dart';
import 'package:flowerstore/state/productos_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flowerstore/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../types/producto.dart';

// ignore: must_be_immutable
class PantallaInicio extends ConsumerWidget {

  PantallaInicio({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productosAsyncValue = ref.watch(productosProvider);
    print(productosAsyncValue);
    return Scaffold(
      body: productosAsyncValue.when(
          data: (productos) {
            print(productos);
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                var producto = productos[index];
                return ProductCard(
                    producto: producto,
                    onTap: () => {
                          // Lógica para agregar al carrito
                          ref.read(carritoProvider.notifier).agregarAlCarrito(ProductoCarrito(
                              id: producto.id,
                              imagen: producto.imagen,
                              titulo: producto.titulo,
                              codigo: producto.codigo,
                              precio: producto.precio,
                              tipoYTiempoEnvio: producto.tipoYTiempoEnvio,
                              descripcion: producto.descripcion,
                              cantidad: 1)),
                          print('Producto $index agregado al carrito')
                        });
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error'))),
    );
  }
}
