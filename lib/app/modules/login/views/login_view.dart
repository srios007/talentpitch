import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/login/controllers/login_controller.dart';
import 'package:talentpitch/app/utils/palette.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  titleSection(),
                  const Spacer(flex: 2),
                  inputsSection(),
                  const Spacer(flex: 2),
                  loginButton(),
                  const SizedBox(height: 10),
                  registerLabel(),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Título
  titleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Talentpitch',
        style: TextStyle(
          color: Palette.mainColor,
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Capos de texto (correo y contraseña)
  inputsSection() {
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
          PasswordInput(
            titleText: 'Contraseña',
            hintText: 'Escribe tu contraseña',
            textEditingController: controller.passController,
            showPassword: controller.showPass,
            showPasswordAction: controller.showPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: GestureDetector(
              onTap: controller.goToForgotPassword,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Olvidé mi contraseña',
                  style: TextStyle(
                    color: Palette.mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Label de regístrate
  registerLabel() {
    return GestureDetector(
      onTap: controller.goToRegister,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '¿No tienes una cuenta? ',
            style: TextStyle(
              color: Palette.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            'Regístrate',
            style: TextStyle(
              color: Palette.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Botón que inicia sesión
  loginButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.login,
        buttonText: 'Iniciar sesión',
      ),
    );
  }
}
