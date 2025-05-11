import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/app_color.dart';
import '../../utilities/app_constant.dart';
import '../../utilities/app_font.dart';
import '../../utilities/app_header.dart';
import '../../utilities/app_image.dart';
import '../../utilities/app_language.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "./NotificationScreen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> recentList = <dynamic>[
    {
      "id": 1,
      "userImage": './assets/icons/moose.png',
      "userName": "Allison",
      "details": "accepted your chat request.",
      "date": "15 Minute at 9:42 AM",
    },
    {
      "id": 2,
      "userImage": './assets/icons/nkhajotia.png',
      "userName": "New profiles",
      "details": "match your interests  take a look",
      "date": "2 Hours at 5:42 AM",
    },
    {
      "id": 3,
      "userImage": './assets/icons/userProfile3.jpg',
      "userName": "Gregory Peck",
      "details": "accepted your chat request.",
      "date": "30 Feb at 3:02 AM",
    },
    {
      "id": 4,
      "userImage": './assets/icons/sebastian.png',
      "userName": "Lydia Baptista",
      "details": "accepted your chat request.",
      "date": "28 Feb at 2:40 AM",
    },
    {
      "id": 5,
      "userImage": './assets/icons/chloekalaartist.png',
      "userName": "Kaiya",
      "details": "accepted your chat request.",
      "date": "28 Dec at 2:40 AM",
    },
    {
      "id": 6,
      "userImage": './assets/icons/moose.png',
      "userName": "Marley Lipshutz",
      "details": "match your interests  take a look",
      "date": "2 Hours at 5:42 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
                backgroundColor: AppColor.secondaryColor,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    systemNavigationBarColor: AppColor.secondaryColor,
                    systemNavigationBarIconBrightness: Brightness.dark,
                    statusBarColor: AppColor.secondaryColor,
                    statusBarIconBrightness: Brightness.dark))),
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 100 / 100,
                color: AppColor.secondaryColor,
                child: Column(children: [
                  AppHeader(
                      text: AppLanguage.notificationText[language],
                      onPress: () {
                        Navigator.pop(context);
                      }),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 2 / 100,
                  // ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: Text(
                      AppLanguage.clearAllText[language],
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.themeColor,
                          color: AppColor.themeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFont.fontFamily),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        // SizedBox(
                        //     height:
                        //         MediaQuery.of(context).size.height * 2 / 100),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Text(
                            AppLanguage.todayText[language],
                            style: const TextStyle(
                                color: AppColor.greyTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100),
                        Container(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Wrap(
                              runSpacing: 12,
                              spacing: 10,
                              children:
                                  List.generate(recentList.length, (index) {
                                return Column(children: [
                                  if (recentList[index]["id"] < 4)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  10 /
                                                  100,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  10 /
                                                  100,
                                              child: Image.asset(
                                                recentList[index]["userImage"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              69 /
                                              100,
                                          // color: Colors.amberAccent,
                                          child: Text.rich(
                                              // textAlign: TextAlign.center,
                                              TextSpan(children: <TextSpan>[
                                            TextSpan(
                                              text: recentList[index]
                                                      ["userName"] +
                                                  " ",
                                              style: const TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppFont.fontFamily),
                                            ),
                                            TextSpan(
                                              text: recentList[index]
                                                  ["details"],
                                              style: const TextStyle(
                                                  color: AppColor.greyColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppFont.fontFamily),
                                            ),
                                          ])),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3 /
                                              100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3 /
                                              100,
                                          child: Image.asset(
                                            AppImage.crossIcon,

                                            fit: BoxFit.cover,
                                            //color: AppColor.themeColor,
                                          ),
                                        )
                                      ],
                                    ),
                                ]);
                              })),
                        ),

                        //----------------yesterday---------------
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Text(
                            AppLanguage.yesterdayText[language],
                            style: const TextStyle(
                                color: AppColor.greyTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 100),
                        Container(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Wrap(
                              runSpacing: 12,
                              spacing: 10,
                              children:
                                  List.generate(recentList.length, (index) {
                                return Column(children: [
                                  if (recentList[index]["id"] > 3)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  10 /
                                                  100,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  10 /
                                                  100,
                                              child: Image.asset(
                                                recentList[index]["userImage"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              69 /
                                              100,
                                          // color: Colors.amberAccent,
                                          child: Text.rich(
                                              // textAlign: TextAlign.center,
                                              TextSpan(children: <TextSpan>[
                                            TextSpan(
                                              text: recentList[index]
                                                      ["userName"] +
                                                  " ",
                                              style: const TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppFont.fontFamily),
                                            ),
                                            TextSpan(
                                              text: recentList[index]
                                                  ["details"],
                                              style: const TextStyle(
                                                  color: AppColor.greyColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppFont.fontFamily),
                                            ),
                                          ])),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3 /
                                              100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3 /
                                              100,
                                          child: Image.asset(
                                            AppImage.crossIcon,

                                            fit: BoxFit.cover,
                                            //color: AppColor.themeColor,
                                          ),
                                        )
                                      ],
                                    ),
                                ]);
                              })),
                        ),

                        // -------------------------- 7 day ------------------
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 3.5 / 100),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Text(
                            AppLanguage.lastDayText[language],
                            style: const TextStyle(
                                color: AppColor.greyTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100),
                        Container(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Wrap(
                              runSpacing: 12,
                              spacing: 10,
                              children:
                                  List.generate(recentList.length, (index) {
                                return Column(children: [
                                  // if (recentList[index]["id"] < 4)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                10 /
                                                100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                10 /
                                                100,
                                            child: Image.asset(
                                              recentList[index]["userImage"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                69 /
                                                100,
                                        //   color: Colors.amberAccent,
                                        child: Text.rich(
                                            // textAlign: TextAlign.center,
                                            TextSpan(children: <TextSpan>[
                                          TextSpan(
                                            text: recentList[index]
                                                    ["userName"] +
                                                " ",
                                            style: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                fontFamily: AppFont.fontFamily),
                                          ),
                                          TextSpan(
                                            text: recentList[index]["details"],
                                            style: const TextStyle(
                                                color: AppColor.greyColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                fontFamily: AppFont.fontFamily),
                                          ),
                                        ])),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                3 /
                                                100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                3 /
                                                100,
                                        child: Image.asset(
                                          AppImage.crossIcon,

                                          fit: BoxFit.cover,
                                          //color: AppColor.themeColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ]);
                              })),
                        ),

                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 3 / 100),
                      ])))
                ]))));
  }
}
