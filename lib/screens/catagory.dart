// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CatogoryScreen extends StatelessWidget {
  const CatogoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatagoryHome();
  }
}

class CatagoryHome extends StatefulWidget {
  const CatagoryHome({super.key});

  @override
  State<CatagoryHome> createState() => _CatagoryHomeState();
}

class _CatagoryHomeState extends State<CatagoryHome> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.abc,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagory Page'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Catagory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //print('$_selectedIndex' + ' ' + '$index');
    });
  }
}
