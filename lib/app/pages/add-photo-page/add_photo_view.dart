import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/add-photo-page/components/camera_add__photo.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class AddPhotoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.03,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: width * 0.048),
                child: FunEducation(
                  width: 25,
                  textStyle: tsBodyLargeSemibold(primaryColor),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.03),
                  decoration: BoxDecoration(
                    // boxShadow: [shadowBlackBlur15Color5],
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: 'Tambahkan Foto Profil',
                            style: tsBodyLargeSemibold(blackColor)),
                        maxLines: 2,
                      ),
                      SizedBox(height: height * 0.03),
                      CameraAddPhoto(),
                      SizedBox(height: height * 0.03),
                      CommonWarning(
                          backColor: warningColor,
                          icon: Icons.info_outline,
                          text:
                              'Usahakan menggunakan foto ananda setengah badan memakai seragam'),
                      SizedBox(height: height * 0.017),
                      CommonButton(
                        text: 'Masuk',
                        onPressed: () {},
                        color: secondaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
