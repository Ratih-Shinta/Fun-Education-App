import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/profile-page/components/profile_component_one.dart';
import 'package:fun_education_app/app/pages/profile-page/components/profile_component_three.dart';
import 'package:fun_education_app/app/pages/profile-page/components/profile_component_two.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: transparentColor,
          title: AutoSizeText(
            'Profil Ananda',
            style: tsTitleSmallSemibold(blackColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.05,
              ),
              child: Column(
                children: [
                  ProfileComponentOne(),
                  SizedBox(height: height * 0.02),
                  ProfileComponentTwo(),
                  SizedBox(height: height * 0.04),
                  ProfileComponentThree()
                ],
              ),
            ),
          ),
        )
        );
  }
}
