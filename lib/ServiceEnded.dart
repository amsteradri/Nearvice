import 'package:flutter/material.dart';
import 'package:nearvice/activity.dart';
import 'ChatForService.dart';
import 'RatingsPage.dart';
import 'support.dart';

class ServiceEnded extends StatefulWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;

  const ServiceEnded({
    Key? key,
    required this.selectedDay,
    required this.selectedTimeSlot,
  }) : super(key: key);

  @override
  _ServiceEndedState createState() => _ServiceEndedState();
}

class _ServiceEndedState extends State<ServiceEnded> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = "${widget.selectedDay.year}/${widget.selectedDay.month.toString().padLeft(2, '0')}/${widget.selectedDay.day.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Confirmación de pago', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,  // Esto evitará que se muestre la flecha de retroceso
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Cambiado para alinear al inicio
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Confirmación de Pago',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'A continuación se procederá con el pago del servicio si está conforme con el servicio ofrecido proceda con "continuar", si no, proceda con "Reporte".',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30), // Espacio aumentado para separar el texto del card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Piscinas LGF',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Día $formattedDate | Hora ${widget.selectedTimeSlot}'),
                    Text('Reforma cañerías cocina | 100 €'),
                    SizedBox(height: 10),
                    Text(
                      'Si todo el servicio ha sido acorde a lo que solicitaba y ha sido bueno, presione "continuar" y se procederá con el pago automáticamente.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Continuar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              child: Text('Reporte'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
