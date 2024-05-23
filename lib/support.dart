import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Soporte', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
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
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Escribe tu problema...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
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
            ElevatedButton(
              onPressed: () {
                // Aquí puedes añadir la lógica para enviar el problema
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text('Enviar'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Preguntas frecuentes',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(), // to disable scroll on this ListView
              shrinkWrap: true, // Use this to fit the content in the available space
              children: [
                ListTile(
                  title: Text('¿Cómo puedo solicitar un servicio de urgencia?'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text('¿Qué hacer si el servicio no ha sido bueno?'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text('¿Qué hago si no me funciona el método de pago?'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text('¿Cómo puedo solicitar el reembolso de mi dinero?'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text('¿No puedo iniciar sesión con mi cuenta, qué hago?'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
