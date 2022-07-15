import 'package:get/get.dart';

import '../../controllers/more/privacy_policy_page_controller.dart';

class PrivacyPolicyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PrivacyPolicyPageController>(PrivacyPolicyPageController());
  }
}
