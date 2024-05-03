import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'settings.dart';
import 'ServiceHistoryScreen.dart';
import 'RatingHistoryScreen.dart';
import 'InviteFriendsScreen.dart';

class SegundaPantalla extends StatefulWidget {
  const SegundaPantalla({Key? key}) : super(key: key);

  @override
  _SegundaPantallaState createState() => _SegundaPantallaState();
}
class _SegundaPantallaState extends State<SegundaPantalla> {
  int _selectedIndex = 1; // Índice para controlar la pestaña seleccionada

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressPercent = 0.5; // El progreso del usuario en porcentaje (50%)

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text(
          'MI PERFIL',
          style: TextStyle(
            color: Colors.white, // Cambia el color aquí
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),

            onPressed: () {

              // O si estás utilizando un enfoque más directo sin rutas nombradas:
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            'Michael Jackson',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${(progressPercent * 100).toInt()}%',
            style: const TextStyle(
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
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Nivel 1',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navega a la pantalla de Invitar Amigos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InviteFriendsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Color del botón
              foregroundColor: Colors.white, // Color del texto
              elevation: 2, // Elevación del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Borde redondeado del botón
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding del botón
            ),
            child: Text(
              'Invitar a Amigos',
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), // Añade un padding horizontal al Row completo
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8), // Añade un padding derecho a la primera tarjeta
                    child: _buildStatCard(
                      'Valoraciones',
                      '30',
                      Icons.star,
                      context,
                          () => Navigator.push(context, MaterialPageRoute(builder: (context) => RatingHistoryScreen())),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8), // Añade un padding izquierdo a la segunda tarjeta
                    child: _buildStatCard(
                      'Servicios perfectos',
                      '300',
                      Icons.check_circle,
                      context,
                          () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceHistoryScreen())),
                    ),
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Text(
                    'Logros',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(width: 1),
                Expanded(
                  child: Text(
                    'Recompensas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Esta sección se hará desplazable
            child: ListView(
              children: [

                // ... Lista de logros y recompensas desplazable ...
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('2/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                Card(
                  color: Colors.green[300], // Resalta el logro alcanzado
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('10/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('2/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('2/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('2/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    title: Text('Contratar 10 servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('2/10'),
                    trailing: Text('30 % de descuento \nen el próximo servicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                // Puedes continuar agregando más `Card` widgets según sea necesario
              ],
            ),
          ),
        ],
      ),

    );
  }
}


Widget _buildStatCard(String title, String count, IconData icon, BuildContext context, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.amber),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16)),
            Text(count, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}
