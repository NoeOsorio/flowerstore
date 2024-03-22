import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categorias = [
      'Rosas',
      'Tulipanes',
      'Lirios',
      'Orquídeas',
      'Girasoles',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categorias[index]),
          );
        },
      ),
    );
  }
}