import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {

  final loginData = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void loginDetailsRemoved(){
    loginData.write("isLogged", false);
    loginData.remove("role");
    loginData.remove("userId");
    loginData.remove("loginToken");
  }

}