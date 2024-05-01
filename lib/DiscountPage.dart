import 'package:flutter/material.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Datos simulados de descuentos
    final List<Map<String, dynamic>> discounts = [
      {
        "title": "25% de descuento en tu próxima compra",
        "description": "Aplicable a todos los productos en stock.",
        "expiryDate": "Válido hasta: 30/06/2024"
      },
      {
        "title": "Compra uno y lleva otro gratis",
        "description": "Aplicable solo para productos seleccionados.",
        "expiryDate": "Válido hasta: 15/07/2024"
      },
      {
        "title": "Envío gratuito en pedidos superiores a 50€",
        "description": "Disfruta del envío gratuito a todo el país.",
        "expiryDate": "Válido hasta: 01/08/2024"
      },
      {
        "title": "10% de descuento en nueva tecnología",
        "description": "Descuento aplicable en la sección de electrónica.",
        "expiryDate": "Válido hasta: 20/09/2024"
      },
      {
        "title": "20% de descuento en tu primer pedido de app móvil",
        "description": "Usa la app y disfruta de un descuento en tu primera compra.",
        "expiryDate": "Válido hasta: 31/12/2024"
      },
      {
        "title": "Paga 2 lleva 3 en todos los vinos",
        "description": "Ideal para los amantes del vino. Aplica en selecciones marcadas.",
        "expiryDate": "Válido hasta: 31/10/2024"
      },
      {
        "title": "30% de descuento en artículos seleccionados de moda",
        "description": "Renueva tu armario con esta oferta exclusiva en moda.",
        "expiryDate": "Válido hasta: 30/11/2024"
      },
      {
        "title": "15% de descuento en compras mayores a 100€",
        "description": "Aprovecha para hacer compras más grandes y ahorra.",
        "expiryDate": "Válido hasta: 01/01/2025"
      },
      {
        "title": "Oferta de temporada en jardinería: 25% de descuento",
        "description": "Todo lo que necesitas para tu jardín a precios rebajados.",
        "expiryDate": "Válido hasta: 22/03/2025"
      }
    ];


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Ofertas y Promociones', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Color de la flecha de retroceso
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: discounts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 4,
            shadowColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.amber),
              title: Text(discounts[index]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(discounts[index]['description'], style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 5),
                  Text(discounts[index]['expiryDate'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                // Acción al tocar cada card
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Canjear Oferta'),
                    content: Text('¿Deseas canjear esta oferta?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Aceptar'),
                        onPressed: () {
                          // Implementar la lógica de canjeo
                          Navigator.of(context).pop();
                          // Mostrar confirmación o redirigir a otra página
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
