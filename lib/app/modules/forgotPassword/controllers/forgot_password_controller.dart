import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/services/firebase_services/auth_service.dart';
import 'package:talentpitch/app/widgets/custom_snackbars.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final key = GlobalKey<FormState>();
  final isLoading = false.obs;

  /// Envía correo de recuperación de contraseña
  recover() async {
    if (key.currentState!.validate()) {
      isLoading.value = true;

      try {
        final response =
            await auth.sendPasswordReset(emailController.text.trim());
        if (response.isEmpty) {
          isLoading.value = false;
          Get.back();
          CustomSnackBars.showSuccessSnackBar(
            'Correo de recuperación enviado con éxito',
          );
        } else {
          CustomSnackBars.showErrorSnackBar(response);
          isLoading.value = false;
        }
      } catch (e) {
        e.toString();
      }
    }
  }
}