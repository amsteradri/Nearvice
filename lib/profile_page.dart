import 'package:flutter/material.dart';

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Text('¡Bienvenido a la segunda pantalla!'),
      ),
    );
  }
}
