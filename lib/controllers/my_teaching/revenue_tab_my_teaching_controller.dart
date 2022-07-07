import 'package:get/get.dart';

import '../../constants/schedule_livestream_model_list.dart';
import '../../models/schedule_livestream_model.dart';

class RevenueTabMyTeachingController extends GetxController{

  Rx<List<TeachingScheduleLiveStreamModel>> scheduleLiveStreamModel =
  Rx<List<TeachingScheduleLiveStreamModel>>([]);

  DateTime setDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    scheduleLiveStreamModel.value = liveStreamModelList;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}