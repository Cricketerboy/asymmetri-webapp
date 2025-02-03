import 'package:asymmetri/widgets/custom_progress_indicator.dart';
import 'package:asymmetri/widgets/progress_bar_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/my_data.dart';
import 'functions/my_functions.dart';
import 'widgets/image_widget.dart';
import 'widgets/dropdown_widget.dart';
import 'widgets/slider_widget.dart';
import 'widgets/input_fields.dart';
import 'widgets/switch_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Clone',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F3FC),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageWidget(),
                SizedBox(height: 20),
                DropdownWidget(),
                SizedBox(height: 10),
                SliderWidget(),
                SizedBox(height: 10),
                InputFields(),
                SwitchWidget(),
                SizedBox(height: 30),
                ProgressBarGrid(), // Add the progress bar grid here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
