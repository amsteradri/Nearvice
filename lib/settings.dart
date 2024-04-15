import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _addressController = TextEditingController();
  List<String> _addresses = []; // Lista para almacenar las direcciones añadidas

  void _addAddress() {
    if (_addressController.text.isNotEmpty) {
      setState(() {
        _addresses.add(_addressController.text);
        _addressController.clear(); // Limpia el campo después de añadir la dirección
      });
    }
  }

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
      body: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Adri Vaquis Gordis", style:  const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            accountEmail: Text("Adrivaquis.gordis@gmail.com", style:  const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          ExpansionTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: const Text('Getionar ubicaciones', style: TextStyle(color: Colors.black)),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Escribe una dirección' ,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  child: Text('Añadir dirección'),
                  onPressed: _addAddress,
                ),
              ),
              // Muestra las direcciones añadidas
              for (var address in _addresses)
                ListTile(
                  title: Text(address, style: TextStyle(color: Colors.black)),
                  leading: Icon(Icons.home, color: Colors.black),
                ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.black),
            title: Text('Gestionar Ubicaciones', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              // Acción al tocar 'Gestionar Ubicaciones'
            },
          ),
          // ... Más ListTiles para cada opción de ajustes
        ],
      ),
      backgroundColor: Colors.white, // Fondo de toda la pantalla
    );
  }
}










