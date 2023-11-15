import 'package:flutter/material.dart';
import 'package:myapp/src/Pages/Home.dart';

class BottomNavigationBarEventsApp extends StatelessWidget {
  const BottomNavigationBarEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarEvents();
  }
}

class BottomNavigationBarEvents extends StatefulWidget {
  const BottomNavigationBarEvents({super.key});

  @override
  State<BottomNavigationBarEvents> createState() =>
      _BottomNavigationBarEventsState();
}

class _BottomNavigationBarEventsState extends State<BottomNavigationBarEvents> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Categorías',
      style: optionStyle,
    ),
    Text(
      'Index 2: Live Stream',
      style: optionStyle,
    ),
    Text(
      'Index 3: Asignados',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Categorías',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stream),
            label: 'Live Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Asignados',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff009798),
        onTap: _onItemTapped,
      ),
    );
  }
}
