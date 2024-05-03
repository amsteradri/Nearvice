import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'home.dart';

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPageState createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  double _rating = 0.0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Valoración', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,  // Esto evitará que se muestre la flecha de retroceso
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Valoración del servicio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'A continuación, valora qué tal ha sido el servicio, o si hay algo que se pueda mejorar también lo puedes decir. Tu valoración la podrá ver el servicio. Gracias.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: "Escribe tu valoración...",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Enviar'),
              onPressed: () {
                // Navega de regreso a la MainPage
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  ModalRoute.withName('/'),  // Asegura que no puedas volver a la página actual
                );

                // Muestra un SnackBar en la MainPage después de que la pantalla haya cambiado
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Servicio finalizado correctamente"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    )
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo del botón
              ),
            ),


          ],
        ),
      ),
    );
  }
}
