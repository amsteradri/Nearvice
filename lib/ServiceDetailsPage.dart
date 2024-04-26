import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home.dart';  // Ensure this import contains the necessary models like Service.

class ServiceDetailsPage extends StatelessWidget {
  final Service service;

  const ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.providerName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,// A more vibrant color scheme
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(  // Wrap in a Hero widget for nice transitions
              tag: 'service_image_1', // Assuming a unique id per service
              child: Image.asset(
                service.assetName,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.providerName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(service.serviceName, style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  Text('Address: ${service.address}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Phone: ${service.phoneNumber}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text('Our Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  // Lista de tarjetas con ejemplos de servicios
                  Container(
                    height: 200, // Define un alto fijo para el contenedor
                    child: ListView(
                      scrollDirection: Axis.horizontal, // Desplazamiento horizontal para las tarjetas
                      children: <Widget>[
                        Card(
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.build, size: 48), // Icono representativo
                                Text('Installation', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('All types of installations'),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.cleaning_services, size: 48),
                                Text('Cleaning', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Professional cleaning services'),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.security, size: 48),
                                Text('Security', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Reliable security solutions'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Available Times', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  CalendarWidget(),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Implementación para reservas o contacto
                      },
                      child: Text('Book Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // update `_focusedDay` here to sync with selected day
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.deepPurple[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
