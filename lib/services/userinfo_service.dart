import 'dart:convert';

import 'package:aircraftclosingroom/models/ClosingList.dart';
import 'package:dio/dio.dart';
import 'package:recursive_regex/recursive_regex.dart';

class UserInfo {
  var customerID;
  var customerName;
  var companyName;
  var email;
  var photoIdRequired;
  var photoIdOnFile;
  var accepteduser;

  dynamic userSecretKey = 'super secret key';

  userLogIn({userEmailAddress: String, userPassword: String}) async {
    try {
      var response = await Dio().post(
        'https://aicvirtualclosings.com/api/mobile/auth/',
        data: {'UserName': userEmailAddress, 'Password': userPassword},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      this.userSecretKey = response;

      var userInfo = await Dio().get("http://aicvirtualclosings.com/api/mobile/userinfo/${this.userSecretKey}");
      String userRawInfo = userInfo.data[0].toString();
      this.customerID = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerID: ', endDelimiter: r', CustomerName');
      this.customerName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerName: ', endDelimiter: r', CompanyName');
      this.companyName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CompanyName: ', endDelimiter: r', Email');
      this.email = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'Email: ', endDelimiter: r', PhotoIdRequired');
      this.photoIdRequired = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdRequired: ', endDelimiter: r', PhotoIdOnFile');
      this.photoIdOnFile = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdOnFile: ', endDelimiter: r'}');

      Map<String, dynamic> closingListMap = jsonDecode('http://aicvirtualclosings.com/api/mobile/closings/${this.userSecretKey}');
      var closingList = ClosingList.fromJson(closingListMap);
      print(closingList.toString());
    } catch (e) {} finally {
      print('user API loaded');
      this.accepteduser = true;
    }
  }

  String parseUserInfoString({jsonString: String, startDelimiter: String, endDelimiter: String}) {
    String result = RecursiveRegex(startDelimiter: RegExp(startDelimiter), endDelimiter: RegExp(endDelimiter), captureGroupName: "result").firstMatch(jsonString)!.namedGroup('result').toString();

    return result;
  }
}
