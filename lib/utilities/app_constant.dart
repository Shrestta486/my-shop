import 'dart:io';

import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font.dart';

int language = 0;

class AppConstant {
  static const int fullnameLength = 50;
  static const int emailMaxLength = 100;
  static const int mobileMaxLength = 15;
  static const int passwordMaxLength = 16;
  static const int searchMaxLength = 100;
  static const int describeMaxLength = 500;
  static bool isLoggedOut = false;
  static int selectFooterIndex = 0;

  static String deviceType = Platform.operatingSystem;

  static const TextStyle textFilledStyle = TextStyle(
      color: AppColor.primaryColor,
      fontFamily: AppFont.fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 15);

  static const TextStyle textHintStyle = TextStyle(
    color: AppColor.textHintColor,
    fontFamily: AppFont.fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
}

class ContentClass {
  final String header;
  final String contenttype;

  ContentClass({required this.header, required this.contenttype});
}
