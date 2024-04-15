import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;  // Índice inicial para la pestaña seleccionada

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double toolbarHeight = screenHeight * 0.1; // Ajusta a 10% de la altura de la pantalla

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: GestureDetector(
            onTap: () => setState(() => _isSearchFocused = true),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey), // Icono de búsqueda
                  Expanded(
                    child: TextField(
                      controller: _searchController, // Asignar controlador de texto al TextField
                      decoration: InputDecoration(
                        hintText: 'Buscar...', // Texto de sugerencia
                        border: InputBorder.none, // Sin borde alrededor del TextField
                      ),
                      onChanged: (text) {
                        // Si el texto está cambiando, mostrar u ocultar el icono de limpiar
                        setState(() {});
                      },
                    ),
                  ),
                  if (_searchController.text.isNotEmpty) // Mostrar el icono de limpiar solo si hay texto en el TextField
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey), // Icono de limpiar
                      onPressed: () {
                        // Limpiar el texto del TextField
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
              padding: const EdgeInsets.only(right: 8.0), // Ajustar el espacio desde la derecha
              child: IconButton(
                icon: Icon(Icons.filter_alt_outlined, color: Colors.grey), // Icono de filtros
                onPressed: () {
                  // Acción al hacer clic en el icono de filtros
                },
              ),
            ),
          ],
          iconTheme: IconThemeData(size: 28),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => ServiceCard(
            service: Service(
              providerName: 'Nombre del proveedor $index',
              serviceName: 'Servicio $index',
              rating: 4.5,
              distance: 5.2,
              isOpen: true,
              profileImage: AssetImage('assets/images/profile_pic.jpg'),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceDetailsPage(service: service)),
        );
      },
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: service.profileImage,
                radius: 30,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service.providerName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(service.serviceName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(service.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              Text('${service.distance} km', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Text(service.isOpen ? 'Abierto' : 'Cerrado', style: TextStyle(color: service.isOpen ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}


class ServiceDetailsPage extends StatelessWidget {
  final Service service;

  const ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Detalles del Servicio', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Proveedor: ${service.providerName}'),
            Text('Servicio: ${service.serviceName}'),
            Text('Calificación: ${service.rating}'),
            Text('Distancia: ${service.distance} km'),
            Text('Estado: ${service.isOpen ? "Abierto" : "Cerrado"}'),
          ],
        ),
      ),
    );
  }
}

