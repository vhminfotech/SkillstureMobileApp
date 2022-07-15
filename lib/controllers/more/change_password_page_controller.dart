import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordPageController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final registerData = GetStorage();

  late TextEditingController passwordController,
      confirmPasswordController,
      currentPasswordController;

  var currentPassword = "";
  var password = "";
  var confirmPassword = "";

  final passwordVisible = Rx<bool>(true);
  final confirmPasswordVisible = Rx<bool>(true);
  final currentPasswordVisible = Rx<bool>(true);

  final isPasswordEightDigit = Rx<bool>(false);
  final isPasswordUpperAndLower = Rx<bool>(false);
  final isPasswordOneNumberSymbol = Rx<bool>(false);
  final isPasswordNotEmail = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    currentPasswordController = TextEditingController();
    currentPasswordVisible.value = true;
    passwordVisible.value = true;
    confirmPasswordVisible.value = true;
    isPasswordEightDigit.value = false;
    isPasswordUpperAndLower.value = false;
    isPasswordOneNumberSymbol.value = false;
    isPasswordNotEmail.value = false;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.clear();
    confirmPasswordController.clear();
    currentPasswordController.clear();
  }

  bool isPasswordToggle() {
    return passwordVisible.value = !passwordVisible.value;
  }

  bool isConfirmPasswordToggle() {
    return confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  bool isCurrentPasswordToggle() {
    return currentPasswordVisible.value = !currentPasswordVisible.value;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter a name";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter a password";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Please enter a confirm password";
    } else if (value != password) {
      return "Invalid confirm password";
    }
    return null;
  }

  void onChangePassword(String password) {
    final upperLowerReg = RegExp(r'[A-Za-z]');
    final numberOrSymbol = RegExp(r'[!@#$%^&*_0-9]');

    if (password.length >= 8) {
      isPasswordEightDigit.value = true;
    } else {
      isPasswordEightDigit.value = false;
    }

    if (numberOrSymbol.hasMatch(password)) {
      isPasswordOneNumberSymbol.value = true;
    } else {
      isPasswordOneNumberSymbol.value = false;
    }

    if (upperLowerReg.hasMatch(password)) {
      isPasswordUpperAndLower.value = true;
    } else {
      isPasswordUpperAndLower.value = false;
    }

    if (password != "myemail") {
      isPasswordNotEmail.value = true;
    } else {
      isPasswordNotEmail.value = false;
    }
  }
}
