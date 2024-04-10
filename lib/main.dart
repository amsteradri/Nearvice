import 'package:flutter/material.dart';
import 'dart:math';

Color brokenWhite = Color(0xFFFFFEEE); // Esto representa un blanco con un toque de gris

void main() {
  runApp(const NearviceApp());
}

class NearviceApp extends StatelessWidget {
  const NearviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearvice',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.black,
          secondary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white24,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double beginX = screenWidth / sqrt(screenWidth * screenWidth + screenHeight * screenHeight) * 5.5;
    final double beginY = -screenHeight / sqrt(screenWidth * screenWidth + screenHeight * screenHeight) * 0.2;
    final double endX = screenWidth / sqrt(screenWidth * screenWidth + screenHeight * screenHeight) * 1.2;
    final double endY = screenHeight / sqrt(screenWidth * screenWidth + screenHeight * screenHeight) * 1.2;
    final logoSize = screenHeight * 0.224;
    final double padding = screenWidth * 0.1;
    final double formWidth = screenWidth - padding * 2;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Añadido para evitar que el contenido se mueva hacia arriba
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(beginX, beginY),
            end: Alignment(endX, endY),
            colors: [brokenWhite, Colors.black],
            stops: [0.35, 0.35],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: formWidth,
                    height: logoSize * 1.3,
                    child: Transform.translate(
                      offset: Offset(0, screenHeight * 0.117),
                      child: Transform.rotate(
                        angle: 0.617,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 170),
                  Container(
                    width: formWidth,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nombre de usuario',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: formWidth,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Contraseña',
                      ),
                      obscureText: true, // Correctamente movido aquí
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: formWidth,
                    child: ElevatedButton(
                      onPressed: () {}, // Acción al presionar
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: formWidth,
                    child: OutlinedButton(
                      onPressed: () {}, // Acción al presionar
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
                      ),
                      child: const Text('Registrarse'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: formWidth,
                    child: TextButton.icon(
                      onPressed: () {}, // Acción al presionar
                      icon: const Icon(Icons.login, color: Colors.white),
                      label: const Text('Continuar con Google'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: formWidth,
                    child: TextButton.icon(
                      onPressed: () {}, // Acción al presionar
                      icon: const Icon(Icons.apple, color: Colors.white),
                      label: const Text('Continuar con Apple'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

