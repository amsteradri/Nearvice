import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // Asegúrate de añadir esto en tus dependencias de pubspec.yaml
import 'home.dart';


class ServiceDetailsPage extends StatefulWidget {
  final Service service;

  ServiceDetailsPage({required this.service});

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  String? _selectedService;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _calendarVisible = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    return Scaffold(
      appBar: AppBar(
        title: Text(service.providerName + " Details"),
      ),
      body: SingleChildScrollView( // Usa SingleChildScrollView para evitar overflow cuando el calendario se expanda
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(service.assetName),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(service.serviceName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Address: ${service.address}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Phone: ${service.phoneNumber}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Our Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    serviceCard('Installation', 'Professional setup at your convenience.', Icons.build, 120.00),
                    serviceCard('Cleaning', 'Complete and thorough cleaning.', Icons.cleaning_services, 80.00),
                    serviceCard('Security', 'Top-notch security systems.', Icons.security, 200.00),
                  ],
                ),
              ),
              if (_calendarVisible) // Mostrar el calendario si la variable está activa
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Available Times for $_selectedService', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: CalendarFormat.month, // Cambia a formato de mes
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {},
                  child: Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceCard(String title, String description, IconData icon, double price) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedService == title && _calendarVisible) {
            // Si el servicio ya está seleccionado y el calendario es visible, lo ocultamos
            _calendarVisible = false;
          } else {
            _selectedService = title;  // Al seleccionar un servicio, mostramos el calendario para ese servicio
            _calendarVisible = true;
          }
        });
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              Icon(icon, size: 50, color: Colors.deepPurple),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(description, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    Text('\$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800])),
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
