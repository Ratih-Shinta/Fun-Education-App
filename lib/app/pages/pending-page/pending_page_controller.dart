import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PendingPageController extends GetxController {
  RxBool isLoading = true.obs;
    RefreshController refreshController = RefreshController();

}