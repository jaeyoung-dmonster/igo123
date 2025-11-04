// import 'package:flutter/material.dart';
// import 'package:igo123/widget/custom.change.image.dart';

// class ImageDetailScreen extends StatelessWidget {
//   final String imageUrl;

//   const ImageDetailScreen({
//     Key? key, 
//     required this.imageUrl
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // 이미지를 화면 중앙에 90% 크기로 표시
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.height * 0.9,
//               child: InteractiveViewer(
//                 minScale: 0.5,
//                 maxScale: 4.0,
//                 child: Image.network(
//                   CustomChangeImage(profile: imageUrl).getImageUrl() ?? '',
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded / 
//                             loadingProgress.expectedTotalBytes!
//                           : null,
//                         color: Colors.white,
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.error, color: Colors.white, size: 50),
//                           SizedBox(height: 16),
//                           Text(
//                             "이미지를 불러올 수 없습니다",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
          
//           // 오른쪽 상단에 X 버튼 배치
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 16,
//             right: 16,
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.close,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // 이미지 확대 다이얼로그 위젯
// Widget buildImageDialog(BuildContext context,String imageUrl) {
//   return Dialog(
//     backgroundColor: Colors.transparent,
//   insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
//     child: Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.center,
//       children: [
//         // 이미지 (90% 크기)
//         Container(
//           width: MediaQuery.of(context).size.width * 0.85,
//           height: MediaQuery.of(context).size.height * 0.85,
//           child: InteractiveViewer(
//             minScale: 0.5,
//             maxScale: 4.0,
//             child: Image.network(
//               CustomChangeImage(profile: imageUrl).getImageUrl() ?? '',
//               fit: BoxFit.contain,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Center(
//                   child: CircularProgressIndicator(
//                     value: loadingProgress.expectedTotalBytes != null
//                       ? loadingProgress.cumulativeBytesLoaded / 
//                         loadingProgress.expectedTotalBytes!
//                       : null,
//                     color: Colors.white,
//                   ),
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 return Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.error, color: Colors.white, size: 50),
//                       SizedBox(height: 16),
//                       Text(
//                         "이미지를 불러올 수 없습니다",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
        
//         // 우측 상단 X 버튼
//         Positioned(
//           top: -12,
//           right: -12,
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child:  Icon(
//                 Icons.close,
//                 color: Colors.red,
//                 size: 24,
//               ),
            
//           ),
//         ),
//       ],
//     ),
//   );
// }