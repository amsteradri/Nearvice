import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'ServiceDetailsPage.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  Map<String, bool> _selectedFilters = {};
  TextEditingController _searchController = TextEditingController();
  String _sortOrder = 'Name'; // Orden de clasificación actual
  Map<String, String> _filterEmojis = {
    'Cerrajero': '🔑',
    'Fontanero': '🚰',
    'Electricista': '💡',
    'Niñera': '👶',
    'Chef': '🍳',
    'Peluquero': '💈',
    'Técnico de PC': '💻',
    'Agente Inmobiliario': '🏠',
    'Chófer': '🚗',
    'Carpintero': '🛠️',
    'Pintor': '🎨',
    'Jardinero': '🌿',
    'Fotógrafo': '📷',
    'Cuidador de mascotas': '🐕',
    'Entrenador personal': '🏋️',
    'Mecánico': '🔧',
    'Asesor financiero': '💼',
    'Profesor particular': '📚',
    'Organizador de eventos': '🔖',
    'Músico': '🎵',
  };


  @override
  void initState() {
    super.initState();
    services = [
      Service(
        providerName: 'Manolo Cerrajero',
        serviceName: 'Cerrajería urgente',
        assetName: 'assets/images/cerrajero.png',
        address: 'Calle Falsa 123',
        phoneNumber: '123-456-7890',
        isFavorited: true,
        category: ['Cerrajero'], // Categoría asociada con este servicio.
      ),
      Service(
        providerName: 'Pedro Chef',
        serviceName: 'Chef de primera',
        assetName: 'assets/images/chef.png',
        address: 'Calle Falsa 123',
        phoneNumber: '123-456-7890',
        isFavorited: true,
        category: ['Chef'], // Categoría asociada con este servicio.
      ),
      Service(
        providerName: 'Laura Albañil',
        serviceName: 'Albañileria premium',
        assetName: 'assets/images/albañil.png',
        address: 'Calle Falsa 123',
        phoneNumber: '123-456-7890',
        isFavorited: true,
        category: ['Carpintero'], // Asumiendo que se trata de servicios de construcción.
      ),
      Service(
        providerName: 'Sara Pastelera',
        serviceName: 'Pastelería deliciosa',
        assetName: 'assets/images/pastelera.png',
        address: 'Calle Falsa 123',
        phoneNumber: '123-456-7890',
        isFavorited: true,
        category: ['Chef'], // Aunque es pastelera, está bajo la categoría de chef para la cocina.
      ),
      Service(
        providerName: 'Pablo Fontanero',
        serviceName: 'Reparación de tuberías',
        assetName: 'assets/images/fontanero.png',
        address: 'Avenida Principal 456',
        phoneNumber: '987-654-3210',
        isFavorited: false,
        category: ['Fontanero'],
      ),
      Service(
        providerName: 'Elena Electricista',
        serviceName: 'Instalaciones eléctricas',
        assetName: 'assets/images/electricista.png',
        address: 'Barrio del Pilar 789',
        phoneNumber: '567-890-1234',
        isFavorited: true,
        category: ['Electricista'],
      ),
      Service(
        providerName: 'Ana Niñera',
        serviceName: 'Cuidado infantil profesional',
        assetName: 'assets/images/ninera.png',
        address: 'Urbanización Los Pinos 101',
        phoneNumber: '234-567-8910',
        isFavorited: false,
        category: ['Niñera'],
      ),
      Service(
        providerName: 'Chef Rodrigo',
        serviceName: 'Servicios de catering gourmet',
        assetName: 'assets/images/chef.png',
        address: 'Residencial El Bosque 202',
        phoneNumber: '345-678-9012',
        isFavorited: true,
        category: ['Chef'],
      ),
      Service(
        providerName: 'Luis Peluquero',
        serviceName: 'Cortes y estilismo',
        assetName: 'assets/images/peluquero.png',
        address: 'Plaza del Centro 303',
        phoneNumber: '456-789-0123',
        isFavorited: false,
        category: ['Peluquero'],
      ),
      Service(
        providerName: 'María Técnica de PC',
        serviceName: 'Reparación y mantenimiento de PC',
        assetName: 'assets/images/tecnico_pc.png',
        address: 'Calle Nueva 404',
        phoneNumber: '567-890-1234',
        isFavorited: true,
        category: ['Técnico de PC'],
      ),
      Service(
        providerName: 'Jorge Agente Inmobiliario',
        serviceName: 'Venta y alquiler de propiedades',
        assetName: 'assets/images/agente_inmobiliario.png',
        address: 'Bulevar Sunset 505',
        phoneNumber: '678-901-2345',
        isFavorited: false,
        category: ['Agente Inmobiliario'],
      ),
      Service(
        providerName: 'Carlos Chófer',
        serviceName: 'Servicio de transporte personal',
        assetName: 'assets/images/chofer.png',
        address: 'Avenida Libertad 606',
        phoneNumber: '789-012-3456',
        isFavorited: true,
        category: ['Chófer'],
      ),
      Service(
        providerName: 'Tomás Carpintero',
        serviceName: 'Carpintería y mueblería a medida',
        assetName: 'assets/images/carpintero.png',
        address: 'Calle de la Madera 707',
        phoneNumber: '890-123-4567',
        isFavorited: false,
        category: ['Carpintero'],
      ),
      // Agrega más servicios aquí con sus categorías correspondientes.
    ];
    filteredServices = services;
    _selectedFilters = {
      'Cerrajero': false,
      'Fontanero': false,
      'Electricista': false,
      'Niñera': false,
      'Chef': false,
      'Peluquero': false,
      'Técnico de PC': false,
      'Agente Inmobiliario': false,
      'Chófer': false,
      'Carpintero': false,
      'Pintor': false,
      'Jardinero': false,
      'Fotógrafo': false,
      'Cuidador de mascotas': false,
      'Entrenador personal': false,
      'Mecánico': false,
      'Asesor financiero': false,
      'Profesor particular': false,
      'Organizador de eventos': false,
      'Músico': false,
      // Añade más categorías según tus necesidades.
    };
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterServices() {
    List<Service> tempServices = services.where((service) {
      // Verificar si el texto de búsqueda coincide
      bool matchesSearch = service.providerName.toLowerCase().contains(_searchController.text.toLowerCase());

      // Verifica si todos los filtros están desactivados (ningún chip está seleccionado)
      bool noFiltersSelected = !_selectedFilters.values.any((selected) => selected);

      // Verificar si algún filtro seleccionado coincide con las categorías del servicio
      bool matchesFilters = _selectedFilters.entries.any((entry) {
        return entry.value && service.category.contains(entry.key);
      });

      // Si no hay filtros seleccionados, ignora la comprobación de filtros
      return matchesSearch && (noFiltersSelected || matchesFilters);
    }).toList();

    // Actualizar la lista de servicios filtrados
    setState(() {
      filteredServices = tempServices;
    });
  }


  Widget _buildFilterChip(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label, style: TextStyle(color: Colors.black)),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,  // Fondo transparente para el avatar
          child: Text(_filterEmojis[label]!),  // Usa el emoji del mapa _filterEmojis
        ),
        selected: _selectedFilters[label]!,
        onSelected: (bool selected) {
          setState(() {
            _selectedFilters[label] = selected;
            _filterServices();  // Asegúrate de llamar a _filterServices para actualizar la lista
          });
        },
        selectedColor: Colors.lightGreen[100],
        backgroundColor: Colors.grey[200],
        showCheckmark: false,  // Elimina el checkmark para simplificar la UI
        labelStyle: TextStyle(
          color: _selectedFilters[label]! ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  void _sortServices(String order) {
    setState(() {
      _sortOrder = order;
      if (order == 'Name') {
        filteredServices.sort((a, b) => a.providerName.compareTo(b.providerName));
      } else if (order == 'Favorites') {
        // Ordenando primero los favoritos
        filteredServices.sort((a, b) {
          if (b.isFavorited && !a.isFavorited) return 1;
          else if (!b.isFavorited && a.isFavorited) return -1;
          return 0;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // Envuelve el Scaffold con MaterialApp y configura los temas aquí si es necesario
    return MaterialApp(
      theme: ThemeData.light(), // Asegúrate de usar ThemeData.light() para el tema en claro
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavBar(),
        appBar: AppBar(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: GestureDetector(

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
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        setState(() {
                          // Filtra la lista de servicios en base al texto ingresado
                          filteredServices = services.where((service) {
                            // Aquí asumimos que `providerName` es la propiedad que deseas buscar
                            // Puedes ajustar esto para buscar en diferentes propiedades según tus necesidades
                            return service.providerName.toLowerCase().contains(text.toLowerCase());
                          }).toList();
                        });
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
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _sortServices,
              itemBuilder: (BuildContext context) {
                return {'Name', 'Favorites'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              icon: Icon(Icons.sort, color: Colors.white),
            ),
          ],
          iconTheme: IconThemeData(size: 28),
        ),

        body: Column(
          children: [
            SizedBox(
              height: 60, // Altura fija para la barra de desplazamiento
              child: ListView(
                scrollDirection: Axis.horizontal, // Establece la dirección del desplazamiento a horizontal
                children: _filterEmojis.keys.map((String label) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Adjust horizontal padding here
                    child: _buildFilterChip(context, label),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredServices.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return ServiceCard(
                    service: filteredServices[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class Service {
  final String providerName;
  final String serviceName;
  final String assetName;
  final String address;
  final String phoneNumber;
  final bool isFavorited;
  final List<String> category; // Asegúrate de que tienes una lista de categorías en tu modelo.

  Service({
    required this.providerName,
    required this.serviceName,
    required this.assetName,
    required this.address,
    required this.phoneNumber,
    required this.isFavorited,
    required this.category,
  });
}

List<Service> services = [
  Service(
    providerName: 'Manolo Cerrajero',
    serviceName: 'Cerrajería urgente',
    assetName: 'assets/images/cerrajero.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
    category: ['Cerrajero'], // Categoría asociada con este servicio.
  ),
  Service(
    providerName: 'Pedro Chef',
    serviceName: 'Chef de primera',
    assetName: 'assets/images/chef.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
    category: ['Chef'], // Categoría asociada con este servicio.
  ),
  Service(
    providerName: 'Laura Albañil',
    serviceName: 'Albañileria premium',
    assetName: 'assets/images/albañil.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
    category: ['Carpintero'], // Asumiendo que se trata de servicios de construcción.
  ),
  Service(
    providerName: 'Sara Pastelera',
    serviceName: 'Pastelería deliciosa',
    assetName: 'assets/images/pastelera.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
    category: ['Chef'], // Aunque es pastelera, está bajo la categoría de chef para la cocina.
  ),
  Service(
    providerName: 'Pablo Fontanero',
    serviceName: 'Reparación de tuberías',
    assetName: 'assets/images/fontanero.png',
    address: 'Avenida Principal 456',
    phoneNumber: '987-654-3210',
    isFavorited: false,
    category: ['Fontanero'],
  ),
  Service(
    providerName: 'Elena Electricista',
    serviceName: 'Instalaciones eléctricas',
    assetName: 'assets/images/electricista.png',
    address: 'Barrio del Pilar 789',
    phoneNumber: '567-890-1234',
    isFavorited: true,
    category: ['Electricista'],
  ),
  Service(
    providerName: 'Ana Niñera',
    serviceName: 'Cuidado infantil profesional',
    assetName: 'assets/images/ninera.png',
    address: 'Urbanización Los Pinos 101',
    phoneNumber: '234-567-8910',
    isFavorited: false,
    category: ['Niñera'],
  ),
  Service(
    providerName: 'Chef Rodrigo',
    serviceName: 'Servicios de catering gourmet',
    assetName: 'assets/images/chef.png',
    address: 'Residencial El Bosque 202',
    phoneNumber: '345-678-9012',
    isFavorited: true,
    category: ['Chef'],
  ),
  Service(
    providerName: 'Luis Peluquero',
    serviceName: 'Cortes y estilismo',
    assetName: 'assets/images/peluquero.png',
    address: 'Plaza del Centro 303',
    phoneNumber: '456-789-0123',
    isFavorited: false,
    category: ['Peluquero'],
  ),
  Service(
    providerName: 'María Técnica de PC',
    serviceName: 'Reparación y mantenimiento de PC',
    assetName: 'assets/images/tecnico_pc.png',
    address: 'Calle Nueva 404',
    phoneNumber: '567-890-1234',
    isFavorited: true,
    category: ['Técnico de PC'],
  ),
  Service(
    providerName: 'Jorge Agente Inmobiliario',
    serviceName: 'Venta y alquiler de propiedades',
    assetName: 'assets/images/agente_inmobiliario.png',
    address: 'Bulevar Sunset 505',
    phoneNumber: '678-901-2345',
    isFavorited: false,
    category: ['Agente Inmobiliario'],
  ),
  Service(
    providerName: 'Carlos Chófer',
    serviceName: 'Servicio de transporte personal',
    assetName: 'assets/images/chofer.png',
    address: 'Avenida Libertad 606',
    phoneNumber: '789-012-3456',
    isFavorited: true,
    category: ['Chófer'],
  ),
  Service(
    providerName: 'Tomás Carpintero',
    serviceName: 'Carpintería y mueblería a medida',
    assetName: 'assets/images/carpintero.png',
    address: 'Calle de la Madera 707',
    phoneNumber: '890-123-4567',
    isFavorited: false,
    category: ['Carpintero'],
  ),
  // Agrega más servicios aquí con sus categorías correspondientes.
];


List<Service> filteredServices = [];



class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsPage(service: service),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            children: [
              Image.asset(
                service.assetName,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(service.providerName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)), // Aumentado el tamaño de la fuente
                          Text(service.serviceName, style: TextStyle(fontSize: 14)), // Aumentado el tamaño de la fuente
                        ],
                      ),
                    ),
                    if (service.isFavorited)
                      Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







