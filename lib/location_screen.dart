// location_screen.dart
import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate de que este import corresponda al lugar correcto de tu archivo HomePage

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Ubicación'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  prefixIcon: Icon(Icons.location_on, color: Colors.black),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu dirección';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Color de fondo del botón
                  foregroundColor: Colors.white, // Color del texto
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Añade un poco más de relleno al botón
                ),
                child: Text('Registrar Ubicación'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí agregarías la lógica para guardar la ubicación
                    Navigator.of(context).pushReplacement( // Cambiado a pushReplacement para evitar volver a la pantalla de ubicación
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Fondo de toda la pantalla
    );
  }
}
