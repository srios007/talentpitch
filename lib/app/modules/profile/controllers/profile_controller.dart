import 'package:get/get.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/firebase_services/auth_service.dart';

class ProfileController extends GetxController {
  void logout() {
    auth.signOut().then((value) => Get.offAllNamed(Routes.LOGIN));
    
  }
}
