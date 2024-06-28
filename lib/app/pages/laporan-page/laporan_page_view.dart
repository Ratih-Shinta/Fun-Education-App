import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_component.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tab_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: transparentColor,
          title: AutoSizeText.rich(
            TextSpan(
              text: 'Laporan Ananda',
              style: tsTitleSmallSemibold(blackColor),
            ),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.01,
                  ),
                  child: GestureDetector(
                    onHorizontalDragEnd: controller.onHorizontalDrag,
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: opacity5GreyColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TabButton(
                                title: 'Laporan',
                                index: 0,
                              ),
                              TabButton(
                                title: 'Peringkat',
                                index: 1,
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return IndexedStack(
                            index: controller.currentIndex.value,
                            children: [
                              LaporanComponent(),
                              Center(child: Text('Peringkat Content')),
                            ],
                          );
                        }),
                      ],
                    ),
                  )),
            )));
  }
}
