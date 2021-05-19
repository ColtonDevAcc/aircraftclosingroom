import 'package:flutter/material.dart';

import 'package:aircraftclosingroom/core/themeProvider.dart';

class ButtonWidgetStyle1 extends StatelessWidget {
  final String buttonTitle;
  final bool hasBorder;
  final Function() onTapFunction;
  final bool? userLoggingIn;

  ButtonWidgetStyle1({
    Key? key,
    required this.buttonTitle,
    required this.hasBorder,
    required this.onTapFunction,
    this.userLoggingIn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (userLoggingIn!) {
      return Material(
        child: Ink(
          decoration: BoxDecoration(
            color: hasBorder ? ThemeProvider.primaryColor : Colors.white,
            //apply border raidus to decoration
            borderRadius: BorderRadius.circular(0),
            //is has border true ? if so add it color and width if not set BorderSide to none
            border: hasBorder ? Border.all(color: ThemeProvider.primaryColor, width: 2) : Border.fromBorderSide(BorderSide.none),
          ),
          child: Container(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ThemeProvider.primaryColor),
                backgroundColor: ThemeProvider.secondaryAccent,
              ),
            ),
          ),
        ),
      );
    } else {
      return Material(
        child: Ink(
          decoration: BoxDecoration(
            color: hasBorder ? ThemeProvider.primaryColor : Colors.white,
            //apply border raidus to decoration
            borderRadius: BorderRadius.circular(0),
            //is has border true ? if so add it color and width if not set BorderSide to none
            border: hasBorder ? Border.all(color: ThemeProvider.primaryColor, width: 2) : Border.fromBorderSide(BorderSide.none),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(0),
            onTap: onTapFunction,
            child: Container(
              height: 60,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      buttonTitle,
                      style: TextStyle(color: hasBorder ? Colors.white : ThemeProvider.primaryColor, fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Spacer(flex: 1),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
