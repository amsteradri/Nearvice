import 'package:flutter/material.dart';

class RatingHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista extendida y detallada de valoraciones
    final List<Map<String, dynamic>> ratings = List.generate(20, (index) {
      return {
        'stars': (index % 5) + 1,  // Esto generará valoraciones de 1 a 5 estrellas
        'comment': 'Comentario de ejemplo ${index + 1}, muy ${index % 5 == 4 ? "satisfecho" : "mejorable"}.'
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Valoraciones', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ratings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (starIndex) => Icon(
                Icons.star,
                color: starIndex < ratings[index]['stars'] ? Colors.amber : Colors.grey,
              )),
            ),
            title: Text('Valoración de ${ratings[index]['stars']} estrellas'),
            subtitle: Text(ratings[index]['comment']),
          );
        },
      ),
    );
  }
}
