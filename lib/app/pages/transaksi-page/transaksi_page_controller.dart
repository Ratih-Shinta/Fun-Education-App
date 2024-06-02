import 'package:get/get.dart';

class TransaksiPageController extends GetxController {
  var expandedIndex = (-1).obs;

  void toggleExpansion(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }
}