import 'package:asymmetri/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/my_functions.dart';

class DropdownController extends GetxController {
  var totalItems = 1.obs;
  var itemsInLine = 1.obs;
  var selectedColor = Colors.green.obs; // Store the selected color
  var selectedValue = MyData.dropdownItems[0].obs;
  var sliderValue = 0.5.obs;
  var isSwitched = false.obs;
  var currentAnimatingIndex = 0.obs; // New variable to track active animation
  var currentProgressIndex = 0.obs; // Track active animation index
}

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 295,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedValue.value,
            items: MyData.dropdownItems
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.selectedValue.value = value;
                MyFunctions.printSelectedValue(value);

                // Change color based on selected value
                switch (value) {
                  case 'Red':
                    controller.selectedColor.value = Colors.red;
                    break;
                  case 'Green':
                    controller.selectedColor.value = Colors.green;
                    break;
                  case 'Blue':
                    controller.selectedColor.value = Colors.blue;
                    break;
                  case 'Purple':
                  default:
                    controller.selectedColor.value = Colors.purple;
                }
              }
            },
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ),
    );
  }
}
