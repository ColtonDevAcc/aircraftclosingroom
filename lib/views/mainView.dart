import 'dart:js';

import 'package:aircraftclosingroom/widgets/largeFeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          largeFeaturedCardWidget(screenHeight: screenHeight, screenWidth: screenWidth),
          //column that displays header text 'objectives/browse'
          Column(
            children: [
              SizedBox(height: 10),
              Text('Objectives', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: Colors.grey.shade500)),
              SizedBox(height: 10),
              Text('Browse', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey.shade400)),
            ],
          ),
          //car rows that display closings
          Padding(padding: EdgeInsets.fromLTRB(0, 28, 0, 0)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            //height of the cards. I dont know why the cards dont correlate with the defined height and width of the
            //variables provided in the custom widget
            height: 185.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //this is where you create the objective cards
              children: <Widget>[
                closingCardsWidget(color: Colors.red, transparent: true),
                closingCardsWidget(color: Colors.red.shade700, transparent: false),
                closingCardsWidget(color: Colors.orange.shade400, transparent: false),
                closingCardsWidget(color: Colors.blue.shade200, transparent: false),
                closingCardsWidget(color: Colors.red.shade700, transparent: false),
                closingCardsWidget(color: Colors.orange.shade400, transparent: false),
                closingCardsWidget(color: Colors.blue.shade200, transparent: false),
                closingCardsWidget(color: Colors.red.shade700, transparent: false),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container closingCardsWidget({color: Colors, transparent: bool}) {
  return Container(
    height: 180,
    width: 150,
    child: Card(
      elevation: transparent ? 0.0 : 2.0,
      shadowColor: transparent ? Colors.white.withOpacity(0) : Colors.black,
      color: transparent ? Colors.white.withOpacity(0) : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 45, 5, 14),
            child: Container(
              height: 80,
              decoration: transparent
                  ? null
                  : BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Aircraft_Jet_Engine.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
            ),
          ),
          Text('Engine', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  );
}
