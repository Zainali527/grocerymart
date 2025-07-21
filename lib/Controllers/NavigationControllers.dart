import 'package:get/get.dart';
import 'package:grocerymart/Ui_Pages/AccountPage.dart';
import 'package:grocerymart/Ui_Pages/CartPage.dart';
import 'package:grocerymart/Ui_Pages/ExplorePage.dart';
import 'package:grocerymart/Ui_Pages/FavouritePage.dart';
import 'package:grocerymart/Ui_Pages/ShopPage.dart';

class NavigationController extends GetxController {
  Rx<int> SelectedIndex = 0.obs;

  void changeIndex(int index) {
    SelectedIndex.value = index;
  }

  final screen = [
    const ShopPage(),
    const ExplorePage(),
    CartPage(),
    const FavouritePage(),
    const AccountPage(),
  ];
}
