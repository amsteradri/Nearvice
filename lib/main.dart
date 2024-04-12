import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_page.dart';
import 'home.dart';


const brokenWhite = Color(0xFFFFFEEE); // Esto representa un blanco con un toque de gris

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
    final padding = screenWidth * 0.1;
    final formWidth = screenWidth - padding * 2;

    // Calcula el tamaño del logo como una fracción de la altura de la pantalla para mantenerlo responsivo.
    final logoSize = screenHeight * 0.15;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [brokenWhite, Colors.black],
            stops: [0.35, 0.35],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Transform.translate(
                    // Calcula el offset como un porcentaje de la altura de la pantalla
                    offset: Offset(0, screenHeight * 0.075), // Por ejemplo, mueve el logo un 8% hacia abajo.
                    child: Transform.rotate(
                      angle: 0.48, // Rotación ajustada, si es necesaria.
                      child: Image.asset('assets/images/logo.png', height: logoSize),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25), // Aumenta este valor para hacer los campos de texto menos anchos
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Nombre de usuario',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25), // Ajusta este valor según necesites
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Contraseña',
                          ),
                          obscureText: true,
                        ),
                      ),

                      SizedBox(height: 24),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)), // Aumenta el padding
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)), // Aumenta el tamaño del texto
                          minimumSize: MaterialStateProperty.all(Size(180, 50)), // Establece un tamaño mínimo para el botón
                        ),
                        child: const Text('Iniciar sesión'),
                      ),
                      SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)), // Aumenta el padding
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)), // Aumenta el tamaño del texto
                          minimumSize: MaterialStateProperty.all(Size(180, 50)), // Establece un tamaño mínimo para el botón
                        ),
                        child: const Text('Registrarse'),
                      ),
                      SizedBox(height: 16),
// Ajuste aquí para el icono de Google SVG.
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)), // Aumenta el padding
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)), // Ajusta el tamaño del texto
                          minimumSize: MaterialStateProperty.all(Size(180, 50)), // Establece un tamaño mínimo para el botón
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/images/google.svg', width: 20, height: 20), // Ajusta el tamaño si es necesario
                            SizedBox(width: 8),
                            Text('Continuar con Google'),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.apple, color: Colors.white),
                        label: Text('Continuar con Apple'),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)), // Aumenta el padding
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)), // Aumenta el tamaño del texto
                          minimumSize: MaterialStateProperty.all(Size(180, 50)), // Establece un tamaño mínimo para el botón
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
