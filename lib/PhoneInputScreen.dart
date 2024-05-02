import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para usar TextInputType
import 'package:nearvice/location_screen.dart';
import 'home.dart';

class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isPhoneSubmitted = false;
  String _selectedPrefix = '+1';

  final List<String> _prefixes = ['+1', '+44', '+91', '+34', '+61', '+55'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ingresa tu número de teléfono', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              if (!_isPhoneSubmitted)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 50, // Establece la misma altura para el cuadro de prefijo
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black), // Borde negro
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black), // Borde negro en el estado normal
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black), // Borde negro en el estado enfocado
                          ),
                        ),
                        dropdownColor: Colors.white,
                        value: _selectedPrefix,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          setState(() {
                            _selectedPrefix = value!;
                          });
                        },
                        items: _prefixes.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Cambia el color de la flecha a negro
                      ),
                    ),

                    SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50, // Establece la misma altura para el campo de texto del número de teléfono
                        child: TextFormField(
                          cursorHeight: 20,
                          controller: _phoneController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Número de teléfono',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black), // Borde en color negro
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, introduce tu número de teléfono';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 20),
              if (!_isPhoneSubmitted)
                Center(  // Agrega un widget Center para centrar el botón en su contenedor
                  child: ElevatedButton(
                    child: Text('Enviar número'),
                    onPressed: () {
                      setState(() {
                        _phoneController.text = '$_selectedPrefix ${_phoneController.text}';
                        _isPhoneSubmitted = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor: Colors.white, // Text Color
                      minimumSize: Size(200, 50),  // Establece el tamaño mínimo del botón
                      maximumSize: Size(200, 50),  // Establece el tamaño máximo del botón
                    ),
                  ),
                ),


              if (_isPhoneSubmitted)
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _codeController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                          ),
                          hintText: '_ _ _  _ _ _ ',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length != 6) {
                            return 'Introduce un código de 6 dígitos';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Validar código'),
                      onPressed: () {
                        // Lógica de validación del código
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LocationScreen()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isPhoneSubmitted = false;
                          _phoneController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Editar número'),
                    ),
                  ],
                ),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Fondo de toda la pantalla
    );
  }
}
