import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'custom_bottom_nav_bar.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Inicio'), // Puedes reemplazar este Text widget con tu propia página de inicio
    Text('Actividad'), // Puedes reemplazar este Text widget con tu propia página de actividad
    Text('Perfil'), // Puedes reemplazar este Text widget con tu propia página de perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController _searchController = TextEditingController(); // Controlador de texto
  bool _isSearchFocused = false; // Estado de foco de búsqueda

  @override
  void dispose() {
    _searchController.dispose(); // Liberar recursos del controlador de texto
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
          backgroundColor: Colors.black, // Color de fondo del AppBar (ahora es negro)
          elevation: 0, // Eliminar sombra del AppBar
          titleSpacing: 0, // Espacio alrededor del título del AppBar
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: GestureDetector(
            onTap: () {
              setState(() {
                _isSearchFocused = true; // Al hacer clic en la barra de búsqueda, establecer el estado de foco en verdadero
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Margen interno del contenedor
              decoration: BoxDecoration(
                color: Colors.grey[200], // Color de fondo del contenedor
                borderRadius: BorderRadius.circular(20), // Bordes redondeados del contenedor
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
          iconTheme: IconThemeData(size: 28), // Tamaño del icono de menú
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928),
                zoom: 3.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}