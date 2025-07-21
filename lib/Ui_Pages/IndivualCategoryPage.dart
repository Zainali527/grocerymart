import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerymart/Widget/IndivualProductWidget.dart';
import '../DummyData/ProductsDummyData.dart';

class IndivualCategoryPage extends StatelessWidget {
  IndivualCategoryPage({
    super.key,
  });

  var getCat = Get.arguments;
  var data = productsdummydata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getCat.Cat_title,
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 0.5,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return IndivualProductWidget(
              data: data,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
