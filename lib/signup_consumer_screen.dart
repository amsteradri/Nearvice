// signup_consumer_screen.dart
import 'package:flutter/material.dart';
import 'package:nearvice/PhoneInputScreen.dart';
import 'location_screen.dart'; // Asegúrate de crear este archivo para la pantalla de ubicación.

class SignUpConsumerScreen extends StatefulWidget {
  @override
  _SignUpConsumerScreenState createState() => _SignUpConsumerScreenState();
}

class _SignUpConsumerScreenState extends State<SignUpConsumerScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registro como consumidor', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre y apellido',
                  labelStyle: TextStyle(
                    color: Colors.black, // Color del texto cuando no está enfocado
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto, // El label se mueve automáticamente cuando el campo está enfocado
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black, // Color del borde cuando no está enfocado
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black, // Color del borde cuando está enfocado
                    ),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.black), // Color del ícono cuando no está enfocado
                ),
                style: TextStyle(color: Colors.black), // Estilo del texto que el usuario introduce
                cursorColor: Colors.black, // Color del cursor en el campo de texto
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre y apellido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(
                    color: Colors.black, // Color del texto cuando no está enfocado
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto, // El label se mueve automáticamente cuando el campo está enfocado
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black, // Color del borde cuando no está enfocado
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black, // Color del borde cuando está enfocado
                    ),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.black), // Color del ícono cuando no está enfocado
                ),
                style: TextStyle(color: Colors.black), // Estilo del texto que el usuario introduce
                cursorColor: Colors.black, // Color del cursor en el campo de texto
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu correo electrónico';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  foregroundColor: Colors.white, // Text Color (Foreground color)
                ),
                child: Text('Siguiente'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, navega a la pantalla de ubicación
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PhoneInputScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
