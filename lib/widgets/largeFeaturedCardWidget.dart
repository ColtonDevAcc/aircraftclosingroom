import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding largeFeaturedCardWidget({screenWidth: Double, screenHeight: Double}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Card(
      elevation: 8,
      shadowColor: Colors.grey.shade200,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90.0),
      ),
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 80), child: Text('Your Closings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey.shade500))),
            Image.asset('assets/images/AIC.png'),
          ],
        ),
      ),
    ),
  );
}
