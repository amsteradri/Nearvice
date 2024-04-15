import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  String _addedAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AJUSTES', style: TextStyle(
          color: Colors.white, // Cambia el color aquí
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Aquí estableces el color de la flecha de retroceso
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("adri Vaquis Gordis"),
            accountEmail: Text("Adrivaquis.gordis@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'), // Sustituye con la URL de tu imagen
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),
          ExpansionTile(
            leading: Icon(Icons.home, color: Colors.white),

            title: Text('Añadir casa', style: TextStyle(
              color: Colors.white, // Cambia el color aquí
            ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Escribe una dirección',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  child: Text('Añadir dirección'),
                  onPressed: () {
                    // Lógica para añadir la dirección
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.white),
            title: Text('Gestionar Ubicaciones', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              // Acción al tocar 'Gestionar Ubicaciones'
            },
          ),
          // ... Más ListTiles para cada opción de ajustes
        ],
      ),
      backgroundColor: Colors.grey[900], // Fondo de toda la pantalla
    );
  }
}
