import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TabviewContent extends StatelessWidget {
  final RxBool isLoading;
  final List<dynamic> data;
  final double width;
  final double height;
  final String noDataTitle;
  final String noDataSubtitle;

  const TabviewContent(
      {super.key,
      required this.isLoading,
      required this.data,
      required this.width,
      required this.height,
      required this.noDataTitle,
      required this.noDataSubtitle});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (isLoading.value) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            ),
          );
        } else if (data.isEmpty) {
          return CommonNoData(
            title: noDataTitle,
            subTitle: noDataSubtitle,
            image: 'assets/images/imgEmpty.svg',
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return TugasWidget(
                controllerArguments: data[index],
              );
            },
          );
        }
      },
    );
  }
}
