// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:fun_education_app/app/global-component/common_button.dart';
// import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
// import 'package:fun_education_app/app/pages/transaksi-page/widgets/header_bottomsheet.dart';
// import 'package:fun_education_app/common/helper/themes.dart';
// import 'package:get/get.dart';

// class BottomsheetPilihPeriode extends GetView<LaporanPageController> {
//   final String title;
//   final String subtitle;
//   final List<String> options;
//   final Function(String) onOptionSelected;
//   final RxString selectedOption;

//   BottomsheetPilihPeriode({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.options,
//     required this.onOptionSelected,
//     required this.selectedOption,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size mediaQuery = MediaQuery.of(context).size;
//     final double width = mediaQuery.width;
//     final double height = mediaQuery.height;

//     return SizedBox(
//       height: height * 0.37,
//       child: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25),
//               topRight: Radius.circular(25),
//             ),
//           ),
//           padding: EdgeInsets.symmetric(
//             vertical: height * 0.03,
//             horizontal: width * 0.06,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               HeaderBottomsheet(
//                   title: title, subtitle: subtitle, color: primaryColor),
//               buildOptions(width, height),
//               CommonButton(
//                 text: 'Tutup',
//                 backgroundColor: blackColor,
//                 textColor: whiteColor,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildOptions(double width, double height) {
//     return Column(
//       children: options.map((option) {
//         return Column(
//           children: [
//             GestureDetector(
//               onTap: () => onOptionSelected(option),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AutoSizeText.rich(TextSpan(
//                     text: option,
//                     style: tsBodyMediumSemibold(blackColor),
//                   )),
//                   Obx(() {
//                     return Icon(Icons.check_circle,
//                         color: selectedOption.value == option
//                             ? successColor
//                             : transparentColor);
//                   }),
//                 ],
//               ),
//             ),
//             if (option != options.last) SizedBox(height: height * 0.015),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }
