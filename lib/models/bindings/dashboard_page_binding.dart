import 'package:get/get.dart';
import 'package:skillsture_project/controllers/dashboard/dashboard_page_controller.dart';
import 'package:skillsture_project/controllers/home/home_page_controller.dart';
import 'package:skillsture_project/controllers/more/more_page_controller.dart';
import 'package:skillsture_project/controllers/my_learning/my_learning_controller.dart';
import 'package:skillsture_project/controllers/my_teaching/my_teaching_controller.dart';
import 'package:skillsture_project/controllers/search/search_controller.dart';

class DashBoardPageBinding extends Bindings {
  @override
  void dependencies(){
    Get.put<DashboardPageController>(DashboardPageController());
    Get.put<HomePageController>(HomePageController());
    Get.put<SearchPageController>(SearchPageController());
    Get.put<MyTeachingPageController>(MyTeachingPageController());
    Get.put<MyLearningPageController>(MyLearningPageController());
    Get.put<MorePageController>(MorePageController());
  }
}