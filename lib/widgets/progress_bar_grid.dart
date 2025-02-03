import 'package:asymmetri/widgets/custom_progress_indicator.dart';
import 'package:asymmetri/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBarGrid extends StatelessWidget {
  const ProgressBarGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DropdownController>();

    return Obx(() {
      int totalItems = controller.totalItems.value;
      int itemsInLine = controller.itemsInLine.value;

      return Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(totalItems, (index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / itemsInLine -
                20, // Dynamic width
            height: 20, // Set fixed height
            child: ProgressIndicatorWidget(),
          );
        }),
      );
    });
  }
}
