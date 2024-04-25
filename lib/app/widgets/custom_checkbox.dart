import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    super.key,
    required this.onTap,
    required this.value,
    required this.color,
    this.width,
    this.height,
  });
  final RxBool value;
  final void Function() onTap;
  final Color color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(Radius.circular(200)),
        child: SizedBox(
          width: width ?? 18,
          height: height ?? 18,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: color,
              ),
              borderRadius: BorderRadius.circular(200),
            ),
            child: Obx(
              () {
                return Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: value.value ? color : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 5,
                  height: 5,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
