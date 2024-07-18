import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class LoginSignUpButton extends StatelessWidget {
  const LoginSignUpButton(
      {super.key, required this.value, required this.onPressed});

  final String value;
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
        child: Center(
            child: Text(
          value,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
