import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileAlurBelajarAnanda extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isDone;
  // final Widget endChild;

  const TimelineTileAlurBelajarAnanda({
    super.key,
    required this.isFirst,
    required this.isLast,
    // required this.endChild,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      height: height * 0.1,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isDone ? primaryColor : opacity20GreyColor,
          thickness: 6,
        ),
        indicatorStyle: IndicatorStyle(
          indicator: Container(
            height: height * 0.4,
            width: width * 0.4,
            decoration: BoxDecoration(
              color: isDone ? primaryColor : opacity20GreyColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              '1',
              style: tsBodyMediumSemibold(isDone ? whiteColor : blackColor),
            ),
          ),
          width: width * 0.1,
          color: isDone ? primaryColor : opacity20GreyColor,
        ),
        endChild: Container(
          constraints: const BoxConstraints(minWidth: 200),
          color: const Color(0xFFE8EAF6),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Alur Belajar Ananda'),
          ),
        ),
      ),
    );
  }
}
