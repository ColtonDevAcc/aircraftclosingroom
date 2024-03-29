import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:aircraftclosingroom/views/home/homeView.dart';
import 'package:aircraftclosingroom/views/settings/settingsView.dart';
import 'package:aircraftclosingroom/views/userInfo/userInfoView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    SettingsView(),
    HomeView(),
    UserInfoView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        selectedItemColor: Colors.white,
        unselectedItemColor: ThemeProvider.secondaryTextColor,
        snakeViewColor: ThemeProvider.primaryColor,
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
