import 'package:get/get.dart';

import '../../controllers/course_list/second_list_controller.dart';


class SecondCourseListBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<SecondListController>(SecondListController());
  }
}