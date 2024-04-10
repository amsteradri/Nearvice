import 'package:flutter/material.dart';
import 'dart:math';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.1; // 10% padding on both sides
    double formWidth = screenWidth - padding * 2; // Subtract the padding from the total width

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(4.75, 0), // Más inclinado desde la parte superior
            end: Alignment(2, 2), // Más inclinado hacia la parte inferior
            colors: [Colors.white, Colors.black],
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
                    child: Transform.rotate(
                      angle: 0.6, // Rotación de 60 grados en radianes.
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 200),
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
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: formWidth,
                    child: ElevatedButton(
                      child: const Text('Iniciar sesión'),
                      onPressed: () {
                        // Handle login logic
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: formWidth,
                    child: OutlinedButton(
                      child: const Text('Registrarse'),
                      onPressed: () {
                        // Handle registration logic
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: formWidth,
                    child: TextButton.icon(
                      icon: const Icon(Icons.login, color: Colors.white),
                      label: const Text('Continuar con Google'),
                      onPressed: () {
                        // Handle Google login logic
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: formWidth,
                    child: TextButton.icon(
                      icon: const Icon(Icons.apple, color: Colors.white),
                      label: const Text('Continuar con Apple'),
                      onPressed: () {
                        // Handle Apple login logic
                      },
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
