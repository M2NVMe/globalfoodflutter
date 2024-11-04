import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/Control.dart';
import 'package:globalfoodflutter/Pages/Controllers/responsifcontroller.dart';
import 'package:globalfoodflutter/Pages/Menus/home.dart';
import 'package:globalfoodflutter/Pages/Menus/foods.dart';
import 'package:globalfoodflutter/Pages/Menus/orders.dart';
import 'package:globalfoodflutter/Pages/Menus/profile.dart';
import 'package:globalfoodflutter/Pages/tabletmenu/hometablet.dart';

class TabletDashboard extends StatelessWidget {
  final ResponsifController responsifController = Get.put(ResponsifController());
  TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (responsifController.screenwidth.value != screenWidth) {
      responsifController.updateScreenWidth(screenWidth);
    }
    final UtamaController controller = Get.put(UtamaController());
    final List<Widget> fragments = [
      Hometablet(),
      foodsFragment(),
      ordersFragment(),
      profileFragment(),
    ];

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
      return Scaffold(
        body: Row(
          children: [
            // NavigationRail placed on the side
            NavigationRail(
              indicatorColor: Colors.black12,
              selectedIndex: controller.selectedindex.value,
              onDestinationSelected: (int index) {
                controller.changeMenu(index);
              },
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: IconThemeData(color: Colors.blueAccent, size: 30),
              unselectedIconTheme: IconThemeData(color: Colors.black54, size: 24),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home_rounded),
                  selectedIcon: Icon(Icons.home_rounded, color: Colors.blueAccent),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.fastfood),
                  selectedIcon: Icon(Icons.fastfood, color: Colors.redAccent),
                  label: Text('Menu'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  selectedIcon: Icon(Icons.list, color: Colors.orange),
                  label: Text('Orders'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  selectedIcon: Icon(Icons.person, color: Colors.greenAccent),
                  label: Text('Profile'),
                ),
              ],
              backgroundColor: Colors.grey[100],
            ),
            Expanded(
              child: fragments[controller.selectedindex.value], // Display the selected fragment
            ),
          ],
        ),
      );
    });
  }
}
