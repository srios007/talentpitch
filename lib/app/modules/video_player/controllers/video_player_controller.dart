import 'package:get/get.dart';

class VideoPlayerController extends GetxController {
  final title = ''.obs;
  final urlVideo = ''.obs;

  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments['title'];
    urlVideo.value = Get.arguments['urlVideo'];
  }

  
 
}
