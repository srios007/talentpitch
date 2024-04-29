import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/model_services/category_service.dart';

class HomeController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    isLoading.value = true;
    categoryService.getCategories().then((value) => categories.value = value);
    isLoading.value = false;
  }

  validateGoToVideoPlayer({
    required String urlVideo,
    required String title,
    String? subtitle,
    String? label,
    String? imageUrl,
  }) {
    if (urlVideo == '') {
      print({
        'title': title,
        'subtitle': subtitle,
        'label': label,
        'imageUrl': imageUrl,
      });
      Get.toNamed(Routes.NO_VIDEO, arguments: {
        'title': title,
        'subtitle': subtitle,
        'label': label,
        'imageUrl': imageUrl,
      });
    } else {
      Get.toNamed(Routes.VIDEO_PLAYER, arguments: {
        'title': title,
        'urlVideo': urlVideo,
      });
    }
  }
}
