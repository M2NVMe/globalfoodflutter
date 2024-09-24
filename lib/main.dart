import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/LoginScreen.dart';
import 'package:globalfoodflutter/Pages/SplashScreen.dart';
import 'package:globalfoodflutter/Pages/Utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => splashScreen()),
        GetPage(name: '/Dashboard', page: () => dashboard()),
        GetPage(name: '/Login', page: () => loginPage())
      ],
    );
  }
}
