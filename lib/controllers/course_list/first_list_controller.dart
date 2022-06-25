import 'package:get/get.dart';

import '../navigation/routes_constant.dart';

class FirstListController extends GetxController {

  final List<String> courseItems = [
    "Arts & Design",
    "Business",
    "Data Science",
    "Healthcare",
    "Music",
    "Advertising & Marketing",
    "Computer Science",
    "Information Technology",
    "Finance & Accounting",
    "Development",
    "Arts & Design1",
    "Business1",
    "Data Science1",
    "Healthcare1",
    "Music1",
    "Advertising & Marketing1",
    "Computer Science1",
    "Information Technology1",
    "Finance & Accounting1",
    "Development1",
  ];

  Rx<List<String>> searchCourse = Rx<List<String>>([]);

  Rx<List<String>> selectedCourse = Rx<List<String>>([]);

  Rx<String> roleInstructor = Rx<String>("");


  @override
  void onInit() {
    super.onInit();
    searchCourse.value = courseItems;
    selectedCourse.value = [];
    roleInstructor.value = "${Get.arguments}";
    print("First List");
    print("${Get.arguments}");
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void searchFirstListCourse(String courseTitle) {
    List<String> resultCourse = [];
    if (courseTitle.isEmpty) {
      resultCourse = courseItems;
    } else {
      resultCourse = courseItems
          .where((element) => element
              .toLowerCase()
              .contains(courseTitle.toLowerCase()))
          .toList();
    }
    searchCourse.value = resultCourse;
  }

  void selectedFirstListCourse(String CourseSelected){
    List<String> resultSelected = [];
    if(resultSelected.contains(CourseSelected)){
      resultSelected.remove(CourseSelected);
    }else{
      resultSelected.add(CourseSelected);
    }
    selectedCourse.value = resultSelected;
  }

  bool selectToChangeColour(String CourseColorChange){
   if(selectedCourse.value.contains(CourseColorChange)){
     return true;
   } else{
     return false;
   }
  }

  void removeFromBottomSheetList(String CourseRemove){
    selectedCourse.value.remove(CourseRemove);
    selectedCourse.value = selectedCourse.value;
    selectedCourse.refresh();
    print(CourseRemove);
  }

  void nextButtonPressed(){
    if(selectedCourse.value.isEmpty){
      Get.snackbar("Error", "Please select the course",snackPosition: SnackPosition.BOTTOM);
    }
    else{
      Get.toNamed(RoutesConstant.getRouteSecondCourseList(),
      arguments: roleInstructor.value.toString());
    }
  }

}
