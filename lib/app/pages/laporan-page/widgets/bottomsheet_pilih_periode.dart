import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetPilihPeriode extends StatelessWidget {
  final String subtitle;
  final List<String> options;
  final Function(String) onOptionSelected;
  final RxString selectedOption;

  BottomsheetPilihPeriode({
    Key? key,
    required this.subtitle,
    required this.options,
    required this.onOptionSelected,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      height: height * 0.37,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.06,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeader(width, height),
              _buildOptions(width, height),
              CommonButton(
                text: 'Tutup',
                color: blackColor,
                onPressed: () {
                            Get.back();
                          },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: height * 0.01),
          width: width * 0.15,
          height: height * 0.008,
          decoration: BoxDecoration(
            color: opacity20GreyColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.02),
              width: width * 0.016,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            AutoSizeText.rich(
              TextSpan(
                text: 'Pilih Periode\n',
                style: tsBodyMediumSemibold(blackColor).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: 'Pilih Untuk Melihat Perkembangan $subtitle',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOptions(double width, double height) {
    return Column(
      children: options.map((option) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => onOptionSelected(option),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText.rich(TextSpan(
                    text: option,
                    style: tsBodyMediumSemibold(blackColor),
                  )),
                  Obx(() {
                    return Icon(Icons.check_circle,
                        color: selectedOption.value == option
                            ? successColor
                            : transparentColor);
                  }),
                ],
              ),
            ),
            if (option != options.last) SizedBox(height: height * 0.015),
          ],
        );
      }).toList(),
    );
  }
}