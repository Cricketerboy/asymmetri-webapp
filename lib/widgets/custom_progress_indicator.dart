import 'package:asymmetri/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final controller = Get.find<DropdownController>();

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _getDuration()),
    );

    // Listen for slider value changes and update the duration
    controller.sliderValue.listen((value) {
      _updateDuration();
    });

    // Start with the correct animation based on switch state
    _updateAnimation(controller.isSwitched.value);

    // Listen for switch state changes
    controller.isSwitched.listen((isReversed) {
      _updateAnimation(isReversed);
    });
  }

  void _updateDuration() {
    // Update the duration dynamically based on the slider value
    _controller.duration = Duration(seconds: _getDuration());
  }

  int _getDuration() {
    // Convert slider value (0.0 - 1.0) into seconds (slow = 4s, fast = 1s)
    return (4 - (controller.sliderValue.value * 3)).toInt();
  }

  void _updateAnimation(bool isReversed) {
    _controller.stop();
    _controller.reset();

    // When switch is enabled, start empty from rightmost and expand to left
    // When switch is disabled, start empty from leftmost and expand to right
    double start = isReversed ? 0.0 : 0.0;
    double end = isReversed ? 1.0 : 1.0;

    _animation = Tween<double>(begin: start, end: end).animate(_controller);

    _controller.forward().whenComplete(() => _restartAnimation(isReversed));
  }

  void _restartAnimation(bool isReversed) {
    _controller.reset();

    // Ensure animation resets correctly for infinite looping
    double start = isReversed ? 0.0 : 0.0;
    double end = isReversed ? 1.0 : 1.0;

    _animation = Tween<double>(begin: start, end: end).animate(_controller);

    _controller.forward().whenComplete(() => _restartAnimation(isReversed));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: controller.isSwitched.value
                ? Alignment.centerRight // Switch enabled: start from right
                : Alignment.centerLeft, // Switch disabled: start from left
            widthFactor: _animation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    controller.selectedColor.value.withOpacity(0.5),
                    controller.selectedColor.value,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
