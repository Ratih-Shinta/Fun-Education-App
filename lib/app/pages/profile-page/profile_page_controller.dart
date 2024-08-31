import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_task_model.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_task_response.dart';
import 'package:fun_education_app/app/api/statistic/service/statistic_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  RefreshController refreshController = RefreshController();
  RxBool isLoading = true.obs;

  late AuthenticationService authenticationService;

  RxInt touchedIndex = (-1).obs;

  StatisticService statisticService = StatisticService();
  StatisticTaskResponse? statisticTaskResponse;
  RxList<StatisticTaskModel> statisticTaskModel = <StatisticTaskModel>[].obs;

  var spots = <FlSpot>[].obs;
  // var touchedTitle = <String?>[].obs;
  var touchedTitle = <DateTime?>[].obs;
  var bottomTitles = <String?>[].obs;
  var bottomTitlesMonthly = <String?>[].obs;
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
      bottomTitlesMonthly.clear();
      final response = await statisticService.getStatisticCurrentTugas(
        selectedPoints.value,
      );
      statisticTaskResponse = StatisticTaskResponse.fromJson(response.data);
      statisticTaskModel.value = statisticTaskResponse!.data;

      spots.value = statisticTaskModel
          .map((e) => FlSpot(
                statisticTaskModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitle.value = statisticTaskModel.map((e) => e.date!).toList();

      bottomTitles.value =
          List<String?>.generate(spots.length, (index) => null);
      bottomTitlesMonthly.value =
          List<String?>.generate(spots.length, (index) => null);

      for (var title in statisticTaskResponse!.bottomTitle) {
        bottomTitles[title.bottomTitleCase!] =
            convertToIndonesianDayAbbreviation(title.date!);
        bottomTitlesMonthly[title.bottomTitleCase!] =
            DateFormat('dd-MM').format(title.date!);
      }

      maxX.value = spots.length - 1.0;
      print('task model : $statisticTaskModel');
      update();
      isLoading(false);
    } catch (e) {
      print('task error ngetd : $e');
    }
  }

  String convertToIndonesianDayAbbreviation(DateTime dateTime) {
    String dayInEnglish = DateFormat('EEEE').format(dateTime);

    switch (dayInEnglish) {
      case 'Monday':
        return 'SEN';
      case 'Tuesday':
        return 'SEL';
      case 'Wednesday':
        return 'RAB';
      case 'Thursday':
        return 'KAM';
      case 'Friday':
        return 'JUM';
      case 'Saturday':
        return 'SAB';
      case 'Sunday':
        return 'MIN';
      default:
        return '';
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
