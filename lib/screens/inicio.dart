import 'package:flower_store/state/carrito_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flower_store/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../types/producto.dart';

// ignore: must_be_immutable
class PantallaInicio extends ConsumerWidget {
  List<Producto> productos = [
    Producto(
        id: 1,
        imagen:
            'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
        titulo: 'Producto 1',
        codigo: '001',
        precio: 10.99,
        tipoYTiempoEnvio: 'Envio en 2 dias',
        descripcion: 'Descripcion del producto 1'),
    Producto(
        id: 2,
        imagen:
            'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
        titulo: 'Producto 2',
        codigo: '002',
        tipoYTiempoEnvio: 'Envío en 24h',
        precio: 15.99,
        descripcion: 'Descripcion del producto 2'),
  ];

  PantallaInicio({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
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
      ),
    );
  }
}
