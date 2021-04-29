import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    void selectedPageChange(int index) {
      setState(() {
        _currentIndex = index;
        print('pressed');
      });
    }

    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.circle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      snakeViewColor: Colors.white,
      selectedItemColor: Global.primaryColor,
      unselectedItemColor: Colors.red,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: _currentIndex,
      onTap: (index) => selectedPageChange,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'f'),
      ],
    );
  }
}
