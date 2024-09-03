import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            title,
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallSemibold(blackColor),
          ),
          count > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AutoSizeText(count > 9 ? "9 +" : count.toString(),
                      style: tsLabelLargeSemibold(whiteColor)),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
