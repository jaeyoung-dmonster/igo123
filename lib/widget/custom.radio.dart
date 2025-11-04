import 'package:flutter/material.dart';


class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double padding;
  final TextStyle? textStyle;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final double spacing;
  final double width;
  final double height;

  const CustomRadioButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.padding = 12,
    this.textStyle,
    this.activeTrackColor = const Color(0xFF34C759), // iOS default
    this.inactiveTrackColor = const Color(0xFFDFDFDF),
    this.activeThumbColor = Colors.white,
    this.inactiveThumbColor = Colors.white,
    this.spacing = 12,
    this.width = 51.0,
    this.height = 31.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double thumbSize = height - 4.0;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: padding),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isSelected ? activeTrackColor : inactiveTrackColor,
                  borderRadius: BorderRadius.circular(height / 2),
                ),
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: thumbSize,
                    height: thumbSize,
                    decoration: BoxDecoration(
                      color: isSelected ? activeThumbColor : inactiveThumbColor,
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
            ),
            SizedBox(width: spacing),
            Text(
              text,
              style: textStyle ?? TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}