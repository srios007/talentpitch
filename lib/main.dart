import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/utils/palette.dart';
import 'package:talentpitch/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [Locale('es', '')],
      useInheritedMediaQuery: true,
      title: 'Application',
      initialRoute: _setInitialRoute(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.darkGreen,
          iconTheme: IconThemeData(color: Palette.white),
          titleTextStyle: TextStyle(
            color: Palette.white,
            fontSize: 18,
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}

String _setInitialRoute() {
  {
    return Routes.HOME;
  }
}
