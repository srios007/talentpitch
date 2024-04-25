import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/utils/palette.dart';
import 'package:talentpitch/app/widgets/custom_checkbox.dart';

class CheckAccept extends StatelessWidget {
  CheckAccept({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.onTap,
    required this.color,
    required this.label2,
    required this.onTap2,
  });
  final String label;
  final String label2;
  final void Function() onChanged;
  final void Function()? onTap;
  final void Function()? onTap2;
  final RxBool value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCheckBox(
            onTap: onChanged,
            value: value,
            color: color,
          ),
          Container(
            width: Get.width - 90,
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: RichText(
              text: TextSpan(
                text: 'Acepto ',
                style: TextStyle(
                  fontSize: 12,
                  color: Palette.mainColor.withOpacity(0.6),
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Palette.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onTap,
                  ),
                  TextSpan(
                    text: ' y ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Palette.mainColor.withOpacity(0.6),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: label2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Palette.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onTap2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
