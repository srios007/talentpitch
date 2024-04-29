import 'package:get/get.dart';
import 'package:talentpitch/app/modules/favorites/controllers/favorites_controller.dart';

class VideoPlayerController extends GetxController {
  final title = ''.obs;
  final urlVideo = ''.obs;
  final favoritesController = Get.find<FavoritesController>();

  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments['title'];
    urlVideo.value = Get.arguments['urlVideo'];
  }
}
