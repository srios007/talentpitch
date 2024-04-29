import 'package:get/get.dart';

class NoVideoController extends GetxController {
  final title = ''.obs;
  final subtitle = ''.obs;
  final label = ''.obs;
  final imageUrl = ''.obs;
  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments['title'];
    subtitle.value = Get.arguments['subtitle'];
    label.value = Get.arguments['label'];
    imageUrl.value = Get.arguments['imageUrl'];
  }
}
