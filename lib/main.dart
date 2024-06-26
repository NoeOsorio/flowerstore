import 'package:firebase_core/firebase_core.dart';
import 'package:flowerstore/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/carrito.dart';
import 'screens/categorias.dart';
import 'screens/inicio.dart';
import 'screens/perfil.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xAAFFEB96)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flower Store'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indiceTabActual = 0;
  final List<Widget> _pantallas = [
    PantallaInicio(),
    const CategoriasScreen(),
    const CarritoScreen(),
    const PerfilScreen()
  ];

  void _seleccionarPantalla(int indice) {
    setState(() {
      _indiceTabActual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xAAFFEB96),
        title: Text(widget.title),
      ),
      body: _pantallas[_indiceTabActual],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorías',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _indiceTabActual,
        onTap: _seleccionarPantalla,
        backgroundColor: const Color(0xAAFFEB96), // Fondo de la barra de navegación
        unselectedItemColor: Colors.grey[500], // Color de los ítems no seleccionados
        selectedItemColor: Colors.black, // Color del ítem seleccionado
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
