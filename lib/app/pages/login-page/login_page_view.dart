import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/login-page/widgets/login_form_widget.dart';
import 'package:fun_education_app/common/helper/assets_themes.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                      SizedBox(height: 30),
                      CommonWarning(backColor: warningColor, icon: Icons.info_outline, text: 'Isi dengan username dan password yang telah diberikan oleh guru'),
                      SizedBox(height: 15),
                      LoginFormWidget(
                        hintText: 'Username',
                        iconPrefix: Icon(Icons.person, color: greyColor),
                        isObsecure: false,
                      ),
                      SizedBox(height: 10),
                      LoginFormWidget(
                        iconPrefix: Icon(Icons.lock, color: greyColor),
                        hintText: 'Password',
                        isObsecure: false,
                      ),
                      SizedBox(height: 75),
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
