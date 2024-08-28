import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVisibleSignIn = true.obs;
  RxBool isVisibleSignInConfirm = true.obs;

  late TextEditingController fullNameController;
  late TextEditingController nicknameController;
  late TextEditingController emailController;
  late TextEditingController birthController;
  late TextEditingController addressController;
  late TextEditingController confirmPasswordController;
  late TextEditingController passwordController;

  late AuthenticationService authenticationService;
  late OTPService otpService;

  var fullName = ''.obs;
  var nickname = ''.obs;
  var email = ''.obs;
  var birth = ''.obs;
  var address = ''.obs;
  var shift = ''.obs;
  var password = ''.obs;
  var gender = ''.obs;

  @override
  void onInit() {
    fullNameController = TextEditingController();
    nicknameController = TextEditingController();
    emailController = TextEditingController();
    birthController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    authenticationService = AuthenticationService();
    otpService = OTPService();
    super.onInit();
  }

  String? validatePassword() {
    if (passwordController.text != confirmPasswordController.text) {
      return 'Password dan konfirmasi password harus sama.';
    }
    return null;
  }

  void saveRegisterValue() {
    fullName.value = fullNameController.text;
    nickname.value = nicknameController.text;
    email.value = emailController.text;
    birth.value = birthController.text;
    address.value = addressController.text;
    shift.value = selectedShift.value;
    gender.value = selectedGender.value;
  }

  Future<void> register() async {
    try {
      final response = await authenticationService.register(
        fullName.value,
        nickname.value,
        email.value,
        birth.value,
        address.value,
        shift.value,
        password.value,
        gender.value,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

      Get.snackbar(
        "Success",
        "Registration successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.VERIFICATION_PAGE);
    } catch (e) {
      Get.snackbar(
        "Error",
        'Ananada sudah terdaftar, silahkan login',
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final selectedShift = "08.00 - 10.00".obs;
  final shiftList = [
    "08.00 - 10.00",
    "10.00 - 11.30",
    "11.30 - 13.00",
    "13.00 - 14.00",
    "14.00 - 15.00",
  ];
  void setSelectedShift(String value) {
    selectedShift.value = value;
  }

  final selectedGender = "Laki - laki".obs;
  final genderList = [
    "Laki - laki",
    "Perempuan",
  ];
  void setSelectedGender(String value) {
    selectedGender.value = value;
  }

  Future<void> sendOTP() async {
    try {
      await otpService.storeSendOTP(
        email.value,
      );

      Get.snackbar(
        "Success",
        "Send OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
