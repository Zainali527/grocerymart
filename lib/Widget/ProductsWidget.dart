import 'package:flutter/material.dart';
import 'package:grocerymart/Widget/IndivualProductWidget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.Get_Products_data});

  final Get_Products_data;

  @override
  Widget build(BuildContext context) {
    var data = Get_Products_data;
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return IndivualProductWidget(
              data: data,
              index: index,
            );
          }),
    );
  }
}
