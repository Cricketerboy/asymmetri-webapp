import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'dropdown_widget.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DropdownController>();

    // Tooltip Controller
    final tooltipController = SuperTooltipController();

    // Observable to track tooltip visibility and position
    var tooltipPosition = 0.0.obs;

    return Obx(() {
      return Stack(
        alignment: Alignment.center,
        children: [
          // Wrap the Slider in a Container or SizedBox to constrain its size
          Container(
            width: 300, // Set a fixed width for the slider
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Calculate position and update tooltip as slider is dragged
                tooltipPosition.value = details.localPosition.dx;

                // Show tooltip during drag
                tooltipController.showTooltip();
              },
              onTapUp: (_) {
                // Hide the tooltip after tap
                tooltipController.hideTooltip();
              },
              child: Slider(
                value: controller.sliderValue.value,
                onChanged: (value) {
                  controller.sliderValue.value = value;

                  // Calculate the tooltip position based on the slider value
                  tooltipPosition.value =
                      value * 210; // Adjust based on slider width
                },
                activeColor: controller.selectedColor.value,
                inactiveColor: controller.selectedColor.value.withOpacity(0.3),
                min: 0.0,
                max: 1.0,
              ),
            ),
          ),
          // Conditionally show tooltip based on slider value
          Positioned(
            top: -10, // Position the tooltip just above the slider
            left: tooltipPosition.value - 100, // Position adjusted by 100
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 295, // Maximum width for the tooltip
                maxHeight: 50, // Maximum height for the tooltip
              ),
              child: SuperTooltip(
                controller: tooltipController,
                popupDirection: TooltipDirection.up,
                backgroundColor: controller.selectedColor.value,
                showBarrier: true,
                barrierColor: Colors.white.withOpacity(0.1),
                hasShadow: false, // Disable the shadow to prevent black screen
                content: Text(
                  controller.sliderValue.value < 0.3
                      ? "Slow"
                      : controller.sliderValue.value > 0.7
                          ? "Fast"
                          : "Smooth",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
