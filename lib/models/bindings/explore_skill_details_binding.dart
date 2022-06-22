import 'package:get/get.dart';
import 'package:skillsture_project/controllers/explore_skill/explore_skill_details_controller.dart';

class ExploreSkillDetailsBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<ExploreSkillDetailsController>(ExploreSkillDetailsController());
  }
}