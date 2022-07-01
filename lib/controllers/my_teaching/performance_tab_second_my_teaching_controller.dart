import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceTabSecondMyTeachingController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController performanceTabControllerSecond;


  @override
  void onInit() {
    super.onInit();
    performanceTabControllerSecond = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    performanceTabControllerSecond.dispose();
  }
}
