import 'package:get/get.dart';


class ExploreSkillsController extends GetxController{

  final List<String> skillList = [
    "Civil Engineering",
    "Computer Engineering",
    "Electrical Engineering",
    "Mechanical Engineering",
    "Cyber Law",
    "Taxation Law",
    "Labour Law",
    "Intellectual Property Rights",
    "Human Rights",
    "General Nursing",
    "Child Health",
    "Women Health",
    "Obstetrics",
    "Interior Design",
    "Fashion Design",
    "Textile Design",
    "Aeronautical Engineering",
    "Doctor of Philosophy",
    "Account based Marketing",
    "Accounting",
    "Adobe Suites",
    "Agile Business Analysis",
    "Animation",
    "Application Programming Interface",
    "B2B Sales",
    "Booking Keeping",
    "Branding",
  ];

  Rx<List<String>> searchSkill = Rx<List<String>>([]);


  @override
  void onInit() {
    super.onInit();
    searchSkill.value = skillList;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}