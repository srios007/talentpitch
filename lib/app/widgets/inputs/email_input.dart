import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/utils/utils.dart';

class EmailInput extends StatelessWidget {
  EmailInput({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.textEditingController,
    this.helperText = '',
    this.border,
    this.textStyle,
    this.width,
  });

  final String titleText;
  final String hintText;
  final String helperText;
  final TextEditingController textEditingController;
  final InputBorder? border;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            color: Palette.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: width ?? Get.width - 60,
          child: TextFormField(
            style: textStyle,
            decoration: InputDecoration(
              helperText: helperText,
              hintText: hintText,
              errorStyle: styles.errorStyle,
              enabledBorder: styles.borderTextField,
              focusedBorder: styles.borderTextField,
              errorBorder: styles.borderTextField,
              focusedErrorBorder: styles.borderTextField,
            ),
            controller: textEditingController,
            validator: (String? _) {
              if (textEditingController.text.isEmpty) {
                return 'Por favor, rellena este campo';
              } else if (!GetUtils.isEmail(textEditingController.text)) {
                return 'Ingresa un email válido';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}
