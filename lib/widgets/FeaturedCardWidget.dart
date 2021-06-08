import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aircraftclosingroom/core/themeProvider.dart';

class LargeFeaturedCardWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String title;
  final Image? displayImage;
  final Widget? displayWidget;
  final bool xlScreenSize;

  LargeFeaturedCardWidget({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.title,
    this.displayImage,
    this.displayWidget,
    required this.xlScreenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth / 18, 0, screenWidth / 18, 5),
      child: Card(
        elevation: 8,
        shadowColor: ThemeProvider.secondaryTextColor,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(
                height: screenHeight / 1.8,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(''), //i set this as a blank text widget because i cant return nothing :/
                        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ThemeProvider.secondaryTextColor)),
                        Icon(Icons.search, color: ThemeProvider.secondaryTextColor),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (displayWidget != null)
                            Container(
                              child: displayWidget!,
                              height: xlScreenSize ? screenHeight / 2 : screenHeight / 2,
                            )
                          else
                            Text(''),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
