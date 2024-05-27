import 'package:flutter/cupertino.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class PointReport extends StatelessWidget {
  final String point;
  // final Color pointColor;

  const PointReport({super.key, required this.point});

  @override
  Widget build(BuildContext context) {

    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      width: width * 0.16,
      height: height * 0.044,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: point == 'A'
              ? greenColor
              : point == 'B'
                  ? blueColor
                  : point == 'C'
                      ? warningColor
                      : primaryColor, 
      ),
      child: Text(
        point,
        style: tsBodySmallSemibold(whiteColor),
      ),
    );
  }
}
