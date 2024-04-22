import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para usar TextInputType
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
                    Container(
                      width: 80,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        dropdownColor: Colors.grey[800],
                        value: _selectedPrefix,
                        style: TextStyle(color: Colors.white),
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
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        cursorHeight: 20,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Número de teléfono',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
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
                      backgroundColor: Colors.blue, // Background color
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '_ _ _  _ _ _ ',
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
                        // Aquí puedes incluir la lógica para validar el código antes de navegar
                        // Si el código es válido, entonces navega a la HomePage
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()), // Asegúrate de que HomePage es el widget de tu página principal
                              (Route<dynamic> route) => false, // Esto elimina todas las rutas anteriores de la pila
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
                        backgroundColor: Colors.grey, // Background color for the "Edit" button
                        foregroundColor: Colors.white, // Text color for the "Edit" button
                      ),
                      child: Text('Editar número'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
