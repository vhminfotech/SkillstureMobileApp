import 'package:get/get.dart';

import '../../models/schedule_livestream_model.dart';


class ScheduleLivestreamDetailsController extends GetxController{

  final getLiveStreamModel = Rxn<TeachingScheduleLiveStreamModel>();

  @override
  void onInit() {
    super.onInit();
    getLiveStreamModel.value = Get.arguments;
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