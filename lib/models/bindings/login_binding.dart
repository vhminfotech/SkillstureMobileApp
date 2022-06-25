import 'package:get/get.dart';
import 'package:skillsture_project/controllers/auth/learner/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies(){
   Get.put<LoginController>(LoginController());
  }
}