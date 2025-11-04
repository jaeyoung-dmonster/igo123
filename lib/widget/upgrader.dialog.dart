import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/widget/my.button.dart';


class DialogWidget extends StatelessWidget {
  final String title, subText, buttonLabel1;
  final Widget? subText2;
  final String? buttonLabel2;
  final Function() onPressed1;
  final Function()? onPressed2;

  const DialogWidget({
    super.key,
    required this.title,
    required this.subText,
    this.subText2,
    required this.buttonLabel1,
    this.buttonLabel2,
    required this.onPressed1,
    this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
        child: Container(
          width: 310,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: GRAY800,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              Text(
                subText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GRAY800,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subText2 != null ? subText2! : SizedBox(),
              SizedBox(height: 20),
              buttonLabel2 == null
                  ? SizedBox(
                      width: 135,
                      child: MyCustomButton(
                        childText: buttonLabel1,
                        width: 135,
                        height: 48,
                        onPressed: onPressed1,
                        
                      ).Filled,
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: MyCustomButton(
                            childText: buttonLabel2 as String,
                            width: 135,
                            height: 48,
                            onPressed: onPressed2 as Function(),
                            
                          ).Filled,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: MyCustomButton(
                            childText: buttonLabel1,
                            width: 135,
                            height: 48,
                            onPressed: onPressed1,
                            
                          ).Filled,
                        ),
                      ],
                    ),
            ],
          ),
        ));
  }
}
