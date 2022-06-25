import 'package:get/get.dart';

import '../../controllers/auth/learner/register_controller.dart';


class RegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<RegisterController>(RegisterController());
  }
}