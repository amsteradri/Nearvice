import 'package:flutter/material.dart';

class NearviceInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Acerca de Nearvice', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nearvice',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nearvice es una plataforma diseñada para conectar a los consumidores con proveedores de servicios locales en una variedad de categorías, facilitando la búsqueda y contratación de servicios de manera eficiente y confiable.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Características:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Búsqueda fácil y rápida de servicios.\n'
                  '• Detalles completos del proveedor, incluyendo valoraciones y comentarios.\n'
                  '• Opciones de contacto directo con los proveedores.\n'
                  '• Gestión de citas y servicios a través de la app.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Desarrollado por:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            Text(
              'Un equipo dedicado de desarrolladores apasionados por mejorar la conexión entre consumidores y proveedores de servicios.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 30),
            Text(
              'Términos y Condiciones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Al usar Nearvice, usted acepta nuestros términos y condiciones. Asegúrese de entenderlos completamente antes de utilizar nuestros servicios.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'Derechos Reservados',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '© 2024 Nearvice Inc. Todos los derechos reservados.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
