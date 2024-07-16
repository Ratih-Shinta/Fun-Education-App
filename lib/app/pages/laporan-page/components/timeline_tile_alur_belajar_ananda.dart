import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileAlurBelajarAnanda extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isDone;
  final Widget endChild;
  final int number;

  const TimelineTileAlurBelajarAnanda({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isDone,
    required this.endChild,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      
      height: height * 0.12,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isDone ? primaryColor : greyColor.withOpacity(0.2),
          thickness: 4.5,
        ),
        indicatorStyle: IndicatorStyle(
          width: width * 0.115,
          height: height * 0.06,
          indicator: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone ? primaryColor : greyColor,
            ),
            child: Center(
              child: Text('${number}', style: tsBodyMediumSemibold(whiteColor)),
            ),
          ),
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
