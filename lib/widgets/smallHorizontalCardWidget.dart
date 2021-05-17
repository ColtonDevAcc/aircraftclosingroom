import 'package:flutter/material.dart';

import 'package:aircraftclosingroom/core/themeProvider.dart';

class SmallHorizontalFeaturedCardWidget extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final Widget trailingWidget;
  final Function()? onTap;

  SmallHorizontalFeaturedCardWidget({
    required this.color,
    required this.title,
    required this.icon,
    required this.trailingWidget,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: color,
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: Icon(
              this.icon,
              size: 35,
              color: ThemeProvider.primaryColor,
            ),
          ),
          contentPadding: EdgeInsets.all(5),
          title: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: ThemeProvider.secondaryTextColor),
          ),
          trailing: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: trailingWidget,
          ),
        ),
      ),
    );
  }
}
