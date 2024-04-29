import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'select_time_page.dart'; // Ensure you've created this file for time selection

class Review {
  final String user;
  final String comment;
  final int rating;

  Review({required this.user, required this.comment, required this.rating});
}

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

  List<Review> reviews = [
    Review(user: "Alice", comment: "Great service!", rating: 5),
    Review(user: "Bob", comment: "Very satisfied.", rating: 4),
    Review(user: "Charlie", comment: "Good, but could be better.", rating: 3),
  ];

  double get averageRating {
    if (reviews.isEmpty) {
      return 0;
    }
    double sum = reviews.fold(0, (previousValue, element) => previousValue + element.rating);
    return sum / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: Text(service.providerName, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: AssetImage(service.assetName),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                  children: [
                    serviceCard('Installation', 'Professional setup at your convenience.', Icons.build, 120.00),
                    serviceCard('Cleaning', 'Complete and thorough cleaning.', Icons.cleaning_services, 80.00),
                    serviceCard('Security', 'Top-notch security systems.', Icons.security, 200.00),
                  ],
                ),
              ),
              if (_calendarVisible)
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Available Times for $_selectedService', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectTimePage())),
                      child: Text('Book Now', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(41.497638, 1.840593),
                    zoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: []),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Valoraciones', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('${averageRating.toStringAsFixed(1)} ★', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber)),
              SizedBox(height: 10),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person, size: 50, color: Colors.deepPurple),
                        title: Text(reviews[index].user),
                        subtitle: Text(reviews[index].comment),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (starIndex) => Icon(
                            starIndex < reviews[index].rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                          )),
                        ),
                      ),
                    );
                  },
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
          _selectedService = title;
          _calendarVisible = !_calendarVisible; // Toggle visibility based on the selection
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
