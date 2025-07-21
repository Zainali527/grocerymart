import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProductsModel {
  ProductsModel({
    required this.product_img,
    required this.product_title,
    required this.product_subtitle,
    required this.product_price,
    this.product_discription,
    RxInt? counter,
  }) : counter = counter ?? 0.obs;

  final String product_img;
  final String product_title;
  final String product_subtitle;
  final double product_price;
  final String? product_discription;
  RxInt? counter;
}
