import 'package:flutter/material.dart';
import 'EditProfileScreen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false; // Supongamos que inicialmente el modo oscuro está desactivado
  bool _chatNotificationsEnabled = true; // Supongamos que las notificaciones están habilitadas por defecto
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
            accountName: Container(
              margin: EdgeInsets.only(top: 30.0), // Agrega un margen superior para bajar el nombre un poco
              child: Text(
                "Adri Vaquis Gordis",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            accountEmail: Text(
              "620 60 74 87\nAdrivaquis.gordis@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[850],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25, // Reducido el tamaño del radio para dar más espacio
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_pic.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
              ),
            ],
          ),

          ExpansionTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: const Text('Getionar ubicaciones', style: TextStyle(color: Colors.black)),
            subtitle: Text('Administra las diferentes ubicaciones\nasocidadas a tu perfil', style: TextStyle(color: Colors.grey)),
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
          ExpansionTile(
            leading: Icon(Icons.lock, color: Colors.black),
            title: Text('Privacidad', style: TextStyle(color: Colors.black)),
            subtitle: Text('Administra datos privados de tu perfil', style: TextStyle(color: Colors.grey)),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.visibility, color: Colors.black),
                title: Text('Visibilidad del perfil', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Acción al tocar 'Visibilidad del perfil'
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.black),
                title: Text('Historial de actividad', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Acción al tocar 'Historial de actividad'
                },
              ),
              ExpansionTile(
                leading: Icon(Icons.security, color: Colors.black),
                title: Text('Seguridad', style: TextStyle(color: Colors.black)),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.black),
                    title: Text('Cambiar contraseña', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Acción para cambiar la contraseña
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.phonelink_lock, color: Colors.black),
                    title: Text('Autenticación de dos factores', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Acción para configurar la autenticación de dos factores
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.fingerprint, color: Colors.black),
                    title: Text('Huella digital', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Acción para configurar el acceso por huella digital
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.track_changes, color: Colors.black),
                    title: Text('Registro de actividad', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Acción para ver el registro de actividad de la cuenta
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.black),
                    title: Text('Cerrar todas las sesiones', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Acción para cerrar todas las sesiones activas excepto la actual
                    },
                  ),
                ],
              )

              // Puedes agregar más opciones de ajustes de privacidad aquí
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.sunny, color: Colors.black),
            title: Text('Aspecto', style: TextStyle(color: Colors.black)),
            subtitle: Text('Modo claro o oscuro', style: TextStyle(color: Colors.grey)),
            children: <Widget>[
              SwitchListTile(
                title: Text('Modo Oscuro'),
                value: _isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    _isDarkMode = value;
                    // Aquí puedes añadir lógica adicional, como guardar esta preferencia en un almacenamiento persistente
                  });
                  // Aquí va la lógica para habilitar/deshabilitar el modo oscuro
                },
              ),
              // Puedes añadir más opciones de personalización de aspecto si hay disponibles
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.payment, color: Colors.black),
            title: Text('Métodos de pago', style: TextStyle(color: Colors.black)),
            subtitle: Text('Gestiona la información del método de pago', style: TextStyle(color: Colors.grey)),
            children: <Widget>[
              ListTile(
                title: Text('Añadir tarjeta de crédito/débito'),
                onTap: () {
                  // Lógica para añadir tarjeta
                },
              ),
              ListTile(
                title: Text('Añadir cuenta de PayPal'),
                onTap: () {
                  // Lógica para añadir cuenta de PayPal
                },
              ),
              // Agregar más métodos de pago si son necesarios
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.chat, color: Colors.black),
            title: Text('Configuración de chat', style: TextStyle(color: Colors.black)),
            subtitle: Text('Personaliza el chat y configúralo', style: TextStyle(color: Colors.grey)),
            children: <Widget>[
              SwitchListTile(
                title: Text('Notificaciones de mensajes'),
                value: _chatNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _chatNotificationsEnabled = value;
                    // Similarmente, añade cualquier lógica necesaria para manejar esta preferencia
                  });
                  // Lógica para habilitar/deshabilitar notificaciones de mensajes
                },
              ),
              ListTile(
                title: Text('Historial de chat'),
                onTap: () {
                  // Lógica para ir al historial de chat
                },
              ),
              // Agregar más opciones de configuración del chat
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.person_add, color: Colors.black),
            title: Text('Gestionar Perfiles', style: TextStyle(color: Colors.black)),
            subtitle: Text('Configura tus perfiles de empresa y consumidor', style: TextStyle(color: Colors.grey)),
            children: <Widget>[
              ExpansionTile(
                leading: Icon(Icons.business, color: Colors.black),
                title: Text('Perfil de Empresa', style: TextStyle(color: Colors.black)),
                children: <Widget>[
                  ListTile(
                    title: Text('Tech Innovators'),
                    subtitle: Text('Empresa dedicada a soluciones tecnológicas innovadoras.'),
                    onTap: () {
                      // Lógica para configurar el perfil de "Tech Innovators"
                    },
                  ),
                  ListTile(
                    title: Text('Green Solutions'),
                    subtitle: Text('Comprometidos con soluciones sostenibles y ecológicas.'),
                    onTap: () {
                      // Lógica para configurar el perfil de "Green Solutions"
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.person_outline, color: Colors.black),
                title: Text('Perfil de Consumidor', style: TextStyle(color: Colors.black)),
                children: <Widget>[
                  ListTile(
                    title: Text('Juan Pérez'),
                    onTap: () {
                      // Lógica para configurar el perfil de Juan Pérez
                    },
                  ),
                ],
              ),

              // Agregar más opciones de gestión de perfiles
            ],
          ),



          // ... Más ListTiles para cada opción de ajustes
        ],
      ),
      backgroundColor: Colors.white, // Fondo de toda la pantalla
    );
  }
}
