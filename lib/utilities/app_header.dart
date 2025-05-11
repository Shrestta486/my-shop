import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_color.dart';
import 'app_font.dart';
import 'app_image.dart';

class AppHeader extends StatelessWidget {
  final String text;
  final Function onPress;

  const AppHeader({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 100,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 100 / 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  onPress();
                },
                child: Container(
                  // height: MediaQuery.of(context).size.width * 12 / 100,
                  width: MediaQuery.of(context).size.width * 12 / 100,
                  color: AppColor.transparentColor,
                  padding: const EdgeInsets.only(left: 18),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImage.backIcon,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width * 6 / 100,
                    width: MediaQuery.of(context).size.width * 6 / 100,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 70 / 100,
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.fontFamily)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 12 / 100,
                width: MediaQuery.of(context).size.width * 12 / 100,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 100,
        ),
      ],
    );
  }
}
