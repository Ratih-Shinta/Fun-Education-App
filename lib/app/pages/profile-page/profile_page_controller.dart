import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/app/api/statistic/service/statistic_service.dart';
import 'package:fun_education_app/app/api/tugas/models/statistic_task_model.dart';
import 'package:fun_education_app/app/api/tugas/models/statistic_task_reponse.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  RefreshController refreshController = RefreshController();
  RxBool isLoading = true.obs;

  late AuthenticationService authenticationService;

  RxInt touchedIndex = (-1).obs;

  StatisticService statisticService = StatisticService();
  StatisticTaskResponse? showStatisticCurrentResponse;
  RxList<StatisticTaskModel> showStatisticCurrentModel =
      <StatisticTaskModel>[].obs;

  var spots = <FlSpot>[].obs;
  // var touchedTitle = <String?>[].obs;
  var touchedTitle = <DateTime?>[].obs;
  var bottomTitles = <String?>[].obs;
  var maxX = 0.0.obs;

  // var selectedPoints = '5'.obs;
  var selectedPoints = 'weekly'.obs;

  @override
  void onInit() {
    super.onInit();
    update();
    showStatisticCurrentTugasUser();
    authenticationService = AuthenticationService();
  }

  Future showStatisticCurrentTugasUser() async {
    try {
      isLoading(true);
      bottomTitles.clear();
      final response = await statisticService.getStatisticCurrentTugas(
        selectedPoints.value,
      );
      showStatisticCurrentResponse =
          StatisticTaskResponse.fromJson(response.data);
      showStatisticCurrentModel.value = showStatisticCurrentResponse!.data;

      spots.value = showStatisticCurrentModel
          .map((e) => FlSpot(
                showStatisticCurrentModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      // touchedTitle.value = showStatisticCurrentModel.map((e) => e.title!).toList();
      touchedTitle.value =
          showStatisticCurrentModel.map((e) => e.date!).toList();

      bottomTitles.value =
          List<String?>.generate(spots.length, (index) => null);

      for (var title in showStatisticCurrentResponse!.bottomTitle) {
        bottomTitles[title.bottomTitleCase!] = title.date;
      }

      maxX.value = spots.length - 1.0;
      isLoading(false);
      update();
    } catch (e) {
      print('statistik error : $e');
    }
  }

  Future<void> logout() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await authenticationService.logout();

      prefs.remove('token');
      isLoading(false);
      Get.snackbar(
        "Logout Success",
        "You have been logged out",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      isLoading.value = true;
      Get.snackbar(
        "Logout Failed",
        "Network Error" + e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
