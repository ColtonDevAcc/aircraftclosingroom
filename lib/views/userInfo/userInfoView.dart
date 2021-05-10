import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    UserInfo _user = UserInfo();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            largeFeaturedCardWidget(screenWidth: _screenWidth * .1, screenHeight: _screenHeight / 12, title: 'User Information'),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Text('Your Information', style: TextStyle(color: Global.secondaryTextColor)),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Global.secondaryButton,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: _screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('User ID:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getCustomerId}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                          Text('Full Name:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getCustomerName}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                          Text('Company:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getCustomerCompany}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                          Text('Email:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getCustomerEmail}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                          Text('Photo ID on File?:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getIsPhotoIdOnFile}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                          Text('Photo ID Required:', style: TextStyle(color: Global.secondaryTextColor)),
                          Text('${_user.getIsPhotoIdRequired}', style: TextStyle(color: Global.bodyTextColor)),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Your Prefrences', style: TextStyle(color: Global.secondaryTextColor)),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Global.secondaryButton,
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: _screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Notifications:', style: TextStyle(color: Global.secondaryTextColor)),
                      Text('off', style: TextStyle(color: Global.bodyTextColor)),
                      SizedBox(height: 10),
                      Text('Electronic Notifications (sms, emails, and other):', style: TextStyle(color: Global.secondaryTextColor)),
                      Text('off', style: TextStyle(color: Global.bodyTextColor)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
