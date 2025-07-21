import 'package:get/get.dart';
import 'package:grocerymart/Model/ProductsModel.dart';

class CartController extends GetxController {
  RxList<ProductsModel> productData = <ProductsModel>[].obs;

  void addProduct(ProductsModel newItem) {
    int index = productData.indexWhere(
        (product) => product.product_title == newItem.product_title);

    if (index >= 0) {
      productData[index].counter!.value++;
    } else {
      newItem.counter = 1.obs;
      productData.add(newItem);
      print("Added new product: ${newItem.product_title} with quantity 1");
    }
    productData.refresh();
  }

  void removeProduct(ProductsModel item) {
    productData.remove(item);
    productData.refresh();
  }

  void increaseQuantity(ProductsModel item) {
    item.counter!.value++;
    productData.refresh();
  }

  void decreaseQuantity(ProductsModel item) {
    if (item.counter!.value > 1) {
      item.counter!.value--;
    } else {
      removeProduct(item);
    }
    productData.refresh();
  }

  double get totalPrice {
    double total = 0.0;
    for (var product in productData) {
      total += (product.product_price * product.counter!.value);
    }
    return total;
  }
}
