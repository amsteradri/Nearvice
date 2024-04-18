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
    _selectedFilters = _filterEmojis.keys.fold({}, (Map<String, bool> map, String key) {
      map[key] = false;
      return map;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildFilterChip(BuildContext context, String label) {
    return ChoiceChip(
      label: Text(label),
      avatar: Text(_filterEmojis[label]!),
      selected: _selectedFilters[label]!,
      onSelected: (bool selected) {
        setState(() {
          _selectedFilters[label] = selected;
        });
      },
      selectedColor: Colors.lightGreen[100],
      showCheckmark: false,
    );
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.filter_alt_outlined, color: Colors.grey),
                onPressed: () {
                  // Acción al hacer clic en el icono de filtros
                },
              ),
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
                itemCount: filteredServices.length, // Usa la longitud de la lista de servicios filtrados
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Service service = filteredServices[index]; // Usa el servicio filtrado para cada índice
                  return ServiceCard(
                    service: service,
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

  Service({
    required this.providerName,
    required this.serviceName,
    required this.assetName,
    required this.address,
    required this.phoneNumber,
    required this.isFavorited,
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
  ),
  Service(
    providerName: 'Pedro Chef',
    serviceName: 'Chef de primera',
    assetName: 'assets/images/chef.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
  ),
  Service(
    providerName: 'Laura Albañil',
    serviceName: 'Albañileria premium',
    assetName: 'assets/images/albañil.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
  ),
  Service(
    providerName: 'Sara Pastelera',
    serviceName: 'Cerrajería urgente',
    assetName: 'assets/images/pastelera.png',
    address: 'Calle Falsa 123',
    phoneNumber: '123-456-7890',
    isFavorited: true,
  ),
  // Añade más servicios aquí con diferentes nombres e imágenes
  // ...
];

List<Service> filteredServices = List.from(services);



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
                          Text(service.providerName, style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(service.serviceName),
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






