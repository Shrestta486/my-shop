import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_constant.dart';
import 'app_image.dart';

// ignore: must_be_immutable
class CustomPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  // final int maxLength;
  // final int fillColorStatus;
  final bool readOnly;
  // ignore: prefer_typing_uninitialized_variables
  // var keyboardtype;

  CustomPasswordTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    // required this.maxLength,
    // required this.fillColorStatus,
    required this.readOnly,
    //required TextInputType keyboardtype,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordTextFormFieldState createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 90 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        child: TextFormField(
          style: AppConstant.textFilledStyle,
          keyboardType: TextInputType.visiblePassword,
          maxLength: AppConstant.mobileMaxLength,
          controller: widget.controller,
          obscureText: passwordVisible,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.textColor),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.textColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.textColor),
            ),
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  child: Image.asset(
                    AppImage.passwordIcon,
                  ),
                ),
              ],
            ),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 5 / 100,
                    height: MediaQuery.of(context).size.width * 5 / 100,
                    child: Image.asset(passwordVisible
                        ? AppImage.closeEyeIcon
                        : AppImage.openEyeIcon),
                  ),
                ),
              ],
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            fillColor: AppColor.secondaryColor,
            filled: true,
            counterText: '',
            hintText: widget.hintText,
            hintStyle: AppConstant.textHintStyle,
          ),
        ),
      ),
    );
  }
}
