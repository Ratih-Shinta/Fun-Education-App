import 'package:fun_education_app/app/pages/report-history-page/report_history_controller.dart';
import 'package:get/get.dart';

class ReportHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportHistoryController>(() => ReportHistoryController());
  }
}