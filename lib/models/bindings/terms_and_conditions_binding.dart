import 'package:get/get.dart';
import 'package:skillsture_project/controllers/more/terms_and_condition_page_controller.dart';

class TermsAndConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TermsAndConditionPageController>(TermsAndConditionPageController());
  }
}
