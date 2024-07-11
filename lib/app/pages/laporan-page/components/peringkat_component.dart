import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat_component_two.dart';

class PeringkatComponent extends StatelessWidget {
  PeringkatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [PeringkatComponentOne(), PeringkatComponentTwo()],
      ),
    );
  }
}
