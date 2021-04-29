import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:aircraftclosingroom/widgets/smallHorizontalCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        largeFeaturedCardWidget(screenWidth: screenWidth * .1, screenHeight: screenHeight / 6, title: 'Settings'),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_box_outlined),
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_box_outlined),
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_box_outlined),
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_box_outlined),
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_box_outlined),
              smallHorizontalCardWidget(title: 'Dark Mode', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_back_ios), icon: Icons.account_balance)
            ],
          ),
        )
      ],
    );
  }
}
