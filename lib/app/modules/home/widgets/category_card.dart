import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/modules/home/controllers/home_controller.dart';
import 'package:talentpitch/app/modules/home/widgets/items_builder/items_builder.dart';
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
      height: 280,
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
          title(),
          categoryLabel(),
          SizedBox(
            width: Get.width,
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [categoryImage(), itemsBuilder()],
            ),
          ),
        ],
      ),
    );
  }

  itemsBuilder() {
    if (category.type == CategoryType.talentees) {
      return TalenteeItemsBuilder(category: category);
    } else if (category.type == CategoryType.challenges) {
      return ChallengeItemsBuilder(category: category);
    } else if (category.type == CategoryType.companies) {
      return CompanyItemsBuilder(category: category);
    }
    return TalenteeItemsBuilder(category: category);
  }

  /// Imagen principal de la categoría
  categoryImage() {
    return Visibility(
      visible: category.image != null && category.image!.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
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
    );
  }

  /// Título del card
  title() {
    return Text(
      category.title!,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Label del container de la categoría
  categoryLabel() {
    return Container(
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
    );
  }
}
