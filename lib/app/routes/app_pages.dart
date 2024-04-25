import 'package:get/get.dart';

import 'package:talentpitch/app/modules/forgotPassword/bindings/forgot_password_binding.dart';
import 'package:talentpitch/app/modules/forgotPassword/views/forgot_password_view.dart';
import 'package:talentpitch/app/modules/home/bindings/home_binding.dart';
import 'package:talentpitch/app/modules/home/views/home_view.dart';
import 'package:talentpitch/app/modules/login/bindings/login_binding.dart';
import 'package:talentpitch/app/modules/login/views/login_view.dart';
import 'package:talentpitch/app/modules/no_internet/bindings/no_internet_binding.dart';
import 'package:talentpitch/app/modules/no_internet/views/no_internet_view.dart';
import 'package:talentpitch/app/modules/register/bindings/register_binding.dart';
import 'package:talentpitch/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NO_INTERNET,
      page: () => const NoInternetView(),
      binding: NoInternetBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
