import 'package:flutter/material.dart';
import '../utilities/app_color.dart';
import 'app_font.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const AppButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 85 / 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColor.themeGradient,
          boxShadow: [
            BoxShadow(
                spreadRadius: BorderSide.strokeAlignInside,
                color: AppColor.primaryColor.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.secondaryColor,
            fontFamily: AppFont.fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
