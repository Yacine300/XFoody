import 'package:flutter/material.dart';

class SizeConfiguration {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double defaultSize;
  static Orientation orientation = Orientation.landscape;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.24
        : screenWidth * 0.24;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfiguration.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfiguration.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
