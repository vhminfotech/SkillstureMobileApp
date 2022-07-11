import 'package:get/get.dart';

import '../../controllers/more/edit_profile_page_controller.dart';
import '../../controllers/more/more_page_controller.dart';
import '../../controllers/more/my_subscription_page_controller.dart';

class MoreTabPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MorePageController>(MorePageController());
    Get.put<EditProfilePageController>(EditProfilePageController());
    Get.put<MySubscriptionPageController>(MySubscriptionPageController());
  }
}