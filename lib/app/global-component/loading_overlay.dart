// import 'package:flutter/material.dart';
// import 'package:fun_education_app/common/helper/themes.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

// class LoadingOverlay extends StatelessWidget {
//   const LoadingOverlay({
//     super.key,
//     required this.isLoading,
//     required this.child,
//   });

//   final Widget child;
//   final bool isLoading;

//   @override
//   Widget build(BuildContext context) {
//     final Size mediaQuery = MediaQuery.of(context).size;
//     final double height = mediaQuery.height;

//     if (isLoading) {
//       return Stack(
//         children: [
//           child,
//           Container(
//             height: height,
//             color: blackColor.withOpacity(0.1),
//             child: Center(
//               child: LoadingAnimationWidget.fourRotatingDots(
//                 color: secondaryColor,
//                 size: height * 0.04,
//               ),
//             ),
//           ),
//         ],
//       );
//     } else {
//       return child;
//     }
//   }
// }
