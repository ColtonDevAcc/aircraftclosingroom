import 'dart:convert';

import 'package:aircraftclosingroom/models/ClosingList.dart';
import 'package:dio/dio.dart';
import 'package:recursive_regex/recursive_regex.dart';

class UserInfo {
  static var customerID;
  static String customerName = 'empty';
  static var companyName;
  static var email;
  static var photoIdRequired;
  static var photoIdOnFile;
  static var accepteduser;

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
      customerID = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerID: ', endDelimiter: r', CustomerName');
      customerName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerName: ', endDelimiter: r', CompanyName');
      companyName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CompanyName: ', endDelimiter: r', Email');
      email = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'Email: ', endDelimiter: r', PhotoIdRequired');
      photoIdRequired = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdRequired: ', endDelimiter: r', PhotoIdOnFile');
      photoIdOnFile = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdOnFile: ', endDelimiter: r'}');

      Map<String, dynamic> closingListMap = jsonDecode('http://aicvirtualclosings.com/api/mobile/closings/${this.userSecretKey}');
      var closingList = ClosingList.fromJson(closingListMap);
      print(closingList.toString());
    } catch (e) {} finally {
      print('user API loaded');
      accepteduser = true;
    }
  }

  set setUserEmailAddress(String emailAddress) {
    email = emailAddress;
  }

  set setIsPhotoIdRequired(bool photoIdRequired) {
    photoIdOnFile = photoIdRequired;
  }

  set setIsPhotoIdOnFile(bool isPhotoIdRequired) {
    this.setIsPhotoIdOnFile = isPhotoIdRequired;
  }

  bool get getIsPhotoIdOnFile {
    return photoIdOnFile;
  }

  bool get getIsPhotoIdRequired {
    return photoIdOnFile;
  }

  String get getCustomerName {
    return customerName;
  }

  String parseUserInfoString({jsonString: String, startDelimiter: String, endDelimiter: String}) {
    String result = RecursiveRegex(startDelimiter: RegExp(startDelimiter), endDelimiter: RegExp(endDelimiter), captureGroupName: "result").firstMatch(jsonString)!.namedGroup('result').toString();

    return result;
  }
}
