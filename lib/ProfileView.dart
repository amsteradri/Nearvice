import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Text("Perfil desde fuera", style: TextStyle(
            color: Colors.white, // Cambia el color aquí
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {}, // Acción para favoritos
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {}, // Más opciones
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text("Michael J.", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text("3", style: TextStyle(fontSize: 18)),
                      Text("(5 Servicios)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("A 4 km de ti (Barcelona)", style: TextStyle(color: Colors.green, fontSize: 16)),
                  SizedBox(height: 20),
                  TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Servicios'),
                      Tab(text: 'Valoraciones'),
                      Tab(text: 'Info'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 500, // Ajusta según el contenido de cada tab
              child: TabBarView(
                children: [
                  _buildServicesTab(),
                  _buildRatingsTab(),
                  _buildInfoTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesTab() {
    // Datos ficticios para servicios
    List<Map<String, dynamic>> services = [
      {"nombre": "Instalación de plomería", "fecha": "10 Mar 2024", "icon": Icons.plumbing},
      {"nombre": "Reparación eléctrica", "fecha": "24 Feb 2024", "icon": Icons.electrical_services},
      {"nombre": "Mantenimiento de aire acondicionado", "fecha": "15 Ene 2024", "icon": Icons.ac_unit},
    ];

    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(services[index]['icon'], size: 40, color: Colors.blue),
          title: Text(services[index]['nombre'], style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Fecha de servicio: ${services[index]['fecha']}"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Acción al tocar cada servicio
          },
        );
      },
    );
  }



  Widget _buildRatingsTab() {
    List<Map<String, dynamic>> ratings = [
      {"nombre": "Ana G.", "fecha": "22 Mar 2024", "comentario": "Excelente servicio, muy profesional.", "estrellas": 5},
      {"nombre": "Juan P.", "fecha": "18 Mar 2024", "comentario": "Buen trabajo, pero llegó tarde.", "estrellas": 4},
      {"nombre": "Laura M.", "fecha": "05 Mar 2024", "comentario": "Recomendado, muy cuidadoso y detallista.", "estrellas": 5},
    ];

    return ListView.builder(
      itemCount: ratings.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person_outline, size: 40),
          title: Text(ratings[index]['nombre']),
          subtitle: Text("${ratings[index]['comentario']}"),
          trailing: Text("⭐" * ratings[index]['estrellas'], style: TextStyle(color: Colors.amber, fontSize: 18)),
        );
      },
    );
  }



  Widget _buildInfoTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.person_outline, size: 40, color: Colors.teal),
              title: Text("Biografía", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Profesional con más de 10 años de experiencia en el sector de la construcción y reparaciones. Especializado en plomería, electricidad y remodelaciones generales. Conocido por un enfoque meticuloso y un compromiso con la satisfacción del cliente."),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.verified_user, size: 40, color: Colors.orange),
              title: Text("Certificaciones", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Certificado en plomería por el Instituto Técnico Industrial y certificado en instalaciones eléctricas por el Centro de Formación Profesional en Electricidad. Miembro activo de la Asociación de Electricistas y Plomeros de Barcelona desde 2015."),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.map, size: 40, color: Colors.blue),
              title: Text("Zona de cobertura", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Operativo en toda la provincia de Barcelona, con disponibilidad para proyectos en zonas cercanas y por toda la región de Cataluña bajo consulta. Especializado en ofrecer servicios a domicilio con total flexibilidad de horarios."),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.info_outline, size: 40, color: Colors.purple),
              title: Text("Información adicional", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Comprometido con el uso de materiales de alta calidad y las últimas tecnologías para garantizar la eficacia y durabilidad de cada proyecto. Ofrezco garantía de satisfacción en todos los servicios prestados."),
            ),
          ),
        ],
      ),
    );
  }



}

