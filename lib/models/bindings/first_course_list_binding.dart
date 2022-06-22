import 'package:get/get.dart';

import '../../controllers/course_list/first_list_controller.dart';

class FirstCourseListBinding extends Bindings{
  @override
  void dependencies(){
    //Get.lazyPut<FirstListController>(() => FirstListController());
    Get.put<FirstListController>(FirstListController());
  }
}