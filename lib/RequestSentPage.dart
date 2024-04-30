import 'package:flutter/material.dart';
import 'dart:async';
import 'package:nearvice/activity.dart'; // Assuming 'ChatItem' is defined in this file
import 'chat.dart'; // Ensure this file exists and defines a ChatScreen widget

class RequestConfirmationPage extends StatefulWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;

  const RequestConfirmationPage({
    Key? key,
    required this.selectedDay,
    required this.selectedTimeSlot,
  }) : super(key: key);

  @override
  _RequestConfirmationPageState createState() => _RequestConfirmationPageState();
}

class _RequestConfirmationPageState extends State<RequestConfirmationPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the timer in initState
    _timer = Timer(Duration(seconds: 10), navigateToChatScreen);
  }

  @override
  void dispose() {
    // Always cancel the timer to avoid memory leaks and unexpected behaviors
    _timer.cancel();
    super.dispose();
  }

  void navigateToChatScreen() {
    // Create an instance of ChatItem, assuming that it has these fields
    ChatItem chat = ChatItem(
      profileImage: 'assets/images/peluquero.png',  // Example URL to profile image
      name: 'Piscinas LGF',  // Example name
      lastMessage: 'Último mensaje',  // Example last message
      lastMessageTime: DateTime.now(),  // Example timestamp
    );

    // Navigate to the ChatScreen with the ChatItem
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(chat: chat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${widget.selectedDay.year}/${widget.selectedDay.month.toString().padLeft(2, '0')}/${widget.selectedDay.day.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: const Text('Solicitud', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Solicitud',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Espera hasta que el servicio acepte tu solicitud, una vez el servicio te la acepte se te abrirá automáticamente el chat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Piscinas LGF',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.black54),
                        SizedBox(height: 8),
                        Text(
                          'Día ${formattedDate} | Hora ${widget.selectedTimeSlot}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Esperando a que Piscinas LGF acepte tu petición, una vez acepte tu petición se abrirá automáticamente el chat con el servicio.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
