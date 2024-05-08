import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/add-photo-page/components/camera_add__photo.dart';
import 'package:fun_education_app/common/helper/assets_themes.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class AddPhotoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      logo,
                      width: 25,
                    ),
                    Text(
                      'FunEducation',
                      style: tsTitleMediumSemibold(primaryColor),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    boxShadow: [shadowBlackBlur15Color5],
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
                      SizedBox(height: 30),
                      CameraAddPhoto(),
                      SizedBox(height: 50),
                      CommonWarning(
                          backColor: warningColor,
                          icon: Icons.info_outline,
                          text:
                              'Usahakan menggunakan foto ananda setengah badan memakai seragam'),
                      SizedBox(height: 11),
                      CommonButton(text: 'Masuk')
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
