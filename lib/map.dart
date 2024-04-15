import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

void main() => runApp(NearviceApp());

class NearviceApp extends StatefulWidget {
  @override
  _NearviceAppState createState() => _NearviceAppState();
}

class _NearviceAppState extends State<NearviceApp> {
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
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.black, // Color de fondo del AppBar (ahora es negro)
          elevation: 0, // Eliminar sombra del AppBar
          titleSpacing: 0, // Espacio alrededor del título del AppBar
          toolbarHeight: 85, // Ajustar la altura del AppBar
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
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex), // Contenido de la aplicación
        ),
      ),
    );
  }
}