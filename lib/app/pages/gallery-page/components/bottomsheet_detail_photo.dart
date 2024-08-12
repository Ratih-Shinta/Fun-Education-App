import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_detail_image.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void bottomSheetDetailGallery(BuildContext context, String title,
    String description, String imageUrl, String createAt) {
  final GalleryPageController controller = Get.put(GalleryPageController());
  final Size mediaQuery = MediaQuery.of(context).size;
  final double width = mediaQuery.width;
  final double height = mediaQuery.height;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: whiteColor,
    builder: (context) {
      return SizedBox(
        height: height * 0.65,
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
              InkWell(
                onTap: () {
                  Get.to(
                    () => CommonDetailImage(
                      imagePath: imageUrl.toString(),
                      isNetwork: true,
                    ),
                  );
                },
                child: Container(
                  width: width,
                  height: height * 0.27,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${imageUrl.toString()}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: blackColor,
                    size: 20,
                  ),
                  SizedBox(width: width * 0.02),
                  AutoSizeText(
                      '${DateFormat('EEEE, d MMMM', 'id_ID').format(DateTime.parse(createAt))}',
                      style: tsBodySmallRegular(blackColor))
                ],
              ),
              SizedBox(height: height * 0.015),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      '${title}',
                      style: tsBodyMediumSemibold(blackColor),
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
                onPressed: () {
                  controller.savePhotoToGallery(imageUrl);
                  Navigator.pop(context);
                },
                backgroundColor: blackColor,
                textColor: whiteColor,
                icon: Icons.download,
              )
            ],
          ),
        ),
      );
    },
  );
}
