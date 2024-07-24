import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_component.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/peringkat_component.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: transparentColor,
            title: AutoSizeText.rich(
              TextSpan(
                text: 'Laporan Ananda',
                style: tsTitleSmallSemibold(blackColor),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(55),
              child: ClipRRect(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: opacity5GreyColor,
                  ),
                  child: TabBar(
                    labelStyle: tsBodySmallSemibold(blackColor),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: blackColor,
                    unselectedLabelColor: greyColor,
                    tabs: [
                      Tab(
                        text: 'Laporan',
                      ),
                      Tab(
                        text: 'Peringkat',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.01),
            child: TabBarView(
              children: [
                LaporanComponent(),
                PeringkatComponent(),
              ],
            ),
          )),
        ));
  }
}
