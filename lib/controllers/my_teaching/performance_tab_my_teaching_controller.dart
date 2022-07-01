import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/performance_livestream_model_list.dart';
import '../../models/performance_livestream_model.dart';

class PerformanceTabMyTeachingController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController performanceTabControllerFirst;

  Rx<List<TeachingPerformanceLiveStreamModel>> performanceLiveStreamModel =
  Rx<List<TeachingPerformanceLiveStreamModel>>([]);

  @override
  void onInit() {
    super.onInit();
    performanceTabControllerFirst = TabController(length: 3, vsync: this);
    performanceLiveStreamModel.value = performanceLivestreamList;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    performanceTabControllerFirst.dispose();
  }
}
