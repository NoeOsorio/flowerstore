import 'package:flower_store/types/producto.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.producto, required this.onTap});

  final Producto producto;
  final void Function() onTap;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            widget.producto.imagen,
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ), // Imagen del producto
          Expanded(
            child: Container(
              // color: Colors.grey[200],
              width: 300,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.producto.tipoYTiempoEnvio),
                  const Divider(),
                  Text(widget.producto.descripcion),
                  Text('\$${widget.producto.precio.toString()}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: widget.onTap,
                        style: ElevatedButton.styleFrom(
                          // foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.grey[500],
                          backgroundColor: const Color(0xAAFFEB96),
                          side: null,
                        ),
                        child: const Text('Agregar al carrito', style: TextStyle(color: Colors.black)),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
