import 'package:get/get.dart';

import '../../controllers/auth/instructor/instructor_register_first_controller.dart';

class InstructorRegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<InstructorRegisterFirstController>(InstructorRegisterFirstController());
  }
}