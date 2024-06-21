import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';

class DetailTugasPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTugasPageController>(() => DetailTugasPageController());
  }
}