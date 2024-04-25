import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/utils/utils.dart';

class NormalInput extends StatelessWidget {
  NormalInput({
    super.key,
    this.hintText,
    required this.titleText,
    required this.textEditingController,
    this.helperText = '',
    this.validator,
    this.color,
    this.hintColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLines,
  });

  final String? hintText;
  final String helperText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? hintColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String titleText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - 60,
                child: TextFormField(
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  inputFormatters: inputFormatters ?? [],
                  maxLines: maxLines ?? 1,
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
                  validator: validator ??
                      (String? _) {
                        if (textEditingController.text.isEmpty) {
                          return 'Por favor, rellena este campo';
                        } else {
                          return null;
                        }
                      },
                  keyboardType: keyboardType ?? TextInputType.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
