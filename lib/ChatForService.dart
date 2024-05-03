import 'dart:async';
import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';  // Asumiendo que este archivo existe y se usa para la barra de navegación
import 'ServiceEnded.dart';  // Asegúrate de que la página ServiceEnded esté correctamente importada
import 'activity.dart';

class ChatScreen extends StatefulWidget {
  final ChatItem chat;
  final DateTime selectedDay;
  final String selectedTimeSlot;


  ChatScreen({required this.chat, required this.selectedDay, required this.selectedTimeSlot});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 10), navigateToEndService);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void navigateToEndService() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceEnded(
          selectedDay: widget.selectedDay,
          selectedTimeSlot: widget.selectedTimeSlot,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chat.profileImage),
            ),
            SizedBox(width: 10),
            Text(
              widget.chat.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.call, color: Colors.white),
              onPressed: () {
                // Implement call functionality
              },
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_camera, color: Colors.grey),
                            onPressed: () {
                              // Open camera
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Escribe un mensaje...',
                              ),
                              onSubmitted: (text) {
                                // Send message
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.mic, color: Colors.grey),
                            onPressed: () {
                              // Send audio message
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.attach_file, color: Colors.grey),
                            onPressed: () {
                              // Attach files
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Send message
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
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
