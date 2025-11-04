import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';
import 'package:igo123/theme/size.util.dart';
import 'package:igo123/widget/custom.image.view.dart';

class MyButton {
  final Widget? child;
  final String? childText;
  final void Function()? onPressed;
  final String type;
  final bool? fullWidth;
  final bool? isPossible;
  final bool? isSmallSize;
  final bool? hasIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final TextStyle? textStyle;
final EdgeInsetsGeometry? paddings;
  const MyButton({
    this.child,
    this.childText = "",
    required this.onPressed,
    required this.type,
    this.fullWidth,
    this.isPossible = true,
    this.isSmallSize,
    this.hasIcon = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.textStyle,
    this.paddings,
  });

  Color _getBackgroundColor(bool isFilled) {
    if (backgroundColor != null) return backgroundColor!;
    if (isPossible == false) return GRAY100;
    if (isFilled) {
      return type == "primary"
          ? NEMOVIEWMAINCOLOR
          : type == "secondary"
              ? GRAY200
              : ERROR300;
    }
    return WHITE;
  }

  Color _getTextColor(bool isFilled) {
    if (textColor != null) return textColor!;
    if (isPossible == false) return GRAY400;
    if (isFilled) return BLACK;
    return type == "primary"
        ? BLACK
        : type == "secondary"
            ? GRAY500
            : ERROR300;
  }

  BorderRadius _getBorderRadius() {
    if (borderRadius != null) return BorderRadius.circular(borderRadius!);
    return isSmallSize == true
        ? BorderRadius.circular(12)
        : BorderRadius.circular(16);
  }

  Widget get Filled => SizedBox(
        width: fullWidth == true ? double.infinity : null,
        child: ElevatedButton(
          child: Padding(
              padding: paddings ??
    (isSmallSize == true
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
        : const EdgeInsets.all(12)),
              child: hasIcon == true
                  ? child
                  : isSmallSize == true
                      ? Text(childText!,
                          style: textStyle?? MyText(color: _getTextColor(true)).BODY_14_M)
                      : Text(childText!,
                          style:textStyle?? MyText(color: _getTextColor(true)).BODY_16_M)),
          onPressed: isPossible == true ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(true),
            minimumSize:isSmallSize == true ? Size.fromHeight(42) : Size.fromHeight(45),
            maximumSize:
                isSmallSize == true ? Size.fromHeight(42) : Size.fromHeight(72),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            elevation: 0,
          ),
        ),
      );

  Widget get Outlined => SizedBox(
        width: fullWidth == true ? double.infinity : null,
        child: OutlinedButton(
          child: Padding(
              padding: isSmallSize == true
                  ? EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  : EdgeInsets.all(16),
              child: hasIcon == true
                  ? child
                  : isSmallSize == true
                      ? Text(childText!,
                          style: MyText(color: _getTextColor(false)).BODY_14_M)
                      : Text(childText!,
                          style: MyText(color: _getTextColor(false)).BODY_16_M)),
          onPressed: isPossible == true ? onPressed : null,
          style: OutlinedButton.styleFrom(
            backgroundColor: _getBackgroundColor(false),
            minimumSize: Size.zero,
            maximumSize:
                isSmallSize == true ? Size.fromHeight(42) : Size.fromHeight(56),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            side: BorderSide(
                color: isPossible == false
                    ? GRAY300
                    : type == "primary"
                        ? NEMOVIEWMAINCOLOR
                        : type == "secondary"
                            ? GRAY500
                            : ERROR300,
                width: 2),
          ),
        ),
      );

  Widget get Txt => SizedBox(
        width: fullWidth == true ? double.infinity : null,
        child: TextButton(
          child: Padding(
              padding: isSmallSize == true
                  ? EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  : EdgeInsets.all(16),
              child: hasIcon == true
                  ? child
                  : isSmallSize == true
                      ? Text(childText!,
                          style: MyText(color: _getTextColor(false)).LEGEND_12_B)
                      : Text(childText!,
                          style: MyText(color: _getTextColor(false)).BODY_14_B)),
          onPressed: isPossible == true ? onPressed : null,
          style: TextButton.styleFrom(
            backgroundColor: _getBackgroundColor(false),
            minimumSize: Size.zero,
            maximumSize:
                isSmallSize == true ? Size.fromHeight(42) : Size.fromHeight(56),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
          ),
        ),
      );
}
class MyCustomButton {
  final Widget? child;
  final String? childText;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final double? borderRadius;
  final String? imagePath;
  final TextStyle? textStyle;
  final Color? borderColor; // 추가된 borderColor
  final bool isPossible; // isPossible 추가
final EdgeInsetsGeometry? padding;
  const MyCustomButton({
    this.child,
    this.childText = "",
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    required this.width,
    required this.height,
    this.borderRadius,
    this.textStyle,
    this.imagePath,
    this.padding,
    this.borderColor, // borderColor 추가
    this.isPossible = true, // 기본값 true
  });

Color _getBackgroundColor() {
  if (backgroundColor != null) return backgroundColor!;
  return isPossible ? DARKMODE100 : DARKMODE900;
}

Color _getTextColor() {
  if (textColor != null) return textColor!;
  return isPossible ? BLACK : DARKMODE600;
}

Color _getBorderColor() {
  if (borderColor != null) return borderColor!;
  return isPossible ? DARKMODE600 : DARKMODE900;
}

  BorderRadius _getBorderRadius() {
    if(borderRadius != null) return BorderRadius.circular(borderRadius!);
    return BorderRadius.circular(16); // 기본 라운드 처리
  }



  Widget get Filled => Container(
    
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: isPossible ? onPressed : null, // 비활성화일 경우 클릭 불가
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(),
                    surfaceTintColor: _getBackgroundColor(), // Material 3 tint 제거
        foregroundColor: _getBackgroundColor(),
        shadowColor: _getBackgroundColor(),
        overlayColor: _getBackgroundColor(),
        disabledBackgroundColor: _getBackgroundColor(),
        disabledForegroundColor: _getBackgroundColor(),
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
              side: BorderSide(color: _getBorderColor(), width: 2), // 테두리 색상
            ),
            elevation: 0,
            padding:padding?? EdgeInsets.zero,
          ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent)),
          child: child ??
              Text(
                childText ?? "",
                style: textStyle ??
                MyText().PRETENDARD_16_700_TEXT.copyWith(
                      color: _getTextColor(),
                      
                    ),
              ),
        ),
      );

  Widget get WithIcon => Container(
    
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: isPossible ? onPressed : null, // 비활성화일 경우 클릭 불가
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(),
                    surfaceTintColor: _getBackgroundColor(), // Material 3 tint 제거
        shadowColor: _getBackgroundColor(), // 그림자 제거
overlayColor: _getBackgroundColor(),
foregroundColor: _getBackgroundColor(),
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
              side: BorderSide(color: _getBorderColor(), width: 2), // 테두리 색상
            ),
            elevation: 0,
            padding:padding?? EdgeInsets.zero,
          ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent)),
          child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // 텍스트를 왼쪽 정렬
      children: [
        SizedBox(width:12 ,),
        // Text(
        //   childText ?? "",
        //   style: textStyle ??
        //       TextStyle(
        //         color: _getTextColor(),
        //         fontSize: 14, // 기본 텍스트 크기
        //         fontWeight: FontWeight.bold, // 텍스트 스타일
        //       ),
        // ),
        RichText(
  text: TextSpan(
    children: _buildStyledTextSpans(
      childText ?? "",
      textStyle ??
          MyText().BODY_14_EB,
      MyText().BODY_14_B,
    ),
  ),
),

        
        Spacer(),
        CustomImageView(imagePath:imagePath ,),
        SizedBox(width:12 ,),
      ],
    ),

        ),
      );

List<TextSpan> _buildStyledTextSpans(
  String fullText,
  TextStyle defaultStyle,
  TextStyle boldStyle,
) {
  final numberPattern = RegExp(r"\d+"); // 숫자만 매칭
  final matches = numberPattern.allMatches(fullText);

  List<TextSpan> spans = [];
  int lastMatchEnd = 0;

  for (final match in matches) {
    // 일반 텍스트 추가
    if (match.start > lastMatchEnd) {
      spans.add(
        TextSpan(
          text: fullText.substring(lastMatchEnd, match.start),
          style: defaultStyle,
        ),
      );
    }

    // 숫자 부분 (Bold 처리)
    spans.add(
      TextSpan(
        text: fullText.substring(match.start, match.end),
        style: boldStyle,
      ),
    );

    lastMatchEnd = match.end;
  }

  // 남은 일반 텍스트 추가
  if (lastMatchEnd < fullText.length) {
    spans.add(
      TextSpan(
        text: fullText.substring(lastMatchEnd),
        style: defaultStyle,
      ),
    );
  }

  return spans;
}

}
