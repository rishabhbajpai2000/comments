import 'package:comments/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class InputFieldSignInSignUp extends StatelessWidget {
  const InputFieldSignInSignUp(
      {super.key,
      required this.controller,
      required this.heading,
      this.emailKeyboard = false,
      this.obscureText = false});

  final TextEditingController controller;
  final String heading;
  final bool obscureText;
  final bool emailKeyboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This Field Can not be empty";
            }
            if (heading == "Password" && value.length < 6) {
              return "Password must be at least 6 characters long";
            }
            return null;
          },
          obscureText: obscureText,
          keyboardType: emailKeyboard == true
              ? TextInputType.emailAddress
              : TextInputType.text,
          decoration: InputDecoration(
            hintText: heading,
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
          ),
        ),
        verticalSpaceSmall
      ],
    );
  }
}
