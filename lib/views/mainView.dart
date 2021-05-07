import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/views/homeView.dart';
import 'package:aircraftclosingroom/views/settingsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../views/closingCardView.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    SettingsView(),
    HomeView(),
    ClosingCardView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        selectedItemColor: Colors.white,
        unselectedItemColor: Global.secondaryTextColor,
        snakeViewColor: Global.primaryColor,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: 'f'),
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 45), label: 'f'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'f'),
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
