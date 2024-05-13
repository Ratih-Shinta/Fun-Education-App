import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/login-page/widgets/login_form_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LoginPageView extends StatelessWidget {
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
                  child: FunEducation()),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.03),
                  decoration: BoxDecoration(
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
                          text: 'Selamat datang di\n',
                          style: tsTitleMediumRegular(blackColor).copyWith(
                            height: 1.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'FunEduation',
                              style: tsTitleMediumSemibold(secondaryColor),
                            ),
                          ],
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: height * 0.03),
                      CommonWarning(
                          backColor: warningColor,
                          icon: Icons.info_outline,
                          text:
                              'Isi dengan username dan password yang telah diberikan oleh guru'),
                      SizedBox(height: height * 0.025),
                      LoginFormWidget(
                        hintText: 'Username',
                        iconPrefix: Icon(Icons.person, color: greyColor),
                        isObsecure: false,
                      ),
                      SizedBox(height: height * 0.015),
                      LoginFormWidget(
                        iconPrefix: Icon(Icons.lock, color: greyColor),
                        hintText: 'Password',
                        isObsecure: false,
                      ),
                      SizedBox(height: height * 0.075),
                      CommonButton(text: 'Lanjut')
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
