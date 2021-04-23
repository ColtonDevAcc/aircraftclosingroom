//this is where we implement the colors of the app.. NO HARD CODING!!
import 'package:flutter/material.dart';

// we really dont need to set this up in another file but i think its best to keep it with the other themes..
ThemeData mainTheme = ThemeData(
  //TODO: setup a color scheme for the application
  colorScheme: null,

  //dark mode or bright mode are toggles here. We could make this a state full widget so the user can toggle it themselves.
  brightness: Brightness.dark,
  primaryColor: null,
  accentColor: null,
  fontFamily: null,
  textTheme: TextTheme(
    //example of headline code headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline1: null,
    headline3: null,
    headline4: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: null,
    //example of body text bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    bodyText2: null,
  ),
);
