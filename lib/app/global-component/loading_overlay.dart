import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Stack(
        children: [
          child,
          Container(
            height: MediaQuery.of(context).size.height,
            color: blackColor.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }
      else {
        return child;
    }
    }
  }