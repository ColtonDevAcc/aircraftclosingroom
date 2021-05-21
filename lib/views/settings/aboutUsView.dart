import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
        backgroundColor: ThemeProvider.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Our History', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
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
                    Text(
                      aicHistoryText,
                      style: TextStyle(color: ThemeProvider.secondaryTextColor),
                    ),
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

String aicHistoryText =
    """AIC started in August of 1989. With over 600 years of combined experience, our team is among the world’s most professional and knowledgeable in aviation title and escrow services. We strive for excellence in all that we do, handling both domestic and international transactions.

We acquire this excellence through careful attention to every piece of our services and also by employing a core group of seasoned professionals who are experts at what they do. We assure our clients that every piece of the transactions we execute is in proper form from start to finish, and that each step is handled with the utmost personal and professional care.

Using these simple principles, AIC Title Service has become one of the country’s most respected aviation title and escrow service providers. We are fully committed to delivering the highest level of service. """;
