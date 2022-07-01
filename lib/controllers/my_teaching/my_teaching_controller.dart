import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/month_list.dart';

class MyTeachingPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final applicationApproved = Rx<bool>(false);

  Rx<List<String>> selectedBottomMonth= Rx<List<String>>([]);

  final bottomSheetIconVisible = Rx<bool>(false);

  final selectedIndex = RxInt(0);

  final selectedMonth = Rx<String>("January");

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    applicationApproved.value = true;
    selectedBottomMonth.value = MonthList;
    bottomSheetIconVisible.value = false;
    selectedIndex.value = 0;
    selectedMonth.value = "January";
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void checkedBottomMonthColor(int index){
    selectedIndex.value = index;
  }

  void selectedMonthFromBottom(String value){
    selectedMonth.value = value;
  }
}
