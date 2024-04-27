import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/home/controllers/home_controller.dart';
import 'package:talentpitch/app/modules/home/widgets/category_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return controller.getCategories();
          },
          child: Obx(
            () => ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  controller: controller,
                  category: controller.categories[index],
                );
              },
            ),
          )),
    );
  }
}

