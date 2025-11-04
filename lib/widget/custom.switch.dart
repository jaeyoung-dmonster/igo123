import 'package:flutter/material.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final double width;
  final double height;

  const CustomCupertinoSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeTrackColor = const Color(0xFF34C759), // iOS default
    this.inactiveTrackColor = const Color(0xFFDFDFDF),
    this.activeThumbColor = Colors.white,
    this.inactiveThumbColor = Colors.white,
    this.width = 51.0,
    this.height = 31.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double thumbSize = height - 4.0;
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: value ? activeTrackColor : inactiveTrackColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              color: value ? activeThumbColor : inactiveThumbColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
