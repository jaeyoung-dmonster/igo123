import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igo123/theme/my.color.dart';



class MyText {
  final Color color;
  final double height;
  final TextDecoration decoration;

  const MyText({
    this.color = GRAY900,
    this.height = 1.0,
    this.decoration = TextDecoration.none,
  });

  // 언어 감지 및 폰트 결정 헬퍼 메서드
  String _getFontFamily(String text) {
    // 한국어 문자 감지 (한글 유니코드 범위: AC00-D7AF)
    bool hasKorean = text.contains(RegExp(r'[\uAC00-\uD7AF]'));
    // 영어 문자 감지
    bool hasEnglish = text.contains(RegExp(r'[a-zA-Z]'));
    
    if (hasKorean) {
      return 'apple'; // 한국어용 폰트
    } else if (hasEnglish) {
      return 'Satoshi'; // 영어용 폰트
    } else {
      return 'apple'; // 기본 폰트
    }
  }

  // 언어별 폰트가 자동 적용되는 TextStyle 생성 메서드
  TextStyle getAutoFontStyle({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    Color? textColor,
    double? textHeight,
  }) {
    return TextStyle(
      fontFamily: _getFontFamily(text),
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: textColor ?? color,
      height: textHeight ?? height,
      decoration: decoration,
      decorationColor: textColor ?? color,
    );
  }

  // 기존 스타일에 언어별 폰트 적용
  TextStyle applyAutoFont(String text, TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontFamily: _getFontFamily(text),
    );
  }

  // h1
  TextStyle get H1_24_B => TextStyle(
        fontSize: 24.sp,
        color: color,
        //height: //height,
        
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get H1_24_M => TextStyle(
        fontSize: 24.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get H1_24_R => TextStyle(
        fontSize: 24.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
        decorationColor: color,
      );

  // title
  TextStyle get TITLE_40_B => TextStyle(
        fontSize: 40.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get TITLE_30_B => TextStyle(
        fontSize: 30.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w600,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get TITLE_22_B => TextStyle(
        fontSize: 22.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w600,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get TITLE_32_R => TextStyle(
        fontSize: 32.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
        decorationColor: color,
      );

  // body
  TextStyle get BODY_18_EB => TextStyle(
        fontSize: 18.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w800,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_18_B => TextStyle(
        fontSize: 18.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );

  TextStyle get BODY_18_M_600 => TextStyle(
        fontSize: 18.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w600,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_18_M => TextStyle(
        fontSize: 18.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      );
 
  TextStyle get BODY_16_EB => TextStyle(
        fontSize: 16.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w800,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_16_B => TextStyle(
        fontSize: 16.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_16_M => TextStyle(
        fontSize: 16.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_14_EB => TextStyle(
        fontSize: 14.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w800,
        decoration: decoration,
        decorationColor: color,
      );

  TextStyle get BODY_15_EB => TextStyle(
        fontSize: 15.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_14_B => TextStyle(
        fontSize: 14.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get BODY_14_M => TextStyle(
        fontSize: 14.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      );

  // legend
  TextStyle get LEGEND_12_B => TextStyle(
        fontSize: 12.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w700,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get LEGEND_12_M => TextStyle(
        fontSize: 12.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w500,
        decoration: decoration,
        decorationColor: color,
      );
  TextStyle get LEGEND_12_R => TextStyle(
        fontSize: 12.sp,
        color: color,
        //height: //height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
        decorationColor: color,
      );


   TextStyle get ONBOARDING_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  // height: 1.5, // line-height: 150%
  // letterSpacing: -0.4, // letter-spacing: -2% (20px의 -2%는 -0.4px)
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);




///
///
/// PRETENDARD (한글 - SUIT 폰트 사용)
///
///

   TextStyle get PRETENDARD_32_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 32.sp,
  fontWeight: FontWeight.w700,  
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get PRETENDARD_32_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 32.sp,
  fontWeight: FontWeight.w500,  
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get PRETENDARD_20_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 20.sp,
  fontWeight: FontWeight.w700, 
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get PRETENDARD_20_600_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 20.sp,
  fontWeight: FontWeight.w600, 
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get PRETENDARD_18_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 18.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);


   TextStyle get PRETENDARD_16_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get PRETENDARD_16_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w500 ,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get PRETENDARD_14_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 14.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get PRETENDARD_14_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get PRETENDARD_13_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get PRETENDARD_12_400_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

///
///
/// NOTOSANS (한글 - SUIT 폰트 사용)
///
///
   TextStyle get NOTOSANS_16_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w700, 
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
); 
   TextStyle get NOTOSANS_16_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get NOTOSANS_14_700_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 14.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
   TextStyle get NOTOSANS_14_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
);
   TextStyle get NOTOSANS_12_500_TEXT => TextStyle(
  fontFamily: 'SUIT', 
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
);

///
///
/// NATS (영어 - Satoshi 폰트 사용)
///
///
///
 TextStyle get NATS_24_700_TEXT => TextStyle(
  fontFamily: 'Satoshi', 
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
 TextStyle get NATS_22_400_TEXT => TextStyle(
  fontFamily: 'Satoshi', 
  fontSize: 22.sp,
  fontWeight: FontWeight.w400,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);


   TextStyle get NATS_17_400_TEXT => TextStyle(
  fontFamily: 'Satoshi', 
  fontSize: 17.sp,
  fontWeight: FontWeight.w400,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get NATS_16_400_TEXT => TextStyle(
  fontFamily: 'Satoshi', 
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

   TextStyle get NATS_10_500_TEXT => TextStyle(
  fontFamily: 'Satoshi', 
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);


///
///
///BINGGRE
///
///
///
TextStyle get BING_24_700_TEXT => TextStyle(
  fontFamily: 'bing', 
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);
TextStyle get BING_20_700_TEXT => TextStyle(
  fontFamily: 'bing', 
  fontSize: 20.sp,
  fontWeight: FontWeight.w700,
  color: WHITE,
  decoration: decoration,
  decorationColor: color,  
);

  // fontFamilyFallback을 사용한 다국어 지원 TextStyle
  TextStyle getMultiLanguageStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? textColor,
    double? textHeight,
  }) {
    return TextStyle(
      fontFamily: 'Satoshi', // 기본 영어 폰트
      fontFamilyFallback: [
        'SUIT', // 한국어 폰트
        'PretendardMedium', // 기타 폰트
      ],
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: textColor ?? color,
      height: textHeight ?? height,
      decoration: decoration,
      decorationColor: textColor ?? color,
    );
  }

  // 자주 사용하는 다국어 TextStyle들
  TextStyle get MULTI_LANG_16_500 => getMultiLanguageStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  TextStyle get MULTI_LANG_14_400 => getMultiLanguageStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  TextStyle get MULTI_LANG_18_700 => getMultiLanguageStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
