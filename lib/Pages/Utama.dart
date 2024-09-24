import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/Control.dart';
import 'package:globalfoodflutter/Pages/Menus/foods.dart';
import 'package:globalfoodflutter/Pages/Menus/home.dart';
import 'package:globalfoodflutter/Pages/Menus/orders.dart';
import 'package:globalfoodflutter/Pages/Menus/profile.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final UtamaController controller = Get.put(UtamaController());
    final List<Widget> Fragments = [
      homeFragment(),
      foodsFragment(),
      ordersFragment(),
      profileFragment()
    ];
    return Obx(() {
      return Scaffold(
        body: Fragments[controller.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedindex.value,
          onTap: controller.changeMenu,
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 32),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, color: Colors.blueAccent,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood, color: Colors.redAccent, size: 27,),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.orange,),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.greenAccent,),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
