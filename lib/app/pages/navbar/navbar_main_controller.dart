import 'package:get/get.dart';

class NavbarMainController extends GetxController {
  var selectedIndex = 0.obs;

  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}