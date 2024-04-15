import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

class ChatItem {
  final String profileImage;
  final String name;
  final String lastMessage;
  final int unreadMessages; // Nuevo campo para indicar el número de mensajes no leídos

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.lastMessage,
    this.unreadMessages = 0, // Por defecto, no hay mensajes no leídos
  });
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  TextEditingController _searchController = TextEditingController(); // Controlador de texto
  bool _isSearchFocused = false; // Estado de foco de búsqueda
  bool _isClearVisible = false; // Estado de visibilidad del botón de limpiar

  final List<ChatItem> chats = [
    ChatItem(
      profileImage: 'assets/profile_images/person1.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Hola, necesitaría un servicio!',
      unreadMessages: 3, // Ejemplo de 3 mensajes no leídos
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    ChatItem(
      profileImage: 'assets/profile_images/person2.jpg',
      name: 'Adrian Vaquis Gordis',
      lastMessage: 'Muchas gracias!',
    ),
    // Add more chat items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
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
                      onTap: () {
                        // Aquí puedes manejar la interacción con el chat
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
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

  Widget _buildTitle() {
    if (_isSearchFocused) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Color de fondo del contenedor
          borderRadius: BorderRadius.circular(20), // Bordes redondeados del contenedor
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _isClearVisible = value.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            hintText: 'Buscar...',
            border: InputBorder.none,
            suffixIcon: _isClearVisible
                ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _isClearVisible = false;
                });
              },
            )
                : null,
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
}

void main() {
  runApp(MaterialApp(
    home: ActivityPage(),
  ));
}
