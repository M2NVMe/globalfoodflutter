import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/LoginScreen.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
        backgroundColor: Colors.white,
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("lib/drawable/Logo.png"),
        ),
      nextScreen: const LoginPage(),
    );
  }
}
