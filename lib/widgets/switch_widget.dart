import 'package:asymmetri/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DropdownController>(); // Get the controller

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text widget with "Reverse" label
        Obx(
          () => Text(
            'Reverse',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: controller.selectedColor.value, // Update text color
            ),
          ),
        ),
        const SizedBox(width: 130),
        // Switch widget
        Obx(
          () => Switch(
            value: controller.isSwitched.value,
            onChanged: (value) {
              controller.isSwitched.value = value;
            },
            activeColor: controller.selectedColor.value, // Change switch color
          ),
        ),
      ],
    );
  }
}
