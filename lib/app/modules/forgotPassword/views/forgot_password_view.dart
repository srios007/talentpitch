import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:talentpitch/app/utils/utils.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recuperar contraseña',
          style: TextStyle(color: Palette.mainColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  _inputsSection(),
                  const Spacer(flex: 2),
                  _recoverButton(),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Campos de texto (correo y contraseña)
  _inputsSection() {
    return Form(
      key: controller.key,
      child: Column(
        children: [
          EmailInput(
            titleText: 'Correo',
            hintText: 'Escribe tu correo',
            textEditingController: controller.emailController,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  /// Botón que inicia sesión
  _recoverButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.recover,
        buttonText: 'Enviar correo de recuperación',
      ),
    );
  }
}
