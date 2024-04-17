import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'activity.dart';

class ChatScreen extends StatelessWidget {
  final ChatItem chat;

  ChatScreen({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(chat.profileImage),
            ),
            SizedBox(width: 10),
            Text(
              chat.name,
              style: TextStyle(color: Colors.white, fontSize: 20), // Ajusta el tamaño del texto aquí
            ),
            Spacer(), // Añadimos un espacio flexible para alinear a la derecha
            IconButton(
              icon: Icon(Icons.call, color: Colors.white), // Icono de llamada en blanco
              onPressed: () {
                // Lógica para realizar una llamada
              },
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white), // Cambiamos el color de la flecha de volver atrás a blanco
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(
                  message: message.text,
                  isMe: message.isMe,
                );
              },
            ),
          ),
          Container(
            color: Colors.black, // Fondo negro
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Barra blanca
                        borderRadius: BorderRadius.circular(20.0), // Borde redondeado
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_camera, color: Colors.grey), // Icono de cámara para enviar foto en gris
                            onPressed: () {
                              // Lógica para abrir la cámara
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Escribe un mensaje...',
                              ),
                              onSubmitted: (text) {
                                // Lógica para enviar el mensaje
                              },
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.mic, color: Colors.grey), // Icono para enviar audio en gris
                                onPressed: () {
                                  // Lógica para enviar un audio
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.attach_file, color: Colors.grey), // Icono para adjuntar archivos
                                onPressed: () {
                                  // Lógica para adjuntar archivos
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white), // Icono de enviar en blanco
                    onPressed: () {
                      // Lógica para enviar el mensaje
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

List<Message> messages = [
  Message(text: 'Hola', isMe: false),
  Message(text: 'Hola! ¿Cómo estás?', isMe: true),
  Message(text: 'Estoy bien, gracias.', isMe: false),
  // Agrega más mensajes aquí
];

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Añadimos más espacio alrededor del mensaje
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0, // Aumentamos el tamaño del texto
            ),
          ),
        ),
      ),
    );
  }
}
