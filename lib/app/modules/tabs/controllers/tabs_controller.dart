import 'package:get/get.dart';
import 'package:talentpitch/app/models/user.dart';
import 'package:talentpitch/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:talentpitch/app/modules/home/controllers/home_controller.dart';
import 'package:talentpitch/app/modules/profile/controllers/profile_controller.dart';
import 'package:talentpitch/app/services/model_services/user_service.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 1.obs;
  late User user;
  @override
  void onInit() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => ProfileController());
    getCurrentUser();

    super.onInit();
  }

  getCurrentUser() async {
    userService.getCurrentUser().then((value) => user = value!);
  }
}
