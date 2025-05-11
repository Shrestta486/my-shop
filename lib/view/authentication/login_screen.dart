import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/app_button.dart';
import '../../utilities/app_color.dart';
import '../../utilities/app_constant.dart';
import '../../utilities/app_font.dart';

import '../../utilities/app_image.dart';
import '../../utilities/app_language.dart';
import '../../utilities/app_snack_bar_toast_message.dart';
import '../../utilities/custom_password.dart';
import '../../utilities/custom_textfield.dart';
import 'otp_verify_screen.dart';

class Login extends StatefulWidget {
  static String routeName = "./Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColor.secondaryColor,
          resizeToAvoidBottomInset: false,
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
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3 / 100,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        child: Text(
                          "My Shop",
                          style: const TextStyle(
                            color: AppColor.themeColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 5 / 100,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        child: Text(
                          AppLanguage.logInDescriptionText[language],
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3 / 100,
                      ),
                      //---------------------- email number--------------------------

                      CustomInputTextField(
                        controller: emailTextEditingController,
                        hintText: AppLanguage.emailText[language],
                        icon: AppImage.mailIcon,
                        keyboardtype: TextInputType.emailAddress,
                        maxLength: AppConstant.emailMaxLength,
                        fillColorStatus: 0,
                        readOnly: false,
                        onPress: () {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 100,
                      ),
                      CustomPasswordTextFormField(
                        controller: passwordTextEditingController,
                        hintText: AppLanguage.passwordText[language],
                        readOnly: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 100,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const ForgotPassword()));
                          },
                          child: Text(
                            "${AppLanguage.forgotPasswordText[language]}?",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColor.themeColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 8 / 100,
                      ),
                      AppButton(
                        text: AppLanguage.signInText[language],
                        onPress: () {
                        
                          loginUserValidation(emailTextEditingController.text,
                              passwordTextEditingController.text);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 6 / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLanguage.dontHaveAccountText[language]} ",
                            style: const TextStyle(
                              color: AppColor.textColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Signup()));
                            },
                            child: Text(
                              AppLanguage.signUpText[language],
                              style: const TextStyle(
                                color: AppColor.themeColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }

 void loginUserValidation(String email, String password) {
  if (email.isEmpty) {
    SnackBarToastMessage.showSnackBar(context, AppLanguage.emailMsgText[language]);
  } else if (!email.contains('@') || email.length < 6) {
    SnackBarToastMessage.showSnackBar(context, AppLanguage.validEmailMsgText[language]);
  } else if (password.isEmpty) {
    SnackBarToastMessage.showSnackBar(context, "Please enter a password");
  } else if (password.length < 6) {
    SnackBarToastMessage.showSnackBar(context, "Enter a valid password");
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OTP()),
    );
  }
}


}
