import 'package:get/get.dart';
import 'package:skillsture_project/controllers/explore_skill/explore_skill_controller.dart';

class ExploreSkillBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<ExploreSkillsController>(ExploreSkillsController());
  }
}