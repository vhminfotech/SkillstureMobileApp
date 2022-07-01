import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/navigation/routes_constant.dart';

import '../../constants/schedule_livestream_model_list.dart';
import '../../models/schedule_livestream_model.dart';

class ScheduleTabMyTeachingController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController scheduleTabController;

  Rx<List<TeachingScheduleLiveStreamModel>> scheduleLiveStreamModel =
      Rx<List<TeachingScheduleLiveStreamModel>>([]);

  Rx<List<String>> selectedBottomStatus = Rx<List<String>>([]);

  final bottomSheetIconVisible = Rx<bool>(false);

  final selectedIndex = RxInt(0);

  final selectedStatus = Rx<String>("All Status");

  final List<String> StatusList = [
    "All Status",
    "Ongoing",
    "Upcoming",
    "Past",
  ];

  Rx<List<TeachingScheduleLiveStreamModel>> searchTypedField =
      Rx<List<TeachingScheduleLiveStreamModel>>([]);

  @override
  void onInit() {
    super.onInit();
    searchTypedField.value = [];
    scheduleTabController = TabController(length: 2, vsync: this);
    scheduleLiveStreamModel.value = liveStreamModelList;
    selectedBottomStatus.value = StatusList;
    bottomSheetIconVisible.value = false;
    selectedIndex.value = 0;
    selectedStatus.value = "All Status";
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scheduleTabController.dispose();
  }

  void searchLivestream(String title) {
    List<TeachingScheduleLiveStreamModel> resultCourse = [];
    if (title.isEmpty) {
      resultCourse = liveStreamModelList;
    } else {
      resultCourse = liveStreamModelList
          .where((element) => element.liveStreamTitle
              .toLowerCase()
              .contains(title.toLowerCase()))
      .toList()
/*          ..where((element) => element.liveStreamStatus
              .toLowerCase()
              .contains(courseTitle.toLowerCase()))
          .toList()*/;
    }
    scheduleLiveStreamModel.value = resultCourse;
    print(scheduleLiveStreamModel.value.toString());
  }

  void detailsButtonPressed(TeachingScheduleLiveStreamModel model) {
    Get.toNamed(RoutesConstant.getRouteLivestreamDetailPage(),
        arguments: model);
  }

  void checkedBottomStatusColor(int index) {
    selectedIndex.value = index;
  }

  void selectedMonthFromBottom(String value) {
    selectedStatus.value = value;
    List<TeachingScheduleLiveStreamModel> resultCourse = [];
    if (value.isEmpty) {
      resultCourse = liveStreamModelList;
    } else if (value == "All Status"){
      resultCourse = liveStreamModelList;
    } else{
      resultCourse = liveStreamModelList
          .where((element) => element.liveStreamStatus
          .toLowerCase()
          .contains(value.toLowerCase()))
          .toList();
    }
    scheduleLiveStreamModel.value = resultCourse;
    print(scheduleLiveStreamModel.value.toString());
  }
}
