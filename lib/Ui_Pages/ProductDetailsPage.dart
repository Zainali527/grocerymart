import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerymart/Controllers/CartController.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../Controllers/QunatityController.dart';
import '../Widget/CounterWidget.dart'; // Assuming you use Iconsax

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController Cartcontroller = Get.find<CartController>();
    ItemQuantityController ItemController = Get.put(ItemQuantityController());
    final product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.product_title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.product_img,
                height: 230, // Larger image for details
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.product_title,
              style:
                  GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.product_subtitle,
              style: GoogleFonts.lato(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterDisplayWidget(ItemController: ItemController),
                  Text(
                    "\$${product.product_price}",
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.green[700]),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[400]),
            Text(
              'Product Description',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              product.product_discription,
              style: GoogleFonts.lato(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.grey[400]),
            ListTile(
              leading: Text(
                "Nutritions",
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Iconsax.arrow_right_1_copy),
            ),
            Divider(color: Colors.grey[400]),
            ListTile(
              leading: Text(
                "Reviews",
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Iconsax.arrow_right_1_copy),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Cartcontroller.addProduct(product);
                  Get.snackbar(
                    'Added to Cart',
                    '${product.product_title} has been added to your cart!',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: const Color.fromARGB(255, 88, 177, 117)
                        .withOpacity(0.8),
                    colorText: Colors.white,
                  );
                },
                icon:
                    const Icon(Iconsax.shopping_cart_copy, color: Colors.white),
                label: Text(
                  'Add to Cart - \$${product.product_price}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 88, 177, 117),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
