import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';

void bottomSheetDetailGallery(
    BuildContext context, String title, String description, String imageUrl) {
  final Size mediaQuery = MediaQuery.of(context).size;
  final double width = mediaQuery.width;
  final double height = mediaQuery.height;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: whiteColor,
    builder: (context) {
      return SizedBox(
        height: height * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  width: width * 0.15,
                  height: height * 0.008,
                  decoration: BoxDecoration(
                    color: opacity20GreyColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl.toString()),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      '${title}',
                      style: tsBodyLargeSemibold(blackColor),
                    ),
                    SizedBox(height: height * 0.005),
                    AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 3,
                      '${description}',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
              ),
              CommonButton(
                text: 'Download Gambar',
                onPressed: () => Navigator.pop(context),
                color: blackColor,
                icon: Icons.download,
              )
            ],
          ),
        ),
      );
    },
  );
}
