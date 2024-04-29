import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/model_services/category_service.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

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

  validateGoToVideoPlayer({required String urlVideo, required String title}) {
    if (urlVideo == '') {
      CustomSnackBars.showErrorSnackBar(
          'No hay video disponible en este momento');
    } else {
      Get.toNamed(Routes.VIDEO_PLAYER, arguments: {
        'title': title,
        'urlVideo': urlVideo,
      });
    }
  }
}
