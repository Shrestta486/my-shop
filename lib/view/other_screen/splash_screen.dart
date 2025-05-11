import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/app_color.dart';
import '../../utilities/app_font.dart';
import '../authentication/login_screen.dart';


class Splash extends StatefulWidget {
  static String routeName = './Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
              backgroundColor: AppColor.themeColor,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  systemNavigationBarColor: AppColor.themeColor,
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarColor: AppColor.themeColor,
                  statusBarIconBrightness: Brightness.light))),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width * 100 / 100,
        height: MediaQuery.of(context).size.height * 100 / 100,
        color: AppColor.themeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
             "My Shop",
              style: const TextStyle(
                color: AppColor.secondaryColor,
                fontFamily: AppFont.fontFamily,
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
