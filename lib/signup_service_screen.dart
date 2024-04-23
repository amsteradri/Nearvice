import 'package:flutter/material.dart';
import 'PhoneInputScreen.dart';

class SignUpServiceScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _taxIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro como servicio'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Nombre de la empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el nombre de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _taxIdController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'ID Fiscal de la empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.receipt, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el ID Fiscal de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Dirección de la empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce la dirección de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email de la empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el email de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Teléfono de contacto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un teléfono de contacto';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _websiteController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Sitio web',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.web, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el sitio web de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Descripción de la empresa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description, color: Colors.black), // Ícono en color negro
                  labelStyle: TextStyle(color: Colors.black), // Estilo de etiqueta en color negro
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Borde en color negro
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce una descripción de la empresa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text('Siguiente'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navega a la pantalla de verificación de teléfono si es válido
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PhoneInputScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Color de fondo del botón
                  foregroundColor: Colors.white, // Color del texto del botón
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Fondo de pantalla en blanco
    );
  }
}
