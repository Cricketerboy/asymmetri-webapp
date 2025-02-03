import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dropdown_widget.dart';

class InputFields extends StatelessWidget {
  const InputFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DropdownController>(); // Get the controller

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // First Input Field
          Obx(() => Container(
                width: 295,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: controller.selectedColor.value,
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  cursorColor: controller.selectedColor.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.totalItems.value = int.tryParse(value) ?? 1;
                  },
                  decoration: InputDecoration(
                    labelText: 'Total Items',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.selectedColor.value,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 13,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 10),
          // Second Input Field
          Obx(() => Container(
                width: 295,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: controller.selectedColor.value,
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  cursorColor: controller.selectedColor.value,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.itemsInLine.value = int.tryParse(value) ?? 1;
                  },
                  decoration: InputDecoration(
                    labelText: 'Items in Line',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.selectedColor.value,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 13,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
