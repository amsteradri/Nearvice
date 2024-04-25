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
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Editar Perfil', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Acción para cambiar la foto de perfil
              },
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'), // Ejemplo de imagen
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(_nameController, 'Nombre'),
            SizedBox(height: 20),
            _buildTextField(_emailController, 'Email'),
            SizedBox(height: 20),
            _buildTextField(_genderController, 'Número de telefono'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background
                foregroundColor: Colors.white, // foreground
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Acción para guardar los cambios
              },
              child: Text(
                'Guardar Cambios',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
