import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../Controllers/CartController.dart';
import '../Ui_Pages/ProductDetailsPage.dart';

class IndivualProductWidget extends StatelessWidget {
  const IndivualProductWidget({super.key, required this.data, this.index});

  final data;
  final index;

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetailsPage(), arguments: data[index]);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        // height: 270,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  // Clip image to card's border radius
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    data[index].product_img,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  data[index].product_title,
                  style: GoogleFonts.lato(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                data[index].product_subtitle,
                style: GoogleFonts.lato(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${data[index].product_price}",
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProduct(data[index]);
                        Get.snackbar(
                          'Added to Cart',
                          '${data[index].product_title} has been added to your cart!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color.fromARGB(255, 88, 177, 117)
                              .withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      },
                      icon: const Icon(
                        Iconsax.add_square,
                        size: 45,
                        color: Color.fromARGB(255, 88, 177, 117),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
