import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class GalleryPageComponentTwo extends StatelessWidget {
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              group: AutoSizeGroup(),
              maxLines: 1,
              'Semua Foto',
              style: tsBodyMediumSemibold(blackColor),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AutoSizeText(
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  'Pilih',
                  style: tsBodySmallMedium(whiteColor),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: width * 0.01,
            mainAxisSpacing: height * 0.005,
            childAspectRatio: 1.1,
          ),
          itemCount: galleryPageController.showAllPhotosList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    '${galleryPageController.showAllPhotosList[index].image ?? 'https://cdn.pixabay.com/photo/2015/10/04/06/52/mountain-970704_640.jpg'}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
