import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('AJUSTES', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hola, ¿en qué podemos ayudarte?',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Introduce tu dirección de correo electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Escribe tu problema...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes añadir la lógica para enviar el problema
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes añadir la lógica para adjuntar archivos o hacer fotos
        },
        child: Icon(Icons.attach_file),
      ),
    );
  }
}
