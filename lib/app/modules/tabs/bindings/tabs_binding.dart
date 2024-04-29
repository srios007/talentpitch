import 'package:get/get.dart';
import 'package:talentpitch/app/modules/tabs/controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
  }
}
