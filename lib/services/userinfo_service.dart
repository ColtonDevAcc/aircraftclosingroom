import 'dart:convert';

import 'package:aircraftclosingroom/models/ClosingList.dart';
import 'package:dio/dio.dart';
import 'package:recursive_regex/recursive_regex.dart';

class UserInfo {
  static var customerID;
  static String customerName = 'empty';
  static var companyName;
  static var email;
  static String photoIdRequired = 'Empty';
  static String photoIdOnFile = 'Empty';
  static bool accepteduser = false;
  static dynamic userSecretKey = 'cb4a2928-f601-4ed4-8c05-3f44b5aee2a1';
  static String playerID = '';

  userLogIn({userEmailAddress: String, userPassword: String}) async {
    try {
      var response = await Dio().post(
        'https://aicvirtualclosings.com/api/mobile/auth/',
        data: {'UserName': userEmailAddress, 'Password': userPassword},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      userSecretKey = response;

      var userInfo = await Dio().get("http://aicvirtualclosings.com/api/mobile/userinfo/$userSecretKey");
      String userRawInfo = userInfo.data[0].toString();
      customerID = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerID: ', endDelimiter: r', CustomerName');
      customerName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CustomerName: ', endDelimiter: r', CompanyName');
      companyName = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'CompanyName: ', endDelimiter: r', Email');
      email = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'Email: ', endDelimiter: r', PhotoIdRequired');
      photoIdRequired = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdRequired: ', endDelimiter: r', PhotoIdOnFile');
      photoIdOnFile = parseUserInfoString(jsonString: userRawInfo, startDelimiter: r'PhotoIdOnFile: ', endDelimiter: r'}');

      Map<String, dynamic> closingListMap = jsonDecode('http://aicvirtualclosings.com/api/mobile/closings/$userSecretKey}');
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

  set setIsPhotoIdRequired(String photoIdRequired) {
    photoIdOnFile = photoIdRequired;
  }

  set setIsPhotoIdOnFile(bool isPhotoIdRequired) {
    this.setIsPhotoIdOnFile = isPhotoIdRequired;
  }

  String get getIsPhotoIdOnFile {
    return photoIdOnFile;
  }

  String get getIsPhotoIdRequired {
    return photoIdOnFile;
  }

  String get getCustomerName {
    return customerName;
  }

  String get getCustomerId {
    return customerID;
  }

  String get getCustomerCompany {
    return companyName;
  }

  String get getCustomerEmail {
    return email;
  }

  String parseUserInfoString({jsonString: String, startDelimiter: String, endDelimiter: String}) {
    String result = RecursiveRegex(startDelimiter: RegExp(startDelimiter), endDelimiter: RegExp(endDelimiter), captureGroupName: "result").firstMatch(jsonString)!.namedGroup('result').toString();

    return result;
  }
}
