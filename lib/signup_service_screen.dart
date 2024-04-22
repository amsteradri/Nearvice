// signup_service_screen.dart
import 'package:flutter/material.dart';

class SignUpServiceScreen extends StatelessWidget {
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
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de la empresa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el nombre de la empresa';
                  }
                  return null;
                },
              ),
              // ... otros campos de formulario
              ElevatedButton(
                child: Text('Registrar servicio'),
                onPressed: () {
                  // Lógica de registro
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
