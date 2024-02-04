import 'package:assignment_app/homepage.dart';
import 'package:assignment_app/secondPage.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SecondPage(),
    //HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu),
              label: 'History',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Bhajan',
            backgroundColor: Color.fromARGB(255, 186, 139, 123),
          ),
        ],
        //backgroundColor: const Color.fromARGB(255, 186, 139, 123),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
