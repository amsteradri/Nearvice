import 'package:flutter/material.dart';

class VerifyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Verificar', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.verified, color: Colors.blue), // Icono de verificado
                    SizedBox(width: 8), // Espaciado entre el icono y el texto
                    Text('Plan de Pago', style: TextStyle(color: Colors.black, fontSize: 20)), // Título
                  ],
                ),
                SizedBox(height: 16), // Separación entre el título y los requisitos
                Text(
                  'Requisitos:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '- 50 pedidos exitosos y media de 4 estrellas, menos de 10 valoraciones negativas',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '- Requisito 2',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '- Requisito 3',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
                Text(
                  'Lo que obtienes:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '- Perfil de fiar',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '- Eres más recomendado',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '- Recompensas por mayor cantidad de servicios dados, etc.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
                Text(
                  'Precio:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '6,99€/MES',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón de comprar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Color de fondo negro
                    textStyle: TextStyle(fontSize: 20, color: Colors.white), // Estilo del texto
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Padding del botón
                  ),
                  child: Text(
                    'Conseguir Nearvice Verify',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
