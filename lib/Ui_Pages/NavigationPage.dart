import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocerymart/Controllers/NavigationControllers.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar : Obx( () => BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(200, 88, 177, 117),
            unselectedItemColor: Colors.black,
            currentIndex: controller.SelectedIndex.value,
            showUnselectedLabels: true,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.shop_copy), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Iconsax.search_normal_1_copy), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Iconsax.shopping_cart_copy), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Iconsax.lovely_copy), label: 'Favourite'),
              BottomNavigationBarItem(icon: Icon(Iconsax.profile_2user_copy), label: 'Account')
            ]
        )
        ),
        body: Obx(() => controller.screen[controller.SelectedIndex.value])
    );
  }
}
