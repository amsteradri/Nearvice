import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'chat.dart';
import 'package:intl/intl.dart';


class ChatItem {
  final String profileImage;
  final String name;
  final String lastMessage;
  final int unreadMessages;
  final DateTime lastMessageTime;  // Nuevo campo para la hora del último mensaje

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.lastMessage,
    this.unreadMessages = 0,
    required this.lastMessageTime, // Asegúrate de pasar este parámetro al crear un ChatItem
  });
}


class NotificationItem {
  final String title;
  final String message;
  final DateTime date;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<ChatItem> chats = [];
  List<NotificationItem> notifications = [];
  List<ChatItem> filteredChats = [];
  TextEditingController _searchController = TextEditingController(); // Controlador de texto
  bool _isSearchFocused = false; // Estado de foco de búsqueda
  bool _isClearVisible = false; // Estado de visibilidad del botón de limpiar

  @override
  void initState() {
    super.initState();
    // Aquí cargarías tus datos de chats y notificaciones
    chats = [
      ChatItem(
        profileImage: 'assets/images/peluquero.png',
        name: 'Adrian Vaquis',
        lastMessage: 'Hola, ¿qué tal tu día?',
        unreadMessages: 2,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 10)),
      ),
      ChatItem(
        profileImage: 'assets/images/ninera.png',
        name: 'Julia Ramos',
        lastMessage: '¿Recibiste el archivo que te envié?',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 40)),
      ),
      ChatItem(
        profileImage: 'assets/images/albañil.png',
        name: 'Marco Pineda',
        lastMessage: 'Mañana nos vemos para el café.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 3)),
      ),
      ChatItem(
        profileImage: 'assets/images/chef.png',
        name: 'Lorena Ruiz',
        lastMessage: '¡Gracias por tu ayuda con el proyecto!',
        unreadMessages: 5,
        lastMessageTime: DateTime.now().subtract(Duration(days: 2)),
      ),
      ChatItem(
        profileImage: 'assets/images/peluquero.png',
        name: 'Carlos Giménez',
        lastMessage: 'Tu coche está listo para recoger.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/profile_pic.jpg',
        name: 'Fernando Torres',
        lastMessage: 'El jardín ha quedado excelente.',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/burguer.png',
        name: 'Isabel Marín',
        lastMessage: 'La próxima clase hemos cambiado el horario.',
        unreadMessages: 3,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 5)),
      ),
      ChatItem(
        profileImage: 'assets/images/carpintero.png',
        name: 'Juan Martínez',
        lastMessage: '¿Podemos discutir el diseño mañana?',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 15)),
      ),
      ChatItem(
        profileImage: 'assets/images/pastelera.png',
        name: 'Sofia Núñez',
        lastMessage: 'Tu pedido está en camino.',
        unreadMessages: 2,
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/dentista.png',
        name: 'Elena Rodríguez',
        lastMessage: 'Recuerda tu cita mañana a primera hora.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 4)),
      ),
      ChatItem(
        profileImage: 'assets/images/chofer.png',
        name: 'Luis Domínguez',
        lastMessage: 'He enviado las fotos del evento.',
        unreadMessages: 4,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
      ),
      ChatItem(
        profileImage: 'assets/images/peluquero.png',
        name: 'Ana Pereira',
        lastMessage: '¿Cómo está el pequeño Rocky?',
        unreadMessages: 2,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 25)),
      ),
      ChatItem(
        profileImage: 'assets/images/fontanero.png',
        name: 'David Soto',
        lastMessage: 'He actualizado tu plan de inversiones.',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 6)),
      ),
      ChatItem(
        profileImage: 'assets/images/tatuador.png',
        name: 'Miguel Ángel',
        lastMessage: '¿Quieres revisar algunos diseños?',
        unreadMessages: 5,
        lastMessageTime: DateTime.now().subtract(Duration(days: 3)),
      ),
      ChatItem(
        profileImage: 'assets/images/albañil.png',
        name: 'Roberto López',
        lastMessage: 'Mañana aumentamos la intensidad del entrenamiento.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 50)),
      ),
      ChatItem(
        profileImage: 'assets/images/electricista.png',
        name: 'Sandra Gutiérrez',
        lastMessage: 'Confirmo la hora de la limpieza para mañana.',
        unreadMessages: 3,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/pintor.png',
        name: 'Óscar Muñoz',
        lastMessage: '¿Qué te parece el color que seleccionamos?',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(days: 2)),
      ),
      ChatItem(
        profileImage: 'assets/images/agente_inmobiliario.png',
        name: 'Clara Fernández',
        lastMessage: '¡La actuación de ayer fue un éxito!',
        unreadMessages: 4,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 30)),
      ),
      ChatItem(
        profileImage: 'assets/images/cerrajero.png',
        name: 'Antonio Ramírez',
        lastMessage: 'He revisado tu caso y te he enviado los detalles por email.',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 8)),
      ),
      ChatItem(
        profileImage: 'assets/images/tecnico_pc.png',
        name: 'José Vidal',
        lastMessage: 'Tu transporte ha sido arreglado, todo listo para el jueves.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 12)),
      ),
      ChatItem(
        profileImage: 'assets/images/peluquero.png',
        name: 'Carlos González',
        lastMessage: 'Tu nuevo estilo ha sido un éxito.',
        unreadMessages: 2,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 10)),
      ),
      ChatItem(
        profileImage: 'assets/images/ninera.png',
        name: 'Marta López',
        lastMessage: 'Los niños están listos para dormir.',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
      ),
      ChatItem(
        profileImage: 'assets/images/albañil.png',
        name: 'Jorge Gutiérrez',
        lastMessage: 'El muro quedará listo mañana.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/burguer.png',
        name: 'Tomás Burger',
        lastMessage: 'La promoción de hamburguesas empieza el lunes.',
        unreadMessages: 3,
        lastMessageTime: DateTime.now().subtract(Duration(days: 2)),
      ),
      ChatItem(
        profileImage: 'assets/images/carpintero.png',
        name: 'Carlos González',
        lastMessage: '¿Cómo te quedó el corte de pelo?',
        unreadMessages: 1,
        lastMessageTime: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      ChatItem(
        profileImage: 'assets/images/ninera.png',
        name: 'Ana Martínez',
        lastMessage: 'Los niños preguntaron por ti.',
        unreadMessages: 0,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
      ),
      // Repite con todos los servicios disponibles...
      ChatItem(
        profileImage: 'assets/images/chef.png',
        name: 'Pedro Chef',
        lastMessage: 'Mañana cocinaremos algo especial.',
        unreadMessages: 2,
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
      ),
      ChatItem(
        profileImage: 'assets/images/fontanero.png',
        name: 'Mario Tubos',
        lastMessage: 'El problema de la tubería está resuelto.',
        unreadMessages: 3,
        lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ];



    notifications = [
      NotificationItem(
        title: 'Servicio Confirmado',
        message: 'Tu cita con el cerrajero ha sido confirmada para el 23 de marzo a las 3:00 PM.',
        date: DateTime.now().subtract(Duration(days: 1)),
      ),
      NotificationItem(
        title: 'Promoción Disponible',
        message: 'Aprovecha un 20% de descuento en tu próxima contratación de servicios de jardinería.',
        date: DateTime.now().subtract(Duration(days: 2)),
      ),
      NotificationItem(
        title: 'Actualización de Servicio',
        message: 'Tu servicio de limpieza ha sido programado para el 30 de marzo a las 10:00 AM.',
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      NotificationItem(
        title: 'Pago Recibido',
        message: 'Hemos recibido tu pago por el servicio de tutoría. Gracias por elegirnos.',
        date: DateTime.now().subtract(Duration(days: 4)),
      ),
      NotificationItem(
        title: 'Nuevo Servicio Disponible',
        message: 'Descubre nuestro nuevo servicio de mecánica a domicilio disponible en tu área.',
        date: DateTime.now().subtract(Duration(days: 5)),
      ),
      NotificationItem(
        title: 'Reseña Solicitada',
        message: '¿Te gustó nuestro servicio? Por favor, toma un momento para calificarnos.',
        date: DateTime.now().subtract(Duration(days: 6)),
      ),
      NotificationItem(
        title: 'Recordatorio de Cita',
        message: 'Recuerda tu cita con el electricista mañana a las 2:00 PM.',
        date: DateTime.now().subtract(Duration(days: 7)),
      ),
      NotificationItem(
        title: 'Servicio Cancelado',
        message: 'Tu cita con el pintor para el 29 de marzo ha sido cancelada.',
        date: DateTime.now().subtract(Duration(days: 8)),
      ),
      NotificationItem(
        title: 'Actualización de Política',
        message: 'Hemos actualizado nuestras políticas de privacidad. Revisa los cambios para seguir utilizando nuestros servicios.',
        date: DateTime.now().subtract(Duration(days: 9)),
      ),
      NotificationItem(
        title: 'Evento Especial',
        message: 'Únete a nuestro evento en línea este sábado y aprende más sobre cómo mejorar tu hogar con nuestros expertos.',
        date: DateTime.now().subtract(Duration(days: 10)),
      ),
    ];

    filteredChats = List.from(chats);
  }



  Widget _buildTitle() {
    return _isSearchFocused
        ? Container(
      height: 40, // Altura del TextField
      margin: EdgeInsets.only(left: 8.0), // Margen izquierdo para alinear a la izquierda
      decoration: BoxDecoration(
        color: Colors.white, // Color de fondo
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
      ),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Buscar...',
          contentPadding: EdgeInsets.only(left: 16.0), // Ajusta el padding interno
          border: InputBorder.none,
          suffixIcon: _isClearVisible
              ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              setState(() {
                _isClearVisible = false;
              });
            },
          )
              : null,
        ),
        onChanged: (text) {
          setState(() {
            // Actualiza la lista de chats con el filtro aplicado
            filteredChats = chats.where((chat) {
              return chat.name.toLowerCase().contains(text.toLowerCase());
            }).toList();
          });
        },
      ),
    )
        : Text(
      'Actividad',
      style: TextStyle(color: Colors.white),
    );
  }





  Widget _buildLeadingIcon() {
    return IconButton(
      icon: Icon(_isSearchFocused ? Icons.arrow_back : Icons.search, color: Colors.grey),
      onPressed: () {
        setState(() {
          if (_isSearchFocused) {
            // Cuando se presiona la flecha hacia atrás para dejar de buscar
            _isSearchFocused = false;
            _searchController.clear();
            _isClearVisible = false;
          } else {
            // Cuando se presiona la lupa para empezar a buscar
            _isSearchFocused = true;
          }
        });
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        toolbarHeight: MediaQuery
            .of(context)
            .size
            .height * 0.08,
        leading: _buildLeadingIcon(),
        title: _buildTitle(),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
            child: PopupMenuButton<String>(
              icon: Icon(Icons.filter_alt_outlined, color: Colors.grey, size: 30), // Aumentar el tamaño del icono aquí
              onSelected: (String result) {
                setState(() {
                  if (result == 'name') {
                    // Ordenar por nombre
                    chats.sort((a, b) => a.name.compareTo(b.name));
                    // Actualiza filteredChats basándose en si la búsqueda está activa
                    if (_isSearchFocused && _searchController.text.isNotEmpty) {
                      filteredChats.sort((a, b) => a.name.compareTo(b.name));
                    } else {
                      filteredChats = List.from(chats); // Copia la lista ordenada a filteredChats
                    }
                  } else if (result == 'date') {
                    // Ordenar por fecha
                    chats.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
                    // Actualiza filteredChats basándose en si la búsqueda está activa
                    if (_isSearchFocused && _searchController.text.isNotEmpty) {
                      filteredChats.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
                    } else {
                      filteredChats = List.from(chats); // Copia la lista ordenada a filteredChats
                    }
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'name',
                  child: Text('Ordenar por nombre'),
                ),
                const PopupMenuItem<String>(
                  value: 'date',
                  child: Text('Ordenar por fecha'),
                ),
              ],
            ),
          )


        ],
      ),
      body: DefaultTabController(
        length: 2, // Número total de pestañas
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white, // Color de fondo del TabBar
              height: 60, // Ajustar la altura aquí
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(child: Text('Chats', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black))),  // Aumentar el tamaño del texto
                  Tab(child: Text('Notificaciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black))),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildChatsView(),
                  _buildNotificationsView(),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildChatsView() {
    // Vista de la pestaña de Chats
    return ListView.builder(
      itemCount: filteredChats.length, // Usas filteredChats aquí
      itemBuilder: (context, index) {
        final chat = filteredChats[index]; // Y aquí
        return InkWell(
          onTap: () {
            // Navegación a la pantalla de chat específica
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(chat: chat),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chat.profileImage),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        chat.lastMessage,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        DateFormat('hh:mm a').format(chat.lastMessageTime), // Formatea la hora del último mensaje
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                if (chat.unreadMessages > 0)
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat.unreadMessages}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }




  Widget _buildNotificationsView() {
    // Vista de la pestaña de Notificaciones
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(

          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.purple[200],
              size: 40,
            ),
            title: Text(
              notification.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(notification.message),
            ),
            trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${notification.date.day}/${notification.date
                    .month}/${notification.date.year}",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


