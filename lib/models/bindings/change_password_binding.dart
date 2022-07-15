import 'package:get/get.dart';

import '../../controllers/more/change_password_page_controller.dart';

class ChangePasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordPageController>(ChangePasswordPageController());
  }
}
