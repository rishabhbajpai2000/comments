import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginSignUpButton extends StatelessWidget {
  const LoginSignUpButton(
      {super.key,
      required this.value,
      required this.onPressed,
      required this.isActive});

  final String value;
  final bool isActive;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: kcLightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        width: screenWidth(context) * 0.5,
        height: 50,
        child: isActive
            ? Center(
                child: Text(
                value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))
            : const Center(
                child: SizedBox(
                  height: 30,
                  child: LoadingIndicator(
                    colors: [Colors.white],
                    indicatorType: Indicator.lineScale,
                  ),
                ),
              ),
      ),
    );
  }
}
