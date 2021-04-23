import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/material.dart';

class ButtonWidgetStyle1 extends StatelessWidget {
  final String buttonTitle;
  final bool hasBorder;
  final void Function() onTapFunction;

  ButtonWidgetStyle1({
    required this.buttonTitle,
    required this.hasBorder,
    required this.onTapFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Global.primaryColor : Colors.white,
          //apply border raidus to decoration
          borderRadius: BorderRadius.circular(10),
          //is has border true ? if so add it color and width if not set BorderSide to none
          border: hasBorder
              ? Border.all(
                  color: Global.primaryColor,
                  width: 1,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTapFunction,
          child: Container(
            height: 60,
            child: Center(
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: hasBorder ? Colors.white : Global.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
