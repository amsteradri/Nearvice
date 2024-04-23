import 'package:flutter/material.dart';
import 'signup_service_screen.dart'; // Asegúrate de tener una pantalla de registro para el servicio
import 'signup_consumer_screen.dart'; // Asegúrate de tener una pantalla de registro para el consumidor

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        centerTitle: true,

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
