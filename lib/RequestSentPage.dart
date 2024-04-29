import 'package:flutter/material.dart';

class RequestConfirmationPage extends StatelessWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;

  const RequestConfirmationPage({
    Key? key,
    required this.selectedDay,
    required this.selectedTimeSlot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the selected day in a more friendly format
    String formattedDate = "${selectedDay.year}/${selectedDay.month.toString().padLeft(2,'0')}/${selectedDay.day.toString().padLeft(2,'0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Solicitud',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Espera hasta que el servicio acepte tu solicitud, una vez el servicio te la acepte se te abrirá automáticamente el chat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Piscinas LGF',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.black54),
                    SizedBox(height: 8),
                    Text(
                      'Día $formattedDate | Hora $selectedTimeSlot',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Esperando a que Piscinas LGF acepte tu petición, una vez acepte tu petición se abrirá automáticamente el chat con el servicio.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
