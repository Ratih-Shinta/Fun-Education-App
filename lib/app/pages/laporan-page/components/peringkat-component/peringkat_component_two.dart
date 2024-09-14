import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/bottomsheet_leaderboard_period.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PeringkatComponentTwo extends GetView<LaporanPageController> {
  const PeringkatComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icRanking.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Peringkat',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetLeaderboardPeriod();
                    },
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text: controller.selectedPeriod.value == 'weekly'
                                ? 'Mingguan'
                                : 'Bulanan',
                            style: tsBodySmallSemibold(blackColor)),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.023),
        Obx(() {
          if (controller.isLoadingLeaderboard.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: width,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.selectedPeriod.value == 'weekly'
                  ? controller.leaderboardModelWeekly.length
                  : controller.leaderboardModelMonthly.length,
              itemBuilder: (BuildContext context, int index) {
                Color backgroundColor;
                switch (index) {
                  case 0:
                    backgroundColor = goldColor.withOpacity(0.3);
                    break;
                  case 1:
                    backgroundColor = greyColor.withOpacity(0.5);
                    break;
                  case 2:
                    backgroundColor = bronzeColor.withOpacity(0.3);
                    break;
                  default:
                    backgroundColor = greyColor.withOpacity(0.05);
                    break;
                }

                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: controller.selectedPeriod.value == 'weekly'
                        ? (controller.leaderboardModelWeekly[index].isUser ==
                                true
                            ? successColor.withOpacity(0.5)
                            : backgroundColor)
                        : (controller.leaderboardModelMonthly[index].isUser ==
                                true
                            ? successColor.withOpacity(0.5)
                            : backgroundColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text:
                                '${controller.selectedPeriod.value == 'weekly' ? controller.leaderboardModelWeekly[index].rank : controller.leaderboardModelMonthly[index].rank}    ${controller.selectedPeriod.value == 'weekly' ? controller.leaderboardModelWeekly[index].fullName : controller.leaderboardModelMonthly[index].fullName}',
                            style: tsBodySmallSemibold(blackColor)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: controller.selectedPeriod.value == 'weekly'
                              ? (controller.leaderboardModelWeekly[index]
                                          .isUser ==
                                      true
                                  ? successColor
                                  : blackColor)
                              : (controller.leaderboardModelMonthly[index]
                                          .isUser ==
                                      true
                                  ? successColor
                                  : blackColor),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: AutoSizeText.rich(TextSpan(
                            text:
                                '${controller.selectedPeriod.value == 'weekly' ? (controller.leaderboardModelWeekly[index].point) : (controller.leaderboardModelMonthly[index].point)} Poin',
                            style: tsBodySmallSemibold(whiteColor))),
                      )
                    ],
                  ),
                );
                //     }
                //   },
                // );
              },
            );
          }
        })
      ],
    );
  }
}
