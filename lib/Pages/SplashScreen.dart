import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/LoginScreen.dart';

class SplashScreenController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    opacity.value = 1.0;

    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => const LoginPage()); // Navigate to LoginPage
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() => AnimatedOpacity(
          opacity: controller.opacity.value,
          duration: const Duration(seconds: 2),
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("lib/drawable/Logo.png"),
          ),
        )),
      ),
    );
  }
}
