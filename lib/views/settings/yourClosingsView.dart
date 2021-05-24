import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourClosingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeProvider.primaryColor,
        title: Text('Your closings'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Closing Display Settings', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: ThemeProvider.primaryCardColor,
              child: Container(
                margin: EdgeInsets.all(10),
                width: _screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Closing card categorical settings:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Row(
                      children: <Widget>[
                        buttonOptions(title: "A - Z"),
                        buttonOptions(title: "Z - A"),
                        buttonOptions(title: "1 - 10"),
                        buttonOptions(title: "10 - 1"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Player card design:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Row(
                      children: <Widget>[
                        buttonOptions(title: "Large"),
                        buttonOptions(title: "Small"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Player card categorical settings:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                    Row(
                      children: <Widget>[buttonOptions(title: "You - Them"), buttonOptions(title: "Them - You"), buttonOptions(title: "by completion")],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Your current settings', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonOptions(title: "A - Z"),
                  buttonOptions(title: "Large"),
                  buttonOptions(title: "You - Them"),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Padding buttonOptions({title: String, active: bool}) {
  return Padding(
    padding: EdgeInsets.all(3),
    child: TextButton(
      child: Text(title, style: TextStyle(color: ThemeProvider.primaryColor)),
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: ThemeProvider.primaryColor),
          ),
        ),
      ),
    ),
  );
}
