import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowerstore/types/producto.dart';

Future<List<Producto>> obtenerProductos() async {
  final firestore = FirebaseFirestore.instance;
  final querySnapshot = await firestore.collection('productos').get();

  return querySnapshot.docs.map((doc) {
    return Producto.fromFirebase(doc.data(), doc.id);
  }).toList();
}
