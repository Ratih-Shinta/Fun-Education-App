import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CameraAddPhoto extends StatelessWidget {
  const CameraAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 95,
          backgroundColor: opacityGreyColor,
        ),
        Positioned(
          bottom: 0,
          right: 7,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: secondaryColor,
            child: Icon(
              Icons.camera_alt,
              size: 18,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
