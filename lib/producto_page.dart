// producto_page.dart
import 'package:flutter/material.dart';
import 'package:app_prueba/producto.dart';

class ProductoPage extends StatefulWidget {
  final Producto producto;
  ProductoPage({Key? key, required this.producto}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.producto.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.producto.imagen),
            SizedBox(height: 16.0),
            Text(widget.producto.descripcion),
            SizedBox(height: 16.0),
            Text('${widget.producto.precio} MXN'),
            SizedBox(height: 16.0),
            Text(widget.producto.categoria),
          ],
        ),
      ),
    );
  }
}
