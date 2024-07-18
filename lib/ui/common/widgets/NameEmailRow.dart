
import 'package:comments/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class NameEmailRow extends StatelessWidget {
  const NameEmailRow({super.key, required this.heading, required this.value});

  final String heading;
  final String value;
  String trimString(String value) {
    if (value.length > 18) {
      return '${value.substring(0, 18)}...';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${heading}: ", style: const TextStyle(color: kcDarkGreyColor)),
        Text(
          trimString(value),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
