import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerymart/Controllers/CartController.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => cartController.productData.isEmpty
                  ? const Center(
                      child: Text(
                        "Your cart is empty!",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartController.productData.length,
                      itemBuilder: (context, int index) {
                        final product = cartController.productData[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    product.product_img,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.product_title,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\$${product.product_price}",
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                cartController
                                                    .decreaseQuantity(product);
                                              },
                                              child: const Text(
                                                "-",
                                                style: TextStyle(fontSize: 35),
                                              )),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 16.0),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey)),
                                            child: Center(
                                              child: Obx(() => Text(
                                                    '${product.counter!}',
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  )),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                cartController
                                                    .increaseQuantity(product);
                                              },
                                              child: const Text(
                                                "+",
                                                style: TextStyle(fontSize: 30),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.trash,
                                      color: Colors.red),
                                  onPressed: () {
                                    cartController.removeProduct(product);
                                    Get.snackbar(
                                      'Removed from Cart',
                                      '${product.product_title} has been removed from your cart!',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.8),
                                      colorText: Colors.white,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.lato(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${cartController.totalPrice.toStringAsFixed(2)}",
                          style: GoogleFonts.lato(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (cartController.productData.isEmpty) {
                        Get.snackbar(
                          'Cart Empty',
                          'Please add items to your cart before checking out.',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.yellow.withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      } else {
                        // Implement your checkout logic here
                        Get.snackbar(
                          'Checkout',
                          'Proceeding to checkout with total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor:
                              const Color.fromARGB(255, 88, 177, 117)
                                  .withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      }
                    },
                    icon: const Icon(Iconsax.shopping_cart_copy,
                        color: Colors.white),
                    label: Text(
                      "Go To Checkout",
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 88, 177, 117),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
