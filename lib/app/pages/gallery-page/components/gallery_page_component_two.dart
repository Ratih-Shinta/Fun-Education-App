import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/gallery-page/components/bottomsheet_detail_photo.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class GalleryPageComponentTwo extends GetView<GalleryPageController> {
  const GalleryPageComponentTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          group: AutoSizeGroup(),
          maxLines: 1,
          'Semua Foto',
          style: tsBodyMediumSemibold(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.isLoadingAllPhotos.value == true) {
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
              itemCount: controller.showAllPhotosModel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    bottomSheetDetailGallery( 
                      context,
                      controller.showAllPhotosModel[index].title!,
                      controller.showAllPhotosModel[index].description!,
                      controller.showAllPhotosModel[index].image!,
                      controller.showAllPhotosModel[index].createdAt!.toString(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${controller.showAllPhotosModel[index].image ?? 'https://cdn.pixabay.com/photo/2015/10/04/06/52/mountain-970704_640.jpg'}',
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
    );
  }
}
