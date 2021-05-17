import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding largeFeaturedCardWidget({screenWidth: double, screenHeight: double, title: String, useAsAppBar: false, displayImage: bool}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(screenWidth / 18, 0, screenWidth / 18, 5),
    child: Card(
      elevation: 8,
      shadowColor: ThemeProvider.secondaryTextColor,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight / 2),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  children: [
                    useAsAppBar ? Spacer(flex: 1) : Text(''), //i set this as a blank text widget because i cant return nothing :/
                    useAsAppBar ? Icon(Icons.arrow_back_ios, color: ThemeProvider.secondaryTextColor) : Spacer(flex: 1),
                    Spacer(flex: 2),
                    Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ThemeProvider.secondaryTextColor)),
                    Spacer(flex: 2),
                    Icon(Icons.search, color: ThemeProvider.secondaryTextColor),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          useAsAppBar
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 1),
                      Icon(Icons.ac_unit),
                      Spacer(flex: 1),
                      Icon(Icons.ac_unit),
                      Spacer(flex: 1),
                      Icon(Icons.ac_unit),
                      Spacer(flex: 1),
                      Icon(Icons.ac_unit),
                      Spacer(flex: 1),
                    ],
                  ),
                )
              : displayImage
                  ? Image.asset(
                      'assets/images/cessnaFrontView.png',
                      scale: 6,
                      fit: BoxFit.fill,
                    )
                  : Text('')
        ],
      ),
    ),
  );
}
