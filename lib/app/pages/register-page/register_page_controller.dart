import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  RxBool isVisibleSignIn = true.obs;

  final selectedShift = "Jam 08.00 - 10.00".obs;

  final shiftList = [
    "Jam 08.00 - 10.00",
    "Jam 10.00 - 11.30",
    "Jam 11.30 - 13.00",
    "Jam 13.00 - 14.00",
    "Jam 14.00 - 15.00",
  ];

  void setSelectedShift(String value) {
    selectedShift.value = value;
  }
}