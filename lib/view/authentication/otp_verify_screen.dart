import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../utilities/app_button.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_font.dart';
import '../../utilities/app_constant.dart';
import '../../utilities/app_header.dart';
import '../../utilities/app_language.dart';
import '../../utilities/app_snack_bar_toast_message.dart';
import '../other_screen/dashboard_screen.dart';
import '../other_screen/home_screen.dart';

class OTP extends StatefulWidget {
  static String routeName = "./OTP";
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late Timer _timer;
  late int _secondsRemaining;
  bool resendText = true;

  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    _secondsRemaining = 120;
    startTimer();
    super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          resendText = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;

    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width * 11 / 100,
      height: MediaQuery.of(context).size.width * 11 / 100,
      margin: const EdgeInsets.only(right: 10),
      textStyle: const TextStyle(
        fontSize: 23,
        fontFamily: AppFont.fontFamily,
        fontWeight: FontWeight.w600,
        color: AppColor.themeColor,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.textColor),
        ),
      ),
    );

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        _timer.cancel();
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.secondaryColor,
              child: Column(
                children: [
                  AppHeader(
                    text: "",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: Text(
                      "My Shope",
                      style: const TextStyle(
                        color: AppColor.themeColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 5 / 100),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            child: Text(
                              AppLanguage.otpVerificationText[language],
                              style: const TextStyle(
                                color: AppColor.themeColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.4 /
                                  100),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            child: Text(
                              AppLanguage
                                  .otpVerificationDescriptionText[language],
                              style: const TextStyle(
                                color: AppColor.textColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 4 / 100),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 80 / 100,
                            child: Column(
                              children: [
                                Pinput(
                                  controller: pinController,
                                  defaultPinTheme: defaultPinTheme,
                                  autofocus: true,
                                  length: 4,
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  onCompleted: (pin) {},
                                  onChanged: (value) {},
                                  cursor: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 13),
                                        width: 15,
                                        height: 2,
                                        color: AppColor.textColor,
                                      ),
                                    ],
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: const Border(
                                        bottom: BorderSide(
                                            color: AppColor.themeColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 8 / 100),
                          AppButton(
                            text: AppLanguage.verifyText[language],
                            onPress: () {
                              if (pinController.text.isEmpty) {
                                SnackBarToastMessage.showSnackBar(
                                    context, "Please enter the OTP");
                              } else if (pinController.text.length != 4) {
                                SnackBarToastMessage.showSnackBar(context,
                                    "Please enter a valid 4-digit OTP");
                              } else {
                                // Navigate after successful OTP validation
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashboardScreen(),
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 7 / 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppLanguage.didnotReceiveOTPText[language]} ",
                                style: const TextStyle(
                                  color: AppColor.textColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              resendText == false
                                  ? GestureDetector(
                                      onTap: () {
                                        // TODO: Implement resend OTP
                                      },
                                      child: Text(
                                        AppLanguage.resendText[language],
                                        style: const TextStyle(
                                          color: AppColor.redColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      '$minutes:${seconds.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                        color: AppColor.redColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 4 / 100),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _timer.cancel();
                            },
                            child: Text(
                              AppLanguage.changeMobileNumberText[language],
                              style: const TextStyle(
                                fontFamily: AppFont.fontFamily,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.themeColor,
                                color: AppColor.themeColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
