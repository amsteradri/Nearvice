import 'package:flutter/material.dart';

void main() {
  runApp(NearviceApp());
}

class NearviceApp extends StatefulWidget {
  @override
  _NearviceAppState createState() => _NearviceAppState();
}

class _NearviceAppState extends State<NearviceApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 85,
          title: GestureDetector(
            onTap: () {
              setState(() {
                _isSearchFocused = true;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.filter_alt_outlined, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          ],
          iconTheme: IconThemeData(size: 28),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Fontanero',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Electricista',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Carpintero',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Niñera',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Cocinero',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
                );
              },
              child: ServiceCard(
                service: Service(
                  providerName: 'Nombre del proveedor',
                  serviceName: 'Mecanico',
                  rating: 4.5,
                  distance: 5.2,
                  isOpen: true,
                  profileImage: AssetImage('assets/profile_image.png'), // Cambiar por la imagen de perfil real
                ),
              ),
            ),

          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: Container(
            color: Colors.black,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white, size: 35),
                  label: 'Inicio',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map, color: Colors.white, size: 35),
                  label: 'Mapa',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, color: Colors.white, size: 35),
                  label: 'Actividad',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white, size: 35),
                  label: 'Perfil',
                  backgroundColor: Colors.black,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.white),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}

class Service {
  String providerName;
  String serviceName;
  double rating;
  double distance;
  bool isOpen;
  AssetImage profileImage;

  Service({
    required this.providerName,
    required this.serviceName,
    required this.rating,
    required this.distance,
    required this.isOpen,
    required this.profileImage,
  });
}

class ServiceCard extends StatelessWidget {
  final Service service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: service.profileImage,
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.providerName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      service.serviceName, // Mostrar el nombre del servicio
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(service.rating.toString()),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Text(
                  '${service.distance} km',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  service.isOpen ? 'Abierto' : 'Cerrado',
                  style: TextStyle(
                    color: service.isOpen ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Servicio'),
      ),
      body: Center(
        child: Text('Página de detalles del servicio'),
      ),
    );
  }
}
