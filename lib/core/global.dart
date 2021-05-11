import 'package:flutter/material.dart';

class Global {
  static const List validEmail = ['test@gmail.com'];
  static const Color primaryColor = Color.fromRGBO(3, 90, 166, 1.0);
  static const Color secondaryColor = Color.fromRGBO(242, 168, 29, 1.0);
  static const Color primaryAccent = Color.fromRGBO(221, 64, 64, 1.0);
  static const Color secondaryAccent = Color.fromRGBO(255, 167, 0, 1.0);
  static const Color primaryTextColor = Colors.white;
  static const Color bodyTextColor = Color.fromRGBO(166, 168, 208, 1.0);
  static const Color secondaryTextColor = Color.fromRGBO(116, 138, 157, 1.0);
  static const Color thirdAccent = Color.fromRGBO(139, 195, 217, 1.0);
  static const Color secondaryButton = Color.fromRGBO(240, 244, 248, 1.0);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.teal,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
