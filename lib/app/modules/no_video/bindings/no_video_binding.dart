import 'package:get/get.dart';
import 'package:talentpitch/app/modules/no_video/controllers/no_video_controller.dart';

class NoVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoVideoController>(
      () => NoVideoController(),
    );
  }
}
