import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/responsifcontroller.dart';
import 'package:globalfoodflutter/Pages/LoginScreen.dart';
import 'package:globalfoodflutter/Pages/SplashScreen.dart';
import 'package:globalfoodflutter/Pages/Utama.dart';
import 'package:globalfoodflutter/Pages/UtamaTOP.dart';
import 'package:globalfoodflutter/Pages/tabletUtama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ResponsifController responsifController = Get.put(ResponsifController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/Dashboard', page: () => dashboard()),
        GetPage(name: '/TabletDashboard', page: () => TabletDashboard()),
        GetPage(name: '/Responsif', page: () => ResponsifLayout()),
        GetPage(name: '/Login', page: () => LoginPage())
      ],
    );
  }
}
