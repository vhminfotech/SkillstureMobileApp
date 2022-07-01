import 'package:get/get.dart';

import '../../controllers/my_teaching/schedule_livestream_details_controller.dart';


class scheduleLivestreamDetailPageBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<ScheduleLivestreamDetailsController>(ScheduleLivestreamDetailsController());
  }
}