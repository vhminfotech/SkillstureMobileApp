import 'package:get/get.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_second_controller.dart';

class InstructorRegisterBindingSecond extends Bindings{
  @override
  void dependencies(){
    Get.put<InstructorRegisterSecondController>(InstructorRegisterSecondController());
  }
}