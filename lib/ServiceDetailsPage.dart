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
                  Text('Available Times', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  CalendarWidget(), // Modularize calendar to its own widget
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple, // Use theme color
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Implementation for booking or contacting
                      },
                      child: Text('Book Now'),  // More direct call-to-action
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
