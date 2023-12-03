import 'package:cloud_firestore/cloud_firestore.dart';

// producto.dart
class Producto {
  final String nombre;
  final String descripcion;
  final String precio;
  final String categoria;
  final String imagen;

  Producto({
    required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.categoria,
      required this.imagen});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
      'imagen': imagen,
    };
  }

  factory Producto.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Producto(
      nombre: data['nombre'] ?? '',
      descripcion: data['descripcion'] ?? '',
      precio: data['precio'] ?? '',
      categoria: data['categoria'] ?? '',
      imagen: data['imagen'] ?? '',
    );
  }
}
