import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';

class TransaksiPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiPageController>(() => TransaksiPageController());
  }
}