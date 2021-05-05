import 'dart:convert';

import 'package:dio/dio.dart';

class UserInfo {
  String customerID = 'User Id without .ToInt()';
  String firstName = 'User First Name';
  String lastName = 'User Last Name';
  String company = 'User Company';
  String email = 'User Email';
  bool photoIdRequired = false;
  bool photoIdOnFile = false;

  dynamic userSecretKey = 'super secret key';

  userLogIn({userEmailAddress: String, userPassword: String}) async {
    try {
      var response = await Dio().post(
        'https://aicvirtualclosings.com/api/mobile/auth/',
        data: {'UserName': 'cbristow@aictitle.com', 'Password': 'C0lt0n.Brist0w99(('},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      this.userSecretKey = response;
    } catch (e) {
      print(e);
    } finally {
      var userInfo = await Dio().get("http://aicvirtualclosings.com/api/mobile/userinfo/${this.userSecretKey}");
      this.customerID = (userInfo.data[0].toString());

      print(this.customerID);
    }
  }
}

// Map data = {'UserName': userEmailAddress, 'Password': userPassword};
//     String body = json.encode(data);
