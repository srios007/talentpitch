import 'package:get/get.dart';
import 'package:video_player/video_player.dart' as videoPlayer;

class VideoPlayerController extends GetxController {
  late videoPlayer.VideoPlayerController videoController;
  final title = ''.obs;
  final urlVideo = ''.obs;
  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments['title'];
    urlVideo.value = Get.arguments['urlVideo'];
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}
