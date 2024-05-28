import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileAlurBelajarAnanda extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isDone;
  final Widget endChild;

  const TimelineTileAlurBelajarAnanda({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isDone,
    required this.endChild,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      height: height * 0.11,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isDone ? primaryColor : greyColor.withOpacity(0.5),
          thickness: 6,
        ),
        indicatorStyle: IndicatorStyle(
          iconStyle: IconStyle(
            iconData: Icons.check_rounded,
            color: isDone ? whiteColor : whiteColor,
            fontSize: 16,
          ),
          width: width * 0.08,
          color: isDone ? primaryColor : greyColor,
        ),
        endChild: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.015,
          ),
          child: endChild,
        ),
      ),
    );
  }
}

