// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/gallery-page/components/bottomsheet_detail_photo.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/detail-album-photo/detail_album_photo_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class DetailAlbumPhotoView extends GetView<DetailAlbumPhotoController> {
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());
  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: AutoSizeText(
            group: AutoSizeGroup(),
            maxLines: 1,
            'Detail Album',
            style: tsBodyLargeSemibold(blackColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: opacity5GreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.12,
                          height: height * 0.06,
                          padding: EdgeInsets.symmetric(
                            horizontal: height * 0.01,
                            vertical: height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/icAlbumPhoto.svg',
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Album',
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              style: tsBodySmallRegular(blackColor),
                            ),
                            Container(
                              width: width * 0.6,
                              child: AutoSizeText(
                                '${argument.name}',
                                group: AutoSizeGroup(),
                                maxLines: 5,
                                style: tsBodyMediumSemibold(blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: AutoSizeText(
                        '${argument.desc}',
                        group: AutoSizeGroup(),
                        maxLines: 3,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    '${argument.gallery.length} Photos',
                    group: AutoSizeGroup(),
                    maxLines: 1,
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
              Obx(() {
                if (galleryPageController.isLoadingAllPhotos.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: height * 0.005,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: argument.gallery!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          bottomSheetDetailGallery(
                            context,
                            argument.gallery![index].title!,
                            argument.gallery![index].description!,
                            argument.gallery![index].image!,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${argument.gallery![index].image ?? 'https://cdn.pixabay.com/photo/2015/10/04/06/52/mountain-970704_640.jpg'}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
