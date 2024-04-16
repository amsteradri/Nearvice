
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Acción para borrar el perfil
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile_pic.jpg'), // Ejemplo de imagen
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white70),
              onPressed: () {
                // Acción para cambiar la foto de perfil
              },
            ),
          ),
          _buildTextField(_nameController, 'Nombre'),
          _buildTextField(_emailController, 'Email'),
          _buildTextField(_genderController, 'Género'),
          ElevatedButton(
            child: Text('Guardar Cambios'),
            onPressed: () {
              // Acción para guardar los cambios
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
