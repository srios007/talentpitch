import 'package:get/get.dart';
import 'package:talentpitch/app/modules/video_player/controllers/video_player_controller.dart';

class VideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPlayerController>(
      () => VideoPlayerController(),
    );
  }
}
