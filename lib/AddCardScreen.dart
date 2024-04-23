import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Añadir tarjeta de crédito/débito', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Método de pago', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titular tarjeta',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Número de Tarjeta',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Fecha caducidad',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CVC',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar la tarjeta
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cambiar por el color del tema si es necesario
                ),
                child: Text('Guardar tarjeta',style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 24),
              // Aquí va el widget para las tarjetas guardadas,
              // por ejemplo un ListView.builder que construya una lista de tarjetas
            ],
          ),
        ),
      ),
    );
  }
}
