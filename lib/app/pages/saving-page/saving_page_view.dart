import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_one.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_two.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/components/ajukan_pengeluaran_container.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SavingPageView extends GetView<SavingPageController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [SavingPageComponentOne(), SavingPageComponentTwo()],
          ),
        ));
  }
}
