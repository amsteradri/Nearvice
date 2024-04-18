import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'chat.dart';

class ChatItem {
  final String profileImage;
  final String name;
  final String lastMessage;
  final int unreadMessages;

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.lastMessage,
    this.unreadMessages = 0,
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
  TextEditingController _searchController = TextEditingController(); // Controlador de texto
  bool _isSearchFocused = false; // Estado de foco de búsqueda
  bool _isClearVisible = false; // Estado de visibilidad del botón de limpiar

  Widget _buildTitle() {
    if (_isSearchFocused) {
      return Padding(
        padding: const EdgeInsets.only(left: 0.0),
        // Set padding to 0 or adjust as needed to align left
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 1, // Increase the width to 95% of the screen width
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(
                20), // Rounded corners of the container
          ),
          child: TextField(
            autofocus: true, // Automatically focus the text field
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _isClearVisible =
                    value.isNotEmpty; // Show or hide the clear icon
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: 20.0),
              // Padding inside the text field
              hintText: 'Buscar...',
              border: InputBorder.none,
              suffixIcon: _isClearVisible
                  ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  _isClearVisible = false;
                },
              )
                  : null,
            ),
          ),
        ),
      );
    } else {
      return Text(
        'Actividad',
        style: TextStyle(color: Colors.white),
      );
    }
  }


  Widget _buildLeadingIcon() {
    if (_isSearchFocused) {
      return IconButton(
        icon: Icon(Icons.search, color: Colors.grey),
        onPressed: () {
          setState(() {
            _isSearchFocused = false;
            _searchController.clear();
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.search, color: Colors.grey),
        onPressed: () {
          setState(() {
            _isSearchFocused = true;
          });
        },
      );
    }
  }


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
      ),
      ChatItem(
        profileImage: 'assets/images/ninera.png',
        name: 'Julia Ramos',
        lastMessage: '¿Recibiste el archivo que te envié?',
        unreadMessages: 1,
      ),
      ChatItem(
        profileImage: 'assets/images/albañil.png',
        name: 'Marco Pineda',
        lastMessage: 'Mañana nos vemos para el café.',
        unreadMessages: 0,
      ),
      ChatItem(
        profileImage: 'assets/images/chef.png',
        name: 'Lorena Ruiz',
        lastMessage: '¡Gracias por tu ayuda con el proyecto!',
        unreadMessages: 5,
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
          PopupMenuButton(
            icon: Icon(Icons.settings),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Ordenar por nombre'),
                  value: 'name',
                ),
                PopupMenuItem(
                  child: Text('Ordenar por fecha'),
                  value: 'date',
                ),
                // Agrega más opciones de menú según sea necesario
              ];
            },
            onSelected: (value) {
              // Manejar la selección del menú aquí
              print('Selected: $value');
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2, // Número total de pestañas
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Notificaciones'),
              ],
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
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return InkWell(
          onTap: () {
            // Navegación a la pantalla de chat específica
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(
                        chat: chat), // Asegúrate de que ChatScreen acepte un parámetro de tipo ChatItem
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat.profileImage),
            ),
            title: Text(
              chat.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(chat.lastMessage),
            trailing: chat.unreadMessages > 0
                ? CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: Text(
                '${chat.unreadMessages}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : null,
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
              color: Theme
                  .of(context)
                  .primaryColor,
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


