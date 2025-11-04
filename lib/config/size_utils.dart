import 'package:flutter/material.dart'; // These are the Viewport values of your Figma Design.


// These are used in the code as a reference to create your UI Responsively.

const num FIGMA_DESIGN_HEIGHT = 844;
const num FIGMA_DESIGN_STATUS_BAR = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  
  double get h => ((this * _width) / SizeUtils.width);
    double get fSize => (this * SizeUtils.width) / SizeUtils.width;

}
// / MediaQuery.of(context).textScaleFactor,
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

// ignore_for_file: must_be_immutable
class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

   static double width = 0; // 디바이스의 실제 너비
  static double height = 0; // 디바이스의 실제 높이

  static void initialize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width; // 디바이스 너비
    height = size.height; // 디바이스 높이
  }

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait) {
      width =
          boxConstraints.maxWidth.isNonZero(defaultValue: SizeUtils.width);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width =
          boxConstraints.maxHeight.isNonZero(defaultValue: SizeUtils.width);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}
