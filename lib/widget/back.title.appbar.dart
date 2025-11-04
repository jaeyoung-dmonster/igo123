// 두 번째 타입의 앱바: 뒤로가기 버튼과 타이틀
import 'package:flutter/material.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';
import 'package:igo123/widget/custom.image.view.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final List<Widget>? actions;
  final TextStyle? style;
  final Color bottomColor; // 앱바 아래에 추가할 색상
  final double bottomHeight; // 앱바 아래 색상 높이
  bool? centertitle;
  BackAppBar({
    Key? key,
    required this.title,
    this.onBackTap,
    this.actions,
    this.style,
    this.bottomColor = Colors.transparent, // 기본 투명
    this.bottomHeight = 0.0, // 기본 높이 0
    this.centertitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: onBackTap ?? () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomImageView(imagePath: "assets/svg/arrowLeft.svg",color: WHITE,width: 24,height: 24,),
            ),
          ),
          
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0,left: 13),
                child: Text(
                  title,
                  style: style ?? MyText().PRETENDARD_16_700_TEXT.copyWith(color: WHITE),
                ),
              ),
              Spacer(),
              if (actions != null) ...actions!,
              if (actions == null) const SizedBox(width: 80,),
            ],
          ),
          centerTitle: true,
        ),
        // AppBar 아래 고정된 색상
        if (bottomHeight > 0)
          Container(
            height: bottomHeight,
            color: bottomColor,
          ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + bottomHeight); // AppBar 높이 + 추가 높이
}

