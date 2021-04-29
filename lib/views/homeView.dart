import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height.toDouble();
    double screenWidth = MediaQuery.of(context).size.height.toDouble();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        largeFeaturedCardWidget(screenHeight: screenHeight, screenWidth: screenWidth / 3.5, title: 'Your Closings'),
        //column that displays header text 'objectives/browse'
        Column(
          children: [
            SizedBox(height: 10),
            Text('Objectives', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: Global.secondaryTextColor)),
            SizedBox(height: 10),
            Text('Browse', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Global.secondaryTextColor)),
          ],
        ),
        //car rows that display closings
        Padding(padding: EdgeInsets.fromLTRB(0, 28, 0, 0)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          //height of the cards. I dont know why the cards dont correlate with the defined height and width of the
          //variables provided in the custom widget
          height: 185.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            //this is where you create the objective cards
            children: <Widget>[
              closingCardsWidget(color: Global.primaryAccent, transparent: true),
              closingCardsWidget(color: Global.primaryAccent, transparent: false),
              closingCardsWidget(color: Global.secondaryAccent, transparent: false),
              closingCardsWidget(color: Global.thirdAccent, transparent: false),
              closingCardsWidget(color: Colors.red.shade700, transparent: false),
              closingCardsWidget(color: Colors.orange.shade400, transparent: false),
              closingCardsWidget(color: Colors.blue.shade200, transparent: false),
              closingCardsWidget(color: Colors.red.shade700, transparent: false),
            ],
          ),
        )
      ],
    );
  }
}

Padding closingCardsWidget({color: Colors, transparent: bool}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      height: 200,
      width: 163,
      child: Card(
        elevation: transparent ? 0.0 : 2.0,
        shadowColor: transparent ? Colors.white.withOpacity(0) : Colors.black,
        color: transparent ? Colors.white.withOpacity(0) : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
    ),
  );
}
