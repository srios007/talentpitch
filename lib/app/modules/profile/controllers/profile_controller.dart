import 'package:get/get.dart';
import 'package:talentpitch/app/models/user.dart';
import 'package:talentpitch/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/firebase_services/auth_service.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class ProfileController extends GetxController {
  TabsController tabsController = Get.put(TabsController());
  final isLoading = false.obs;
  late User user;
  @override
  void onInit() {
    user = tabsController.user;
    super.onInit();
  }

  ///  Cerrar sesión y redirigir a la pantalla de inicio de sesión
  logout() async {
    if (await auth.signOut()) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      CustomSnackBars.showErrorSnackBar(
        'Hubo un error intenta de nuevo más tarde',
      );
    }
  }
}
