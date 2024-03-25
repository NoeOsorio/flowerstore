import 'package:flowerstore/state/carrito_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarritoScreen extends ConsumerStatefulWidget {
  const CarritoScreen({super.key});

  @override
  ConsumerState<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends ConsumerState<CarritoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carritoState = ref.watch(carritoProvider);
    final carrito = carritoState.productos;
    double subtotal = carritoState.subtotal;
    double costoEnvio = carritoState.costoEnvio;
    double total = carritoState.total;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Image.network(
                      carrito[index].imagen,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(carrito[index].titulo),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Código: ${carrito[index].codigo}'),
                            Text('Precio: \$${carrito[index].precio.toStringAsFixed(2)}'),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => {
                                ref.read(carritoProvider.notifier).reducirCantidad(carrito[index].codigo),
                              },
                            ),
                            Text(carrito[index].cantidad.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => {
                                ref.read(carritoProvider.notifier).aumentarCantidad(carrito[index].codigo),
                              },
                            ),
                            if (carrito[index].cantidad == 1)
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => {
                                  ref.read(carritoProvider.notifier).removerDelCarrito(carrito[index].codigo),
                                },
                              ),
                          ],
                        ),
                      ],
                    ));
              },
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Agregar cupón',
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Subtotal'),
            trailing: Text('\$${subtotal.toStringAsFixed(2)}'),
          ),
          ListTile(
            title: const Text('Costo de envío'),
            trailing: Text('\$${costoEnvio.toStringAsFixed(2)}'),
          ),
          ListTile(
            title: const Text('Total'),
            trailing: Text('\$${total.toStringAsFixed(2)}'),
          ),
          const SizedBox(height: 16),
          Container(
            width: 400,
            margin: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                // Lógica para realizar el pedido
              },
              style: ElevatedButton.styleFrom(
                // foregroundColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.grey[500],
                backgroundColor: const Color(0xAAFFEB96),
                side: null,
              ),
              child:
                  Text('Realizar Pedido (\$${total.toStringAsFixed(2)})', style: const TextStyle(color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}
