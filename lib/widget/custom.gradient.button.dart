import 'package:flutter/material.dart';

class CustomGradientButtonFrame extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const CustomGradientButtonFrame({
    super.key,
    this.onPressed,
    this.buttonText = '버튼',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 414,
        height: 104,
        margin: const EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0), // 안드로이드 XML은 각진 사각형
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xFF212328).withOpacity(0.4), // #212328, 40% 투명도
              const Color(0xFFFFC831), // #FFC831
            ],
            stops: const [0, 1],
          ),
        ),
        clipBehavior: Clip.hardEdge, // clipToOutline 역할
        child: Stack(
          children: [
            // 버튼을 중앙에 배치
            Center(
              child: ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.black,
                //   foregroundColor: Colors.white,
                //   elevation: 4,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                // ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}