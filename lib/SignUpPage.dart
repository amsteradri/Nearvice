import 'package:flutter/material.dart';
import 'signup_service_screen.dart'; // Asegúrate de tener una pantalla de registro para el servicio
import 'signup_consumer_screen.dart'; // Asegúrate de tener una pantalla de registro para el consumidor

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up 1/3'),
        backgroundColor: Colors.black,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            height: 20,
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.green),
                ),
                Expanded(
                  flex: 2,
                  child: Container(), // Los otros dos segmentos permanecen grises
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpServiceScreen()),
                );
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Como servicio',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(height: 2, color: Colors.black), // Línea negra como separador
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpConsumerScreen()),
                );
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Como consumidor',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
