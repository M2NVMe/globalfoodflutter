import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/responsifcontroller.dart';

class ResponsifLayout extends StatelessWidget {
  final ResponsifController responsifController = Get.put(ResponsifController());

  ResponsifLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (responsifController.screenwidth.value != screenWidth) {
      responsifController.updateScreenWidth(screenWidth);
    }

    return Obx(() {
      if (!Get.currentRoute.contains("/Dashboard") && responsifController.isMobile()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed("/Dashboard");
        });
      } else if (!Get.currentRoute.contains("/TabletDashboard") && responsifController.isTablet()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed("/TabletDashboard");
        });
      }

      return Container();
    });
  }
}
