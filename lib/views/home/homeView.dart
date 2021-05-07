import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();

    double screenHeight = MediaQuery.of(context).size.height.toDouble();
    double screenWidth = MediaQuery.of(context).size.height.toDouble();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        largeFeaturedCardWidget(screenHeight: screenHeight / 1.3, screenWidth: screenWidth / 3.5, title: 'Your Closings'),
        //column that displays header text 'objectives/browse'
        Column(
          children: [
            SizedBox(height: 2),
            Text('Objectives', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: Global.secondaryTextColor)),
            SizedBox(height: 2),
            Text('Browse', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Global.secondaryTextColor)),
          ],
        ),
        Spacer(flex: 1),
        Container(
          //height of the cards. I dont know why the cards dont correlate with the defined height and width of the
          //variables provided in the custom widget
          height: 185,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            physics: AlwaysScrollableScrollPhysics(),
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
            ].toList(),
          ),
        ),
        Spacer(flex: 1)
      ],
    );
  }
}

Padding closingCardsWidget({color: Colors, transparent: bool}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      width: transparent ? 40 : 163,
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
            Spacer(flex: 1),
            Container(
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
            Text('Engine', style: TextStyle(color: transparent ? Colors.white.withOpacity(0) : Colors.white, fontWeight: FontWeight.w500)),
            Spacer(flex: 1)
          ],
        ),
      ),
    ),
  );
}
