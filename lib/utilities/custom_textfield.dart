import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_constant.dart';

// ignore: must_be_immutable
class CustomInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String icon;
  final int maxLength;
  final int fillColorStatus;
  final bool readOnly;
  final Function onPress;
  final Widget? suffixicon;
  // ignore: prefer_typing_uninitialized_variables
  var keyboardtype;

  CustomInputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.keyboardtype,
    required this.maxLength,
    required this.fillColorStatus,
    required this.readOnly,
    required this.onPress,
    this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 90 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        child: TextFormField(
          readOnly: readOnly,
          style: AppConstant.textFilledStyle,
          cursorColor: AppColor.themeColor,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardtype,
          controller: controller,
          maxLength: maxLength,
          onTap: () {
            onPress();
          },
          decoration: InputDecoration(
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      icon,
                      height: MediaQuery.of(context).size.width * 5 / 100,
                      width: MediaQuery.of(context).size.width * 5 / 100,
                    ),
                  ),
                ],
              ),
              suffixIcon: suffixicon,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.textColor),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.textColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.textColor),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              filled: false,
              counterText: '',
              hintText: hintText,
              hintStyle: AppConstant.textHintStyle),
        ),
      ),
    );
  }
}
