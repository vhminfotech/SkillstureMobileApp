import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/constants/constants_utils.dart';

import '../../navigation/routes_constant.dart';

class InstructorRegisterFirstController extends GetxController {

  GlobalKey<FormState> instructorSignUpFormKeyFirst = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      mobileController,
      passwordController,
      confirmPasswordController,
      addressController,
      socialProfileController;

  var name = "";
  var email = "";
  var mobile = "";
  var password = "";
  var confirmPassword = "";
  var address = "";
  var socialProfile = "";

  final passwordVisible = Rx<bool>(true);
  final confirmPasswordVisible = Rx<bool>(true);

  final isPasswordEightDigit = Rx<bool>(false);
  final isPasswordUpperAndLower = Rx<bool>(false);
  final isPasswordOneNumberSymbol = Rx<bool>(false);
  final isPasswordNotEmail = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    addressController = TextEditingController();
    socialProfileController = TextEditingController();
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

  }

  bool isPasswordToggle() {
    return passwordVisible.value = !passwordVisible.value;
  }

  bool isConfirmPasswordToggle() {
    return confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter a name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter a email";
    } else if (!GetUtils.isEmail(value)){
      return "Invalid email address";
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Please enter a mobile";
    } else if (value.length < 8 || value.length > 14) {
      return "Invalid mobile number";
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

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please enter an address";
    }
    return null;
  }

  String? validateSocialProfile(String value) {
    if (value.isEmpty) {
      return "Please enter a social profile";
    }
    return null;
  }

  void checkNextButtonFirst() {
    final isValidated = instructorSignUpFormKeyFirst.currentState!.validate();
    if (!isValidated) {
      return;
    }
    instructorSignUpFormKeyFirst.currentState!.save();
    print(name);
    print(email);
    print(mobile);
    print(password);
    print(confirmPassword);
    print(address);
    print(socialProfile);

    Get.toNamed(RoutesConstant.getRouteRegisterInstructorSecond(),
        arguments: [
          {"name": name},
          {"email": email},
          {"mobile": mobile},
          {"password": password},
          {"address": address},
          {"socialProfile": socialProfile},
        ]);
  }

  void onChangePassword(String password) {
    final upperLowerReg = RegExp(r'[A-Za-z]');
    final numberOrSymbol = RegExp(r'[!@#$%^&*_0-9]');

      if (password.length >= 8) {
        isPasswordEightDigit.value = true;
      }else{
        isPasswordEightDigit.value = false;
      }

      if (numberOrSymbol.hasMatch(password)) {
        isPasswordOneNumberSymbol.value = true;
      }else{
        isPasswordOneNumberSymbol.value = false;
      }

      if (upperLowerReg.hasMatch(password)) {
        isPasswordUpperAndLower.value = true;
      }else{
        isPasswordUpperAndLower.value = false;
      }

      if (password != email) {
        isPasswordNotEmail.value = true;
      }else{
        isPasswordNotEmail.value = false;
      }
  }
}
