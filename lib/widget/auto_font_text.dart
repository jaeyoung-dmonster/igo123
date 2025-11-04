import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igo123/theme/my.text.dart';

class AutoFontText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const AutoFontText(
    this.text, {
    Key? key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : super(key: key);

  String _getFontFamily(String text) {
    // 한국어 문자 감지 (한글 유니코드 범위: AC00-D7AF)
    bool hasKorean = text.contains(RegExp(r'[\uAC00-\uD7AF]'));
    // 영어 문자 감지
    bool hasEnglish = text.contains(RegExp(r'[a-zA-Z]'));
    
    if (hasKorean) {
      return 'SUIT'; // 한국어용 폰트
    } else if (hasEnglish) {
      return 'Satoshi'; // 영어용 폰트
    } else {
      return 'SUIT'; // 기본 폰트
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _getFontFamily(text),
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        height: height,
        decoration: decoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

// 혼합 텍스트를 위한 RichText 위젯
class AutoFontRichText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AutoFontRichText(
    this.text, {
    Key? key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  List<TextSpan> _buildTextSpans(String text) {
    List<TextSpan> spans = [];
    
    // 한국어와 영어를 분리하여 각각 다른 폰트 적용
    RegExp pattern = RegExp(r'([\uAC00-\uD7AF]+|[a-zA-Z\s]+|[^a-zA-Z\uAC00-\uD7AF\s]+)');
    Iterable<Match> matches = pattern.allMatches(text);
    
    for (Match match in matches) {
      String segment = match.group(0) ?? '';
      String fontFamily;
      
      if (segment.contains(RegExp(r'[\uAC00-\uD7AF]'))) {
        fontFamily = 'SUIT'; // 한국어
      } else if (segment.contains(RegExp(r'[a-zA-Z]'))) {
        fontFamily = 'Satoshi'; // 영어
      } else {
        fontFamily = 'SUIT'; // 기타
      }
      
      spans.add(TextSpan(
        text: segment,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color ?? Colors.white,
          height: height,
        ),
      ));
    }
    
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _buildTextSpans(text),
      ),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
    );
  }
} 