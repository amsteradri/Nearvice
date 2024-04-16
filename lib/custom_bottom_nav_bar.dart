import 'package:flutter/material.dart';
import 'home.dart'; // Assume you have a page called MainPage
import 'profile_page.dart'; // Assume you have a page called SecondPage
import 'map.dart';
import 'activity.dart';

Route createFadeRoute({required Widget page, required BuildContext context, Duration duration = const Duration(milliseconds: 50)}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: duration,
  );
}

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0; // Initialize the selected index

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Ensures the type is fixed
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Actividad',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.grey, // Color when selected
      unselectedItemColor: Colors.grey, // Color when not selected
      onTap: (int index) {
        setState(() {
          _selectedIndex = index; // Update the selected index
        });

        Widget nextPage = MainPage(); // Default page
        switch (index) {
          case 0:
            nextPage = MainPage(); // Assumes MainPage is 'Inicio'
            break;
          case 1:
            nextPage = MapScreen(); // Assumes SecondPage is 'Mapa'
            break;
          case 2:
            nextPage = ActivityPage(); // Placeholder, update as needed
            break;
          case 3:
            nextPage = SegundaPantalla(); // Assumes SecondPage is 'Perfil'
            break;
        }

        Navigator.of(context).pushReplacement(
          createFadeRoute(page: nextPage, context: context),
        );
      },
    );
  }
}
