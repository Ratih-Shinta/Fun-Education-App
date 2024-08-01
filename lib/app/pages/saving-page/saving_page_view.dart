import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/loading_overlay.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_one.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_two.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/ajukan_pengeluaran_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class SavingPageView extends GetView<SavingPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        onRefresh: () {
          controller.onREfresh();
          return Future<void>.value();
        },
        child: Container(
          child: SingleChildScrollView(
            child: Obx(
              () {
                return LoadingOverlay(
                  isLoading: controller.isLoading.value,
                  child: Column(
                    children: [
                      SavingPageComponentOne(),
                      SavingPageComponentTwo(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
