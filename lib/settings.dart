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
            accountName: Text(
              "adri Vaquis Gordis",
              style: TextStyle(
                fontSize: 20, // Ajusta el tamaño de la fuente si es necesario
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              "620 60 74 87\nAdrivaquis.gordis@gmail.com",
              style: TextStyle(
                fontSize: 14, // Ajusta el tamaño de la fuente si es necesario
                color: Colors.grey[850], // Para un color de texto gris oscuro
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white, // Fondo blanco para el círculo
              radius: 40, // Ajusta el radio si es necesario
              child: ClipOval(
                child: Image.asset('assets/images/profile_pic.jpg'), // Asegúrate de que la imagen exista en el directorio correcto
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco del encabezado
            ),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.grey),
                onPressed: () {
                  // Acción cuando se presiona el icono de flecha
                },
              ),
            ],
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
            leading: Icon(Icons.lock, color: Colors.black),
            title: Text('Privacidad', style: TextStyle(color: Colors.black)),
            subtitle: Text('Administra datos privados de tu perfil', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              // Acción al tocar 'Privacidad'
            },
          ),
          ListTile(
            leading: Icon(Icons.sunny, color: Colors.black),
            title: Text('Aspecto', style: TextStyle(color: Colors.black)),
            subtitle: Text('Modo claro o oscuro', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              // Acción al tocar 'Aspecto'
            },
          ),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.black),
            title: Text('Métodos de pago', style: TextStyle(color: Colors.black)),
            subtitle: Text('Gestiona la información del método de pago', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              // Acción al tocar 'Métodos de pago'
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors
                .black),
            title: Text('Configuración de chat', style: TextStyle(color: Colors.black)),
            subtitle: Text('Personaliza el chat y configúralo', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
// Acción al tocar 'Configuración de chat'
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add, color: Colors.black),
            title: Text('Gestionar Perfiles', style: TextStyle(color: Colors.black)),
            subtitle: Text('Configura tus perfiles de empresa y consumidor', style: TextStyle(color: Colors.grey)), // Subtítulo o descripción
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              // Acción al tocar 'Gestionar Perfiles'
            },
          ),


          // ... Más ListTiles para cada opción de ajustes
        ],
      ),
      backgroundColor: Colors.white, // Fondo de toda la pantalla
    );
  }
}










