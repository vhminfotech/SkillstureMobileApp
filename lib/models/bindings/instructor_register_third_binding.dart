import 'package:get/get.dart';
import '../../controllers/auth/instructor/instructor_register_third_controller.dart';


class InstructorRegisterBindingThird extends Bindings{
  @override
  void dependencies(){
    Get.put<InstructorRegisterThirdController>(InstructorRegisterThirdController());
  }
}