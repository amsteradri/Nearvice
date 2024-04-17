import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home.dart';  // Make sure this import contains the Service model and other necessary data.

class ServiceDetailsPage extends StatelessWidget {
  final Service service;

  const ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.providerName, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(service.assetName), // Ensure your Service class contains this field or adjust accordingly.
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.providerName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(service.serviceName, style: TextStyle(fontSize: 20, color: Colors.grey)),
                  SizedBox(height: 16),
                  Text('Address: ${service.address}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Phone: ${service.phoneNumber}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text('Available Times', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Updated from `primary` to `backgroundColor`
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Your onPressed function here
                    },
                    child: Text('Button Text'),
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
