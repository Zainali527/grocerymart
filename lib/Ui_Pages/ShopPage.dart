import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerymart/Widget/ProductsWidget.dart';
import 'package:grocerymart/Widget/SearchBarWidget.dart';

import '../DummyData/ProductsDummyData.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var product_Data = productsdummydata;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "📌 Multan, Pakistan",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 130,
              width: 360,
              child: Image.asset(
                "AssetImage/fruit_banner_image.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              leading: Text(
                "Exclusive Offer",
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              trailing: Text(
                "See all",
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 88, 177, 117),
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 315,
              child: ProductWidget(Get_Products_data: product_Data),
            ),
            ListTile(
              leading: Text(
                "Best Selling",
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              trailing: Text(
                "See all",
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 88, 177, 117),
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 315,
              child: ProductWidget(Get_Products_data: product_Data),
            ),
          ],
        ),
      ),
    );
  }
}
