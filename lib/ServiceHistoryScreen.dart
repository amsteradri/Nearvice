import 'package:flutter/material.dart';

class ServiceHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista extendida y personalizada de servicios
    final List<Map<String, dynamic>> services = [
      {'name': 'Instalación de fontanería', 'isPerfect': true},
      {'name': 'Reparación eléctrica general', 'isPerfect': false},
      {'name': 'Servicio de limpieza profunda', 'isPerfect': true},
      {'name': 'Mantenimiento de aire acondicionado', 'isPerfect': false},
      {'name': 'Pintura de interiores', 'isPerfect': true},
      {'name': 'Instalación de baldosas', 'isPerfect': false},
      {'name': 'Reparación de techos', 'isPerfect': true},
      {'name': 'Jardinería y paisajismo', 'isPerfect': false},
      {'name': 'Servicio de mudanza', 'isPerfect': true},
      {'name': 'Instalación de alarmas de seguridad', 'isPerfect': false},
      {'name': 'Decoración de interiores', 'isPerfect': true},
      {'name': 'Montaje de muebles', 'isPerfect': false},
      {'name': 'Servicios de cerrajería', 'isPerfect': true},
      {'name': 'Limpieza de ventanas', 'isPerfect': false},
      {'name': 'Servicio técnico de computadoras', 'isPerfect': true},
      {'name': 'Servicios de catering', 'isPerfect': false},
      {'name': 'Reparación de electrodomésticos', 'isPerfect': true},
      {'name': 'Instalación de sistemas de riego', 'isPerfect': false},
      {'name': 'Reparación de muebles', 'isPerfect': true},
      {'name': 'Asesoramiento inmobiliario', 'isPerfect': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Servicios', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
                Icons.build,
                color: services[index]['isPerfect'] ? Colors.green : Colors.red
            ),
            title: Text(services[index]['name']),
            subtitle: Text(
                services[index]['isPerfect'] ? 'Servicio perfecto' : 'Servicio no perfecto'
            ),
          );
        },
      ),
    );
  }
}
