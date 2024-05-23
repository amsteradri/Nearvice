import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para el uso de Clipboard

class InviteFriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invitar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Invita a todos tus amigos/a',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Aqui podrás invitar a todos tus amigos/a y por cada amigo/a que se una a la app a través de tu link, obtendrás 2 € de descuento para los siguientes servicios.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SelectableText(
                        'http://nearvice.com/michaeljackson',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre el link y el botón
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: 'http://nearvice.com/michaeljackson'));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Link copiado")));
                    },
                    child: Text('Copiar'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Tus Contactos:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Impedir el desplazamiento dentro de este ListView
              itemCount: 4, // Asúmase 4 para el ejemplo
              itemBuilder: (context, index) {
                // Aquí se deben obtener los nombres de los contactos desde alguna fuente
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text('Contacto $index'), // Nombre del contacto
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
