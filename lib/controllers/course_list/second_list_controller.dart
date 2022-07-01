import 'package:get/get.dart';
import '../navigation/routes_constant.dart';

class SecondListController extends GetxController{


  final List<String> courseItemsSecond = [
    "Application Programming Interface",
    "Cloud Security",
    "Cloud Computing(Google Cloud)",
    "Cloud Computing(Microsoft Azure)",
    "Cloud Computing(Amazon Web Server)",
    "Digital Forensics",
    "Ethical Hacking",
    "Javascript",
    "Machine Learning",
    "Programming with python",
    "Advanced Application Programming Interface ",
    "Advanced Cloud Security",
    "Advanced Cloud Computing(Google Cloud)",
    "Advanced Cloud Computing(Microsoft Azure)",
    "Advanced Cloud Computing(Amazon Web Server)",
    "Advanced Digital Forensics",
    "Advanced Ethical Hacking",
    "Advanced Javascript",
    "Advanced Machine Learning",
    "Advanced Programming with python",
  ];

  Rx<List<String>> searchCourseSecond = Rx<List<String>>([]);

  Rx<List<String>> selectedCourseSecond = Rx<List<String>>([]);

  Rx<String> roleInstructorSecond = Rx<String>("");


  @override
  void onInit() {
    super.onInit();
    searchCourseSecond.value = courseItemsSecond;
    roleInstructorSecond.value = "${Get.arguments}";
    print("Second List");
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


  void searchSecondListCourse(String courseTitle) {
    List<String> resultCourse = [];
    if (courseTitle.isEmpty) {
      resultCourse = courseItemsSecond;
    } else {
      resultCourse = courseItemsSecond
          .where((element) => element
          .toLowerCase()
          .contains(courseTitle.toLowerCase()))
          .toList();
    }
    searchCourseSecond.value = resultCourse;
  }
  List<String> resultSelected = [];
  void selectedSecondListCourse(String CourseSelected){
    if(resultSelected.contains(CourseSelected)){
      resultSelected.remove(CourseSelected);
    } /*else if(resultSelected.length == 4){
      resultSelected = resultSelected;
    }*/ else {
      resultSelected.add(CourseSelected);
    }
    resultSelected = resultSelected;
    selectedCourseSecond.value = resultSelected;
    selectedCourseSecond.refresh();
  }

  bool selectToChangeColour(String CourseColorChange){
    if(selectedCourseSecond.value.contains(CourseColorChange)){
      return true;
    } else{
      return false;
    }
  }

  void removeFromBottomSheetList(String CourseRemove){
    selectedCourseSecond.value.remove(CourseRemove);
    selectedCourseSecond.value = selectedCourseSecond.value;
    selectedCourseSecond.refresh();
  }

  void nextButtonPressed(){
    if(selectedCourseSecond.value.isEmpty){
      Get.snackbar("Error", "Please select the course",snackPosition: SnackPosition.BOTTOM);
    }
    else{
      Get.toNamed(
        RoutesConstant.getRouteDashBoardPage(),
      arguments: roleInstructorSecond.value.toString(),);
    }
  }
}