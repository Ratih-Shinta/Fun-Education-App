import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_five.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_four.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_one.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_six.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_three.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_two.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyColor,
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  TextSpan(
                    text: 'Senin, ',
                    style: tsBodyMediumSemibold(blackColor),
                    children: [
                      TextSpan(
                        text: '26 Maret 2024',
                        style: tsBodyMediumRegular(blackColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: opacitySecondaryColor,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      iconChat,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.015,
          ),
          child: Column(
            children: [
              HomePageComponentOne(),
              SizedBox(
                height: height * 0.02,
              ),
              HomePageComponentTwo(),
              SizedBox(
                height: height * 0.02,
              ),
              HomePageComponentThree(),
              SizedBox(
                height: height * 0.02,
              ),
              HomePageComponentFour(),
              SizedBox(
                height: height * 0.02,
              ),
              HomePageComponentFive(),
              SizedBox(
                height: height * 0.02,
              ),
              HomePageCompnentSix(),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        )));
  }
}
