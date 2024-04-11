import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressPercent = 0.3; // El progreso del usuario en porcentaje (30%)

    return Scaffold(
      appBar: AppBar(
        title: const Text('MI PERFIL'),
        centerTitle: true,
        backgroundColor: Colors.black, // Fondo negro para la AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Acción de configuración
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Michael Jackson',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${(progressPercent * 100).toInt()}%',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: progressPercent,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blue,
                    strokeWidth: 6,
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Nivel 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Valoraciones 30.000',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    // Aquí puedes añadir tu widget de estrellas o cualquier otra representación
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Servicios Perfectos: 300',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Logros'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Recompensas'),
                ),
              ],
            ),
            // Aquí continuarías con el resto de la interfaz de la pantalla de perfil...
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Actividad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        // Configurar el estado seleccionado actual, etc.
      ),
    );
  }
}
