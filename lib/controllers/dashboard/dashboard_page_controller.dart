import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skillsture_project/views/home/ui/homepage.dart';
import 'package:skillsture_project/views/more/more_page.dart';
import 'package:skillsture_project/views/my_learning/my_learning_page.dart';
import 'package:skillsture_project/views/my_teaching/my_teaching_page.dart';
import 'package:skillsture_project/views/search/search_page.dart';

class DashboardPageController extends GetxController {

  final selectedItemIndex = Rx<int>(0);

  final isRoleInstructor = Rx<bool>(false);

  final loginData = GetStorage();


  @override
  void onInit() {
    super.onInit();
    selectedItemIndex.value = 0;
    isRoleInstructor.value = true;

/*    if("${Get.arguments}" == "instructor"){
      print("${Get.arguments}");
      isRoleInstructor.value = true;
      print(isRoleInstructor.toString());
    }else{
      print(isRoleInstructor.toString());
      isRoleInstructor.value = false;
    }*/
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void onItemTapped(int index){
    selectedItemIndex.value = index;
    update();
  }

  List<Widget> learnerNavigationScreens() {
    return <Widget>[
      HomePageScreen(),
      SearchPageScreen(),
      MyLearningPageScreen(),
      MorePageScreen(),
    ];
  }

  List<Widget> adminNavigationScreens() {
    return <Widget>[
      HomePageScreen(),
      SearchPageScreen(),
      MyTeachingPageScreen(),
      MyLearningPageScreen(),
      MorePageScreen(),
    ];
  }

}