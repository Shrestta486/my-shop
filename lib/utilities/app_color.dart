import 'package:flutter/material.dart';

class AppColor {
  static const Color themeColor = Color(0xff2453A3);
  static const Color lightBlueColor = Color(0xff65A6E2);
  static const Color secondaryColor = Colors.white;
  static const Color primaryColor = Colors.black;
  static const Color transparentColor = Colors.transparent;
  static const LinearGradient themeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      AppColor.lightBlueColor,
      AppColor.themeColor,
    ],
  );

  static const Color textColor = Color(0xff8E8A8A);
  static const Color textHintColor = Color(0xff7A7A7A);
  static const Color redColor = Color(0xffEA3131);
  static const Color footerColor = Color(0xff696969);
  static const Color lightGreenColor = Color(0xff485641);
  static const Color skyBlueColor = Color(0xff6995CF);
  static const Color backgroundColor = Color(0xffE3EFFB);
  static const LinearGradient borderGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff506DEF),
      Color(0xff2E3E89),
    ],
  );

  static const Color borderGreyColor = Color(0xffD9D9D9);
  static const Color shadowColor = Color(0xff61A1DE);
  static const LinearGradient homeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xffAED6FC),
      Color(0xff2453A3),
    ],
  );
  static const Color greytextColor = Color(0xffFCF9F9);
  static const Color lightSkyColor = Color(0xffA1C1E8);
  static const Color searchFeildColor = Color(0xff7DA8DC);
  static const Color greyColor = Color(0xff6E6C6C);
  static const Color greyTextColor = Color(0xff6E6C6C);
  static const Color greenColor = Color(0xff2FD767);
  static const Color chatTextColor = Color(0xff85AEE1);
  static const Color darkRedColor = Color(0xffE22141);
  static const Color borderGreayColor = Color(0xffBCBBBB);
  static const Color lightGreayColor = Color(0xff636363);
  static const Color textGreyColor = Color(0xffD6D6D6);
  static const Color statusColor = Color(0xffAED6FC);
  static const Color chatStatusColor = Color(0xff8BC7FF);
}
