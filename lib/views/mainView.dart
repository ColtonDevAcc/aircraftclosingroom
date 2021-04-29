import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/views/homeView.dart';
import 'package:aircraftclosingroom/views/settingsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Widget> _children = [
      HomeView(),
      SettingsView(),
      SettingsView(),
      SettingsView(),
    ];

    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        selectedItemColor: Colors.white,
        unselectedItemColor: Global.secondaryColor,
        snakeViewColor: Global.primaryColor,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _children[_currentIndex],
    );
  }
}
