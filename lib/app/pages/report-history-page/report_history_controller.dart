import 'dart:collection';

import 'package:fun_education_app/app/api/laporan-harian/models/show-current-available/event_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:table_calendar/table_calendar.dart';

class ReportHistoryPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  RxString userPermission = ''.obs;

  RxBool isLoading = true.obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;
  Rx<LinkedHashMap<DateTime, List<Event>>> events =
      LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    showCurrentLaporanHarian();
    ShowCurrentAvailable();
  }

  Future showCurrentLaporanHarian() async {
    try {
      showCurrentLaporanHarianModel.clear();
      userGrade.value = 0;
      userNote.value = '';
      userPermission.value = '';

      final response = await laporanHarianService.getShowCurrentLaporanHarian(
          '${DateFormat('yyyy-MM-dd').format(selectedDay.value)}');
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;
      userGrade.value = showCurrentLaporanHarianResponse!.totalPoint;
      userNote.value = showCurrentLaporanHarianResponse!.note ?? '';
      userPermission.value = showCurrentLaporanHarianResponse!.permission;
      isLoading(false);
      update();
    } catch (e) {
      print('laporan error :  $e');
    }
  }

  Future<void> ShowCurrentAvailable() async {
    try {
      final response = await laporanHarianService.getShowCurrentAvailable();
      final List<String> dateStrings = response.data['dates'].cast<String>();
      List<DateTime> showAvailableDate = dateStrings
          .map((date) => DateFormat('yyyy-MM-dd').parse(date))
          .toList();

      LinkedHashMap<DateTime, List<Event>> newEvents =
          LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      for (var date in showAvailableDate) {
        newEvents[date] = [Event('Laporan')];
      }

      events.value = newEvents;

      _updateSelectedEvents(DateTime.now());
    } catch (e) {
      print(e);
    }
  }

  void _updateSelectedEvents(DateTime day) {
    selectedDay.value = day;
    focusedDay.value = day;
  }

  Future<void> onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    await showCurrentLaporanHarian();
  }
}
