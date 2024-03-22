import 'package:flower_store/types/producto.dart';
import 'package:flutter/material.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  List<ProductoCarrito> productos = [
    ProductoCarrito(
      imagen: 'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
      titulo: 'Producto 1',
      codigo: '001',
      precio: 10.99,
      cantidad: 1,
      tipoYTiempoEnvio: 'Envío en 24h',
        descripcion: 'Descripción del producto 1'
    ),
    ProductoCarrito(
      imagen: 'https://img.freepik.com/foto-gratis/colores-vibrantes-naturaleza-cerca-margarita-purpura-humeda-generada-inteligencia-artificial_25030-63819.jpg?size=626&ext=jpg&ga=GA1.1.2113030492.1709424000&semt=ais',
      titulo: 'Producto 2',
      codigo: '002',
      precio: 15.99,
      cantidad: 2,
      tipoYTiempoEnvio: 'Envío en 24h',
        descripcion: 'Descripción del producto 2'
    ),
    // Agrega más productos aquí
  ];

  double subtotal = 0;
  double costoEnvio = 5.99;
  double total = 0;

  @override
  void initState() {
    super.initState();
    calcularTotal();
  }

  void calcularTotal() {
    double tempSubtotal = 0;
    for (var producto in productos) {
      tempSubtotal += producto.precio * producto.cantidad;
    }
    setState(() {
      subtotal = tempSubtotal;
      total = subtotal + costoEnvio;
    });
  }

  void eliminarProducto(int index) {
    setState(() {
      productos.removeAt(index);
      calcularTotal();
    });
  }

  void aumentarCantidad(int index) {
    setState(() {
      productos[index].cantidad++;
      calcularTotal();
    });
  }

  void reducirCantidad(int index) {
    setState(() {
      if (productos[index].cantidad > 1) {
        productos[index].cantidad--;
        calcularTotal();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    productos[index].imagen,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(productos[index].titulo),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Código: ${productos[index].codigo}'),
                      Text('Precio: \$${productos[index].precio.toStringAsFixed(2)}'),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => reducirCantidad(index),
                          ),
                          Text(productos[index].cantidad.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => aumentarCantidad(index),
                          ),
                          if (productos[index].cantidad == 1)
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => eliminarProducto(index),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
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
          ElevatedButton(
            onPressed: () {
              // Lógica para realizar el pedido
            },
            child: Text('Realizar Pedido (\$${total.toStringAsFixed(2)})'),
          ),
        ],
      ),
    );
  }
}

