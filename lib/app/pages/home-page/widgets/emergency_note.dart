import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/api/catatan-darurat/models/file_catatan_darurat_model.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/pdf_viewer.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class EmergencyNote extends GetView<HomePageController> {
  const EmergencyNote({
    Key? key,
    required this.emergencyNote,
    required this.informationFile,
  }) : super(key: key);

  final String emergencyNote;
  final List<FileCatatanDaruratModel> informationFile;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Catatan :',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsBodySmallRegular(blackColor),
                ),
                SizedBox(height: height * 0.01),
                AutoSizeText(
                  '$emergencyNote',
                  group: AutoSizeGroup(),
                  style: tsBodySmallSemibold(blackColor),
                ),
              ],
            ),
            informationFile.isEmpty
                ? SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.03),
                      AutoSizeText(
                        'Surat Pemberitahuan:',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallRegular(blackColor),
                      ),
                      SizedBox(height: height * 0.01),
                      ListView.builder(
                        itemCount: informationFile.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                PdfViewer(
                                  url: informationFile[index]
                                      .file
                                      .toString(),
                                  fileName: informationFile[index].name!,
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: height * 0.007),
                              decoration: BoxDecoration(
                                color: whiteColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.017,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/icPdf.svg',
                                      height: height * 0.035,
                                    ),
                                    SizedBox(width: width * 0.025),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.6,
                                          child: AutoSizeText(
                                            '${informationFile[index].name}',
                                            group: AutoSizeGroup(),
                                            overflow: TextOverflow.ellipsis,
                                            style: tsBodySmallSemibold(
                                                blackColor),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.6,
                                          child: AutoSizeText(
                                            '${informationFile[index].file}',
                                            group: AutoSizeGroup(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: tsLabelLargeRegular(
                                                blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
