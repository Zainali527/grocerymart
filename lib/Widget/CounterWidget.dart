import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Controllers/QunatityController.dart';

class CounterDisplayWidget extends StatelessWidget {
  const CounterDisplayWidget({
    super.key,
    required this.ItemController,
  });

  final ItemQuantityController ItemController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              ItemController.decrement();
            },
            child: const Text(
              "-",
              style: TextStyle(fontSize: 30),
            )),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey)),
          child: Center(
            child: Obx(() => Text(
                  ItemController.count.value.toString(),
                  style: const TextStyle(fontSize: 22),
                )),
          ),
        ),
        InkWell(
            onTap: () {
              ItemController.increment();
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 30),
            )),
      ],
    );
  }
}
