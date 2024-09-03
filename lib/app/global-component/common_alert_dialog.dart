import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  const CommonAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title,
        style: tsBodyMediumSemibold(blackColor),
      ),
      content: Text(
        content,
        style: tsBodySmallRegular(blackColor),
      ),
      actions: <Widget>[
        TextButton(
            style: TextButton.styleFrom(
              foregroundColor: whiteColor,
              backgroundColor: greyColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              cancelButtonText,
              style: tsBodySmallRegular(blackColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: whiteColor,
            backgroundColor: dangerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            confirmButtonText,
            style: tsBodySmallRegular(whiteColor),
          ),
          onPressed: onConfirm,
        ),
      ],
    );
  }
}