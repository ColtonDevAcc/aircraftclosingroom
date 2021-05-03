import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/main.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:aircraftclosingroom/widgets/smallHorizontalCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        largeFeaturedCardWidget(screenWidth: screenWidth * .1, screenHeight: screenHeight / 12, title: 'Settings', useAsAppBar: false),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallHorizontalCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_circle_outlined),
              smallHorizontalCardWidget(title: 'Your Closings', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.cases_outlined),
              smallHorizontalCardWidget(title: 'Support', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.support_agent_outlined),
              smallHorizontalCardWidget(title: 'About us', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.info_outline_rounded),
              smallHorizontalCardWidget(title: 'Developer Mode', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.developer_mode_outlined),
              //dark mode widget.. set through set state TODO: set state in a provider package
              smallHorizontalCardWidget(
                  title: 'Dark Mode',
                  color: Global.secondaryButton,
                  trailingWidget: Switch(
                      value: (_switchValue),
                      activeColor: Global.secondaryTextColor,
                      inactiveTrackColor: Global.secondaryColor,
                      onChanged: (bool darkmode) {
                        setState(() {
                          print(_switchValue);
                          _switchValue = darkmode;
                          MyApp.mainTheme = ThemeData.dark();
                        });
                      }),
                  icon: Icons.dark_mode_outlined)
            ],
          ),
        )
      ],
    );
  }
}
