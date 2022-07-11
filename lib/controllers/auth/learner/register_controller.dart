import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../views/custom_widgets/fullScreenDialog.dart';
import '../../navigation/routes_constant.dart';

class RegisterController extends GetxController {

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final registerData = GetStorage();

  late TextEditingController nameController,
      emailController,
      mobileController,
      passwordController,
      confirmPasswordController;

  var name = "";
  var email = "";
  var mobile = "";
  var password = "";
  var confirmPassword = "";

  final passwordVisible = Rx<bool>(true);
  final confirmPasswordVisible = Rx<bool>(true);

  final isPasswordEightDigit = Rx<bool>(false);
  final isPasswordUpperAndLower = Rx<bool>(false);
  final isPasswordOneNumberSymbol = Rx<bool>(false);
  final isPasswordNotEmail = Rx<bool>(false);

  final isAgree = Rx<bool>(false);

  final googleAccessTokenString = Rx<String>("");
  final facebookAccessTokenString = Rx<String>("");

  final registerUserId = Rx<String>("");
  final registerRole = Rx<String>("");
  final registerToken = Rx<String>("");

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
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
    } else if (!GetUtils.isEmail(value)) {
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

  void isTermsAgreed() {
    isAgree.value = !isAgree.value;
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

    if (password != email) {
      isPasswordNotEmail.value = true;
    } else {
      isPasswordNotEmail.value = false;
    }
  }

  void checkSignUp(RunMutation runMutation) {
    final isValidated = registerKey.currentState!.validate();
    if (isValidated) {
      if (isAgree.value == true) {
        registerKey.currentState!.save();
        print(name);
        print(email);
        print(mobile);
        print(password);
        print(confirmPassword);
        FullScreenDialog.showDialog();
        runMutation(
          {
            "fullName": name,
            "email": email,
            "mobile": mobile,
            "password": password
          },
        );
      } else {
        print("Please accept the terms & conditions");
        Get.snackbar("Error", "Please accept the terms & conditions",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void googleSignUpPressed(RunMutation runMutation) async {
    final googleUser = await GoogleSignIn(scopes: <String>['email']).signIn();
    FullScreenDialog.showDialog();

    /*try {*/
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print("Google Access Token");
      print(googleAuth?.accessToken);

      googleAccessTokenString.value = googleAuth!.accessToken.toString();

      runMutation(
        {
          "accessToken": googleAccessTokenString.value,
        },
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
     // FullScreenDialog.cancelDialog();
/*      Get.toNamed(
        RoutesConstant.getRouteHomePage(),
      );*/
    /*} catch (e) {
      print(e.toString());
      FullScreenDialog.cancelDialog();
      Get.snackbar("Exception", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(
        RoutesConstant.getRouteLogin(),
      );
    }*/
  }

  void facebookSignUpPressed(RunMutation runMutation) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    FullScreenDialog.showDialog();

    /*try {*/
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
      if (facebookAuthCredential.accessToken == null) {
        //FullScreenDialog.cancelDialog();
        Get.back();
      } else {

        print("Facebook Access Token");
        print(loginResult.accessToken!.token);

        facebookAccessTokenString.value = loginResult.accessToken!.token.toString();

        runMutation(
          {
            "accessToken": facebookAccessTokenString.value,
          },
        );

        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        //FullScreenDialog.cancelDialog();
/*        Get.toNamed(
          RoutesConstant.getRouteHomePage(),
        );*/
      }
    /*} catch (e) {
      print(e.toString());
      FullScreenDialog.cancelDialog();
      Get.snackbar("Exception", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(
        RoutesConstant.getRouteLogin(),
      );
    }*/
  }

  void registerDetailsStorage() {
    registerData.write("isLogged", true);
    registerData.write("role", registerRole.value);
    registerData.write("userId", registerUserId.value);
    registerData.write("loginToken", registerToken.value);
  }
}
