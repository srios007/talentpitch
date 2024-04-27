import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/modules/home/controllers/home_controller.dart';
import 'package:talentpitch/app/utils/utils.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.controller,
    required this.category,
  });

  final HomeController controller;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white.withOpacity(0.9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 20,
            width: 100,
            decoration: BoxDecoration(
              color: Palette.mainColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                category.translateCategory(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Palette.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: category.image != null && category.image!.isNotEmpty,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: category.image!,
                fit: BoxFit.fill,
                width: Get.width * 0.3,
                height: 200,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return LoadingWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
