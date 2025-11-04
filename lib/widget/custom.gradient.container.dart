import 'package:flutter/material.dart';

class HyperAppNotificationBanner extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HyperAppNotificationBanner({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 414,
        height: 104,
        margin: EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFC831),
              Color(0xFF212328),
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}