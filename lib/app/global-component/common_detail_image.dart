import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class CommonDetailImage extends StatelessWidget {
  final String imagePath;
  final bool isNetwork;

  CommonDetailImage({required this.imagePath, required this.isNetwork,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: AutoSizeText(
          'Detail Gambar',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumSemibold(whiteColor),
        ),
      ),
      body: Center(
        child: isNetwork == true ? Image.network(imagePath, fit: BoxFit.contain,) : Image.file(
          File(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
