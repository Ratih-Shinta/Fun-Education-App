import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app/app/pages/splash-screen/splash_screen_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: opacityPrimaryColor,
                    borderRadius: BorderRadius.circular(14)),
                child: SvgPicture.asset(
                  logo,
                  width: 65,
                )),
            SizedBox(height: 15),
            Text(
              'FunEducation',
              style: tsTitleSmallSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
