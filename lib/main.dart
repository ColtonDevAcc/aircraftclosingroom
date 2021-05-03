import 'package:aircraftclosingroom/models/homeModel.dart';
import 'package:aircraftclosingroom/views/mainView.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//are you packaging on a development build?.. if so change to true ELSE false
bool _debugBuild = true;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static ThemeData mainTheme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: _debugBuild,
        home: MainView(),
        theme: mainTheme,
      ),
    );
  }
}
