// agregar.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:app_prueba/producto.dart';

class AgregarPage extends StatefulWidget {
  AgregarPage({Key? key}) : super(key: key);

  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();
  final _categoriaController = TextEditingController();
  File? _imagenFile;

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    _categoriaController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarImagen() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imagenFile = File(pickedFile.path);
      } else {
        print('No se seleccionó ninguna imagen');
      }
    });
  }

  Future<void> _agregarProducto() async {
    if (_formKey.currentState!.validate()) {
      if (_imagenFile != null) {
        try {
          // Subir la imagen a Firebase Storage
          String fileName = _imagenFile!.path.split('/').last;
          Reference ref = _storage.ref().child('productos/$fileName');
          UploadTask task = ref.putFile(_imagenFile!);
          TaskSnapshot snapshot = await task;
          String imageUrl = await snapshot.ref.getDownloadURL();

          // Crear el producto con los datos ingresados
          Producto producto = Producto(
            nombre: _nombreController.text,
            descripcion: _descripcionController.text,
            precio: (_precioController.text),
            categoria: _categoriaController.text,
            imagen: imageUrl,
          );

          // Guardar el producto en Firestore
          await _db.collection('productos').add(producto.toMap());

          // Mostrar un mensaje de éxito y volver a la pantalla anterior
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Producto agregado con éxito'),
            ),
          );
          Navigator.pop(context);
        } catch (e) {
          // Mostrar un mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ocurrió un error al agregar el producto: $e'),
            ),
          );
        }
      } else {
        // Mostrar un mensaje de que se debe seleccionar una imagen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Debes seleccionar una imagen para el producto'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar producto'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del producto',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes ingresar un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes ingresar una descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(
                  labelText: 'Precio',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes ingresar un precio';
                  }
                  try {
                    double.parse(value);
                  } catch (e) {
                    return 'Debes ingresar un número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoriaController,
                decoration: InputDecoration(
                  labelText: 'Categoría',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes ingresar una categoría';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _seleccionarImagen,
                child: Text('Seleccionar imagen'),
              ),
              SizedBox(height: 16.0),
              _imagenFile != null
                  ? Image.file(_imagenFile!)
                  : Text('No se ha seleccionado ninguna imagen'),
              Spacer(),
              ElevatedButton(
                onPressed: _agregarProducto,
                child: Text('Agregar producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
