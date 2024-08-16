import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailLaporanHarianController extends GetxController {
  RxBool isLoading = false.obs;
  RefreshController refreshController = RefreshController();
}
