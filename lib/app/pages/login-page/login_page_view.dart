import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText.rich(
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
                        group: AutoSizeGroup(),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 11.5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: opacityWarningColor,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: warningColor,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: AutoSizeText(
                                "Isi dengan username dan password yang telah diberikan oleh guru",
                                maxLines: 2,
                                style: tsLabelLargeMedium(warningColor),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Lanjut',
                          style: tsBodyMediumSemibold(whiteColor),
                        ),
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