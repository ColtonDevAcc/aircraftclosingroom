import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:aircraftclosingroom/views/settings/supportView.dart';
import 'package:aircraftclosingroom/views/settings/yourAccountView.dart';
import 'package:aircraftclosingroom/views/settings/yourClosingsView.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:aircraftclosingroom/widgets/smallHorizontalCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'aboutUsView.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        largeFeaturedCardWidget(screenWidth: screenWidth * .1, screenHeight: screenHeight / 12, title: 'Settings', useAsAppBar: false, displayImage: false),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SmallHorizontalFeaturedCardWidget(
                title: 'Your Closings',
                color: ThemeProvider.secondaryButton,
                trailingWidget: Icon(Icons.arrow_forward_ios),
                icon: Icons.cases_outlined,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => YourClosingsView())),
              ),
              SmallHorizontalFeaturedCardWidget(
                title: 'Support',
                color: ThemeProvider.secondaryButton,
                trailingWidget: Icon(Icons.arrow_forward_ios),
                icon: Icons.support_agent_outlined,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SupportView())),
              ),
              SmallHorizontalFeaturedCardWidget(
                title: 'About us',
                color: ThemeProvider.secondaryButton,
                trailingWidget: Icon(Icons.arrow_forward_ios),
                icon: Icons.info_outline_rounded,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsView())),
              ),
              SmallHorizontalFeaturedCardWidget(
                title: 'Developer Mode',
                color: ThemeProvider.secondaryButton,
                trailingWidget: Icon(Icons.arrow_forward_ios),
                icon: Icons.developer_mode_outlined,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Account type error 102'),
                        content: Text('It seems that your account is not registered as a "Developer Account"'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('okay'),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              SmallHorizontalFeaturedCardWidget(
                title: 'Dark Mode',
                color: ThemeProvider.secondaryButton,
                trailingWidget: Switch(
                    value: (themeProvider.getDarkMode),
                    activeColor: ThemeProvider.primaryColor,
                    inactiveTrackColor: ThemeProvider.secondaryTextColor,
                    onChanged: (value) {
                      themeProvider.setDarkMode(value);
                      print(ThemeProvider().getDarkMode);
                    }),
                icon: Icons.dark_mode_outlined,
                onTap: null,
              )
            ],
          ),
        )
      ],
    );
  }
}
