import 'package:get/get.dart';

import '../../controllers/more/edit_profile_page_controller.dart';

class EditPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<EditProfilePageController>(EditProfilePageController());
  }
}