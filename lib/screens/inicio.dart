import 'package:flutter/material.dart';

import '../types/producto.dart';

// ignore: must_be_immutable
class PantallaInicio extends StatelessWidget {
  List<Producto> productos = [
    Producto(
      imagen:
          'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
      titulo: 'Producto 1',
      codigo: '001',
      precio: 10.99,
      tipoYTiempoEnvio: 'Envio en 2 dias',
    ),
    Producto(
      imagen:
          'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
      titulo: 'Producto 2',
      codigo: '002',
      tipoYTiempoEnvio: 'Envío en 24h',
      precio: 15.99,
    ),
  ];

  PantallaInicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          var producto = productos[index];
          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              
              children: [
                Image.network(producto.imagen, width: 100), // Imagen del producto
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(producto.tipoYTiempoEnvio),
                        const Divider(),
                        Text('\$${producto.precio.toString()}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            ElevatedButton(
                              onPressed: () {
                                // Lógica para agregar al carrito
                              },
                              style: ElevatedButton.styleFrom(
                                // foregroundColor: Colors.black,
                                foregroundColor: Colors.grey[500],
                                backgroundColor: const Color(0xAAFFEB96),
                                side: null,
                              ),
                              child: const Text('Agregar al carrito'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
