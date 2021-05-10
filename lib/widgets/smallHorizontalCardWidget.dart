import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/material.dart';

Card smallHorizontalFeaturedCardWidget({color: Color, title: String, icon: Icons, trailingWidget: Widget}) {
  return Card(
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
          icon,
          size: 35,
          color: Global.primaryColor,
        ),
      ),
      contentPadding: EdgeInsets.all(5),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Global.secondaryTextColor),
      ),
      trailing: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: trailingWidget,
      ),
    ),
  );
}
