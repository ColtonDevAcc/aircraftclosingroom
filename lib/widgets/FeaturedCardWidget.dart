import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding largeFeaturedCardWidget({screenWidth: double, screenHeight: double, title: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(screenWidth / 18, 0, screenWidth / 18, 5),
    child: Card(
      elevation: 8,
      shadowColor: Global.secondaryTextColor,
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
              child: Row(
                children: [
                  Spacer(flex: 3),
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Global.secondaryTextColor)),
                  Spacer(flex: 2),
                  Icon(Icons.search, color: Global.secondaryTextColor),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
          //Image.asset(),
        ],
      ),
    ),
  );
}
