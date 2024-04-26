import 'package:get/get.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/firebase_services/auth_service.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class ProfileController extends GetxController {
  void logout() async {
    if (await auth.signOut()) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
        CustomSnackBars.showErrorSnackBar(
          'Hubo un error intenta de nuevo más tarde',
        );
    }
  }
}
