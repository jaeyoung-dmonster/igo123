import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';


class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  CustomAlertDialog({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // 다이얼로그 모서리 둥글게
      ),
      backgroundColor: Colors.white, // 다이얼로그 배경색
      title: Text(
        title,
        style: MyText().BODY_18_M,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: MyText().BODY_18_M.copyWith(fontSize: 14.w),
        // softWrap: true,  overflow: TextOverflow.visible, // 넘치는 텍스트 표시

      ),
      actions: [
      Container(
        margin:const EdgeInsets.only(left: 80,right: 80,top: 12,bottom: 20),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        color: NEMOVIEWMAINCOLOR,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 버튼 중앙 정렬
          children: [
            TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: MyText().BODY_18_M.copyWith(color: WHITE),
              ),
            ),
          ],
        ),
      ),
      ],
    );
  }
}

class CustomAlertDialogNoTitle extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  CustomAlertDialogNoTitle({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // 다이얼로그 모서리 둥글게
      ),
      backgroundColor: Colors.white, // 다이얼로그 배경색
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [ 
          const SizedBox(height: 20,),
          Center(
            child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
            color: GRAY800, // 내용 텍스트 색상
            fontSize: 16.0.w,
                    ),
                  ),
          ),
         const SizedBox(height: 20,),
        TextButton(
  onPressed: onPressed,
  style: TextButton.styleFrom(
    padding: EdgeInsets.zero, // Container에서 패딩 조정
  ),
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 40),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    decoration: BoxDecoration(
      color: Brand_Purple, // 배경 색상 (원하는 색상으로 변경 가능)
      borderRadius: BorderRadius.circular(12), // BorderRadius 12 적용
    ),
    child: Center(
      child: Text(
        "확인",
        style: MyText().BODY_18_M.copyWith(
          color: Colors.white, // 텍스트 색상 (버튼과 대비되는 색상 선택)
        ),
      ),
    ),
  ),
)
        ])
      // actions: [
      // Container(
      //   width: double.infinity,
      //   color: NEMOVIEWMAINCOLOR,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center, // 버튼 중앙 정렬
      //     children: [
      //       TextButton(
      //         onPressed: onPressed,
      //         child: Text(
      //           buttonText,
      //           style: TextStyle(
      //             color: GRAY800, // 버튼 텍스트 색상
      //             fontSize: 16.0.fSize,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // ],
    );
  }
}


class MyContentDialogWithButton extends StatelessWidget {
  final String? image;
  final String title;
  final String? content;
  final String confirmText;
  final VoidCallback onConfirm;
  final String? cancelText;
  final VoidCallback? onCancel;
  final Color confirmButtonColor;
  final Color confirmTextColor;
  final Color cancelButtonColor;
  final Color cancelTextColor;
  final bool isWarning;
  final String? warningText;
  MyContentDialogWithButton({
    this.image,
    required this.title,
    this.content,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
    this.confirmButtonColor = DARKMODE900,
    this.confirmTextColor = DARKMODEPOINT,
    this.cancelButtonColor = DARKMODE900,
    this.cancelTextColor = DARKMODE100,
    this.isWarning = false, // 새로 추가
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: DARKMODE900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
            child: Column(
              children: [
                if (image != null) ...[
                  const SizedBox(height: 10),
                ],
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: isWarning ? Colors.red : Colors.white, // 경고 시 빨간색
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                if (content != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    content!,
                    style: TextStyle(
                      color: isWarning ? Colors.red : Colors.white, // 경고 시 빨간색
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (warningText != null) ...[
                    SizedBox(height: 8,),
                    Text(
                      warningText!,
                      style: TextStyle(color: REDMODE,fontSize: 13,fontFamily: "Pretendard"),
                    ),
                  ],
                ],
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.black26),
          Container(
            height: 60,
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onCancel ?? () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      // decoration: BoxDecoration(
                      //   color: WHITE,
                      // ),
                      child: Center(
                        child: Text(
                          cancelText ?? "취소",
                          style:MyText().PRETENDARD_16_700_TEXT.copyWith(fontSize: 14)
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: 1,
                //   height: 48,
                //   color: WHITE,
                // ),
                Expanded(
                  child: TextButton(
                    onPressed: onConfirm,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      // decoration: BoxDecoration(
                      //   color: isWarning ? Colors.red : Brand_Yellow,
                      // ),
                      child: Center(
                        child: Text(
                          confirmText,
                          style:MyText().PRETENDARD_16_700_TEXT.copyWith(color: confirmTextColor,fontSize: 14)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MyContentDialog extends StatelessWidget {
  final Widget content;
  final double contentPadding;
  final Widget? buttons;
  final double radius;
  const MyContentDialog({
    Key? key,
    required this.content,
    required this.contentPadding,
    this.buttons,
    this.radius = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      backgroundColor: DARKMODE900,
      surfaceTintColor: DARKMODE900,
      
      elevation: 0,
      contentPadding: EdgeInsets.all(contentPadding),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 4,),
          content,
          if (buttons != null)
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 16.0), // 버튼과 내용 사이 간격
              child: buttons,
            ),
        ],
      ),
    );
  }
}



void showAlert(BuildContext context, String title, String message,VoidCallback? onConfirm) {
  showDialog(
    context: context,
    builder: (ctx) {
      return MyContentDialog(
        
        contentPadding: 16.0,
        radius: 16.0,
        content: Column(
          children: [
            Text(
              title,
              style: MyText().PRETENDARD_20_700_TEXT.copyWith(color: DARKMODE100),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                message,
                style: MyText().PRETENDARD_16_500_TEXT,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        buttons: TextButton(
          onPressed: onConfirm,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Container(
            width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal: 80),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: DARKMODE100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "확인",
                style: MyText().PRETENDARD_16_700_TEXT.copyWith(
                  color: DARKMODE900,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showCustomDialogwithTwoButton({
  required BuildContext context,
  String? image,
  required String title,
  String? content,
  required String confirmText,
  required VoidCallback onConfirm,
  String? cancelText,
  VoidCallback? onCancel,
  Color confirmButtonColor = DARKMODE900,
  Color confirmTextColor = DARKMODEPOINT,
  Color cancelButtonColor = DARKMODE900,
  Color cancelTextColor = DARKMODE100,
  String? warningText,
  bool isWarning = false, // 추가: 경고 스타일 여부
}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return MyContentDialogWithButton(
        image: image,
        title: title,
        content: content,
        confirmText: confirmText,
        onConfirm: onConfirm,
        cancelText: cancelText,
        warningText: warningText,
        onCancel: onCancel ?? () => Navigator.of(context).pop(),
        confirmButtonColor: confirmButtonColor,
        confirmTextColor: confirmTextColor,
        cancelButtonColor: cancelButtonColor,
        cancelTextColor: cancelTextColor,
      );
    },
  );
}


void showAnnouncementDialog({
  required BuildContext context,
  required String message,
  required String confirmText,
  required VoidCallback onConfirm,
  required String warningText,
}) {
  showCustomDialogwithTwoButton(
    context: context,
    title: '안내',
    content: message,
    confirmText: confirmText,
    cancelText: '취소',
    onConfirm: onConfirm,
    warningText: warningText,
    onCancel: () => Navigator.of(context).pop(),
  );
}

// 알림 다이얼로그 (두 번째 이미지)
void showAlertDialog({
  required BuildContext context,
  required String message,
  required String confirmText,
  required VoidCallback onConfirm,
  required Color confirmTextColor,
}) {
  showCustomDialogwithTwoButton(
    context: context,
    title: '알림',
    content: message,
    confirmText: confirmText,
    onConfirm: onConfirm,
    confirmTextColor: confirmTextColor,
    onCancel: () => Navigator.of(context).pop(),
    isWarning: true,
  );
}