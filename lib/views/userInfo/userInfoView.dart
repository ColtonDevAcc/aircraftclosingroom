import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            largeFeaturedCardWidget(screenWidth: _screenWidth * .1, screenHeight: _screenHeight / 12, title: 'User Information'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Row(
            children: [
              Row(
                children: [
                  Text('Your account information', style: TextStyle(color: Global.secondaryTextColor)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
