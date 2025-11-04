  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';


// Widget buildTermSection({required String title, required String content}) {
//     return 
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "$title ",
//                 style:MyText().NEMOVIEW_14_400 .copyWith(color: Colors.red),
//               ),
//               TextSpan(
//                 text: content,
//                 style: MyText().NEMOVIEW_14_400 .copyWith(color: Colors.black,),
//               ),
//             ],
//           ),
//         )
//     ;
//   }
Widget customDivider({Color? color}){
   return  Divider(height: 1, color: color ?? WHITE,thickness: 1,)
          ;
}

Widget customVerticalDivider({Color? color}){
   return  Container(width: 1, color: color ?? WHITE,height: 24,)
          ;
}


Widget iconWithText(String text, String icon, {double? leftP,TextStyle? textstyle ,Color? color}){
return Row(
  children: [
    SvgPicture.asset(icon, color: color ?? WHITE),
    SizedBox(width: 4),
    Text(text, style: textstyle ?? MyText().PRETENDARD_16_500_TEXT.copyWith(color: color ?? WHITE)),
  ],
);
}
// Widget firstCard(String text, {double? leftP,TextStyle? textstyle ,Color? color}){
//     return Padding(
//       padding: EdgeInsets.only(left:leftP ??12.0),
//       child: Row(
//                        children: [
//                          Text(text , style: color!= null ? MyText().NEMOVIEW_16_600.copyWith(color: color ?? BLACK):MyText().NEMOVIEW_14_400.copyWith(color: color ?? BLACK),),
//                          Text(" *",style: MyText().NEMOVIEW_14_400.copyWith(color: Colors.red),)
//                        ],
//                      ),
//     );
//   }

// Widget firstCustomCard(String text, {double? leftP,TextStyle? textstyle ,MainAxisAlignment? mainAlign}){
//     return Padding(
//       padding: EdgeInsets.only(left:leftP ??12.0),
//       child: Row(
//               mainAxisAlignment: mainAlign??MainAxisAlignment.start ,

//                        children: [
//                          Text(text , style: textstyle?? MyText().NEMOVIEW_14_400.copyWith(color: BLACK),),
//                          Text(" *",style:textstyle != null ?textstyle.copyWith(color: Brand_Pink ,fontSize: 18.fSize) : MyText().NEMOVIEW_14_400.copyWith(color: Brand_Pink))
//                        ],
//                      ),
//     );
//   }
// Widget firstCustomCarForce(String text,String force, {double? leftP,TextStyle? textstyle ,MainAxisAlignment? mainAlign}){
//     return Padding(
//       padding: EdgeInsets.only(left:leftP ??12.0),
//       child: Row(
//               mainAxisAlignment: mainAlign??MainAxisAlignment.start ,

//                        children: [
//                          Text(force , style: MyText().NEMOVIEW_GRAY800_16_700),
//                          Text(text , style: MyText().NEMOVIEW_GRAY800_16_400,),
                         
//                        ],
//                      ),
//     );
//   }

  