import 'package:flutter/material.dart';
import 'package:talentpitch/app/utils/palette.dart';

class UserInfoLabel extends StatelessWidget {
  const UserInfoLabel({
    super.key,
    required this.title,
    required this.label,
  });

  final String title;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Palette.mainColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
