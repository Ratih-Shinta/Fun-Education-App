import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageComponentThree extends StatelessWidget {
  const HomePageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   margin: EdgeInsets.only(right: 8),
              //   padding: EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //       color: warningColor,
              //       borderRadius: BorderRadius.circular(5)),
              //   child: SvgPicture.asset(
              //     iconDocument,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                  right: width * 0.02,
                  bottom: height * 0.01,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.025,
                ),
                decoration: BoxDecoration(
                  color: warningColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.import_contacts_rounded,
                  color: whiteColor,
                  size: 25,
                ),
              ),
              Text(
                'Penting Untuk Dibaca!',
                style: tsBodySmallRegular(blackColor),
              ),
              SizedBox(height: height * 0.005),
              AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                    text: 'Hal - hal yang perlu diperhatikan orangtua',
                    style: tsBodyMediumSemibold(blackColor)),
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.HAL_YANG_PERLU_DIPERHATIKAN_PAGE);
            },
            child: Container(
              margin: EdgeInsets.only(top: height * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.018,
                horizontal: width * 0.06,
              ),
              decoration: BoxDecoration(
                color: warningColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Lihat Selengkapnya',
                      style: tsLabelLargeMedium(whiteColor),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: whiteColor,
                    size: 12,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
