import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show-statistic-current/show_statistic_bottom_tile_model.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show-statistic-current/show_statistic_current_model.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show-statistic-current/show_statistic_current_response.dart';
import 'package:fun_education_app/app/api/tugas-user/service/tugas_user_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  RxBool isLoading = true.obs;
  late AuthenticationService authenticationService;

  RxInt touchedIndex = (-1).obs;

  TugasUserService tugasUserService = TugasUserService();
  ShowStatisticCurrentResponse? showStatisticCurrentResponse;
  RxList<ShowStatisticCurrentModel> showStatisticCurrentModel =
      <ShowStatisticCurrentModel>[].obs;
  RxList<ShowStatisticBottomTitleModel> showStatisticBottomTitleModel =
      <ShowStatisticBottomTitleModel>[].obs;

  var spots = <FlSpot>[].obs;
  var touchedTitle = <DateTime>[].obs;
  var bottomTitles = <String?>[].obs;
  var maxX = 0.0.obs;

  var selectedReportPoint = '5'.obs;

  @override
  void onInit() {
    super.onInit();
    update();
    showStatisticCurrentTugasUser();
    authenticationService = AuthenticationService();
  }

  Future showStatisticCurrentTugasUser() async {
    try {
      final response = await tugasUserService.getStatisticCurrentTugas(
        selectedReportPoint.value,
      );
      showStatisticCurrentResponse =
          ShowStatisticCurrentResponse.fromJson(response.data);
      showStatisticCurrentModel.value = showStatisticCurrentResponse!.data!;
      print(showStatisticCurrentModel);

      spots.value = showStatisticCurrentResponse!.data!
          .map((e) => FlSpot(
                showStatisticCurrentModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitle.value =
          showStatisticCurrentResponse!.data!.map((e) => e.date!).toList();
      bottomTitles.value = showStatisticCurrentResponse!.bottomTitle!
          .map((e) => e.date!)
          .toList();
      maxX.value = spots.length - 1.0;
      isLoading(false);
      update();
    } catch (e) {
      print('statistik error : $e');
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await authenticationService.logout();

      prefs.remove('token');

      Get.snackbar("Logout Success", "You have been logged out");
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      isLoading.value = true;
      Get.snackbar("Logout Failed", "Network Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  var selectedTime = 'Mingguan'.obs;
  void setSelectedTime(String period) {
    selectedTime.value = period;
  }

  static BarChartGroupData generateGroupData(
    int x,
    double laporan,
    double tugas, {
    bool isTouched = false,
    double width = 78,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: laporan,
          color: primaryColor,
          width: 16,
        ),
        BarChartRodData(
          fromY: laporan + 0.9,
          toY: laporan + 0.2 + tugas,
          color: blackColor,
          width: 16,
        ),
      ],
    );
  }

  final List<BarChartGroupData> mingguanData = [
    generateGroupData(0, 700, 360),
    generateGroupData(1, 600, 740),
    generateGroupData(2, 200, 500),
    generateGroupData(3, 550, 1000),
    generateGroupData(4, 230, 500),
    generateGroupData(5, 1000, 500),
    generateGroupData(6, 310, 500),
  ];

  final List<BarChartGroupData> bulananData = [
    generateGroupData(0, 200, 500),
    generateGroupData(1, 400, 1000),
    generateGroupData(2, 750, 500),
    generateGroupData(3, 350, 1000),
  ];
}
