import 'package:app_prueba/producto.dart'; 
import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  final Producto
      producto; // Recibe un objeto Producto para mostrar sus detalles

  const DetalleProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                producto
                    .imagen, // Puedes cargar la imagen desde la web o localmente
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(producto.descripcion),
            const SizedBox(height: 20),
            const Text(
              'Precio:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(producto.precio),
            const SizedBox(height: 20),
            const Text(
              'Categoría:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(producto.categoria),
          ],
        ),
      ),
    );
  }
}
