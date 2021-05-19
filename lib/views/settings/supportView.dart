import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeProvider.primaryColor,
        title: Text('Support'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Support', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: ThemeProvider.secondaryButton,
              child: Container(
                margin: EdgeInsets.all(10),
                width: _screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Physical address:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('6350 W RENO AVE OKLAHOMA CITY, OK 73127', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Toll free number:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('800.288.2519', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Local Number:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('405.948.1811', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Fax number:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('405.948.1869', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Email:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('support@aictitle.com', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Schedule:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Text('MONDAY - FRIDAY | 8:00AM - 5:30PM', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

