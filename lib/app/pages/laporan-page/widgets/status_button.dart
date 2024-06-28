import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class StatusButton extends GetView<LaporanPageController> {
  final String title;
  final int index;
  final int count;
  const StatusButton(this.title, this.index, this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () => controller.changeStatus(index),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                        text: title,
                        style: tsBodySmallSemibold(
                          controller.selectedStatus.value == index
                              ? primaryColor
                              : opacity50GreyColor,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: controller.selectedStatus.value == index
                          ? primaryColor
                          : greyColor.withOpacity(0.3),
                    ),
                    child: AutoSizeText.rich(
                      TextSpan(
                          text: count.toString(),
                          style: tsBodySmallSemibold(
                            whiteColor,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              if (controller.selectedStatus.value == index)
                Container(
                  height: 3,
                  width: 78,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        ));
  }
}
