// lista.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_prueba/producto.dart';
import 'package:app_prueba/producto_page.dart';
import 'package:app_prueba/detalle_producto.dart';
import 'package:app_prueba/agregar.dart';

class ListaPage extends StatelessWidget {
  final List<QueryDocumentSnapshot> productos;
  ListaPage({Key? key, required this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('productos').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          
          if (snapshot.hasData) {
            final productos = snapshot.data?.docs
                .map((doc) => Producto.fromFirestore(doc))
                .toList();

            return ListView.builder(
              itemCount: productos!.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return GestureDetector(
                  child: ProductoPage(producto: producto),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetalleProducto(producto: producto))),
                );
              },
            );
          } else {
            return const Center(
              child: Image(
                width: 150,
                height: 150,
                image: AssetImage('noData.png'),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de agregar producto
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AgregarPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
