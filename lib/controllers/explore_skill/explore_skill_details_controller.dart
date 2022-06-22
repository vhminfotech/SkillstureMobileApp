import 'package:get/get.dart';

class ExploreSkillDetailsController extends GetxController{

  final List<String> relevantSkillList = [
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

  Rx<List<String>> relevantSkill = Rx<List<String>>([]);


  @override
  void onInit() {
    super.onInit();
    relevantSkill.value = relevantSkillList;
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