import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/services/appStateNotifier.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:aircraftclosingroom/widgets/smallHorizontalCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final _darkModeEnabled = watch(AppStateNotifier.appStateNotifier);

    return Column(
      children: [
        largeFeaturedCardWidget(screenWidth: screenWidth * .1, screenHeight: screenHeight / 12, title: 'Settings', useAsAppBar: false),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallHorizontalFeaturedCardWidget(title: 'Your Account', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.account_circle_outlined),
              smallHorizontalFeaturedCardWidget(title: 'Your Closings', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.cases_outlined),
              smallHorizontalFeaturedCardWidget(title: 'Support', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.support_agent_outlined),
              smallHorizontalFeaturedCardWidget(title: 'About us', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.info_outline_rounded),
              smallHorizontalFeaturedCardWidget(title: 'Developer Mode', color: Global.secondaryButton, trailingWidget: Icon(Icons.arrow_forward_ios), icon: Icons.developer_mode_outlined),
              //dark mode widget.. set through set state TODO: set state in a provider package
              smallHorizontalFeaturedCardWidget(
                  title: 'Dark Mode',
                  color: Global.secondaryButton,
                  trailingWidget: Switch(
                    value: (_darkModeEnabled.isDarkMode),
                    activeColor: Global.primaryColor,
                    inactiveTrackColor: Global.secondaryTextColor,
                    onChanged: (bool value) => AppStateNotifier.appStateNotifier,
                  ),
                  icon: Icons.dark_mode_outlined)
            ],
          ),
        )
      ],
    );
  }
}
