import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/firebase_services/auth_service.dart';
import 'package:talentpitch/app/widgets/custom_snackbars.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final key = GlobalKey<FormState>();
  final isLoading = false.obs;
  final showPass = false.obs;

  /// Muestra u oculta la contraseña
  showPassword() {
    showPass.value = !showPass.value;
  }

  /// Va a la pestaña de registro
  goToRegister() => Get.toNamed(Routes.REGISTER);

  /// Va a recuperar contraseña
  goToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);

  /// Inicia sesión
  login() async {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      try {
        final response = await auth.signIn(
          email: emailController.text.trim(),
          password: passController.text,
        );
        await _validateLoginResponse(response);
      } catch (e) {
        CustomSnackBars.showErrorSnackBar(
          'Hubo un error intenta de nuevo más tarde',
        );
      }
    }
  }

  /// Valida la respuesta del login
  _validateLoginResponse(response) async {
    if (response is! String) {
      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } else {
      CustomSnackBars.showErrorSnackBar(response);
      isLoading.value = false;
    }
  }
}
