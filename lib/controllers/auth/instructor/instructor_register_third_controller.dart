import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigation/routes_constant.dart';

class InstructorRegisterThirdController extends GetxController {
  GlobalKey<FormState> instructorSignUpFormKeyThird = GlobalKey<FormState>();

  late TextEditingController introductionController,
      experienceController,teachingAreaController;

  Rx<String> name = Rx<String>("");
  Rx<String> email = Rx<String>("");
  Rx<String> mobile = Rx<String>("");
  Rx<String> password = Rx<String>("");
  Rx<String> address = Rx<String>("");
  Rx<String> socialProfile = Rx<String>("");
  Rx<String> type = Rx<String>("");
  Rx<String> regNumber = Rx<String>("");
  Rx<String> websiteCompany = Rx<String>("");

  var introduction = "";
  var experience = "";

  final isAgree = Rx<bool>(false);

  Rx<List<String>> areaValues = Rx<List<String>>([]);

  Rx<List<String>> teachingAreas = Rx<List<String>>([]);
  Rx<List<Widget>> widgetItemList = Rx<List<Widget>>([]);

  Rx<String> instructorRole = Rx<String>("");

  @override
  void onInit() {
    super.onInit();
    introductionController = TextEditingController();
    experienceController = TextEditingController();
    teachingAreaController = TextEditingController();
    isAgree.value = false;
/*    instructorRole.value = "${Get.arguments}";
    print("Third Page");
    print("${Get.arguments}");*/
    name.value = Get.arguments[0]["name"];
    email.value = Get.arguments[1]["email"];
    mobile.value = Get.arguments[2]["mobile"];
    password.value = Get.arguments[3]["password"];
    address.value = Get.arguments[4]["address"];
    socialProfile.value = Get.arguments[5]["socialProfile"];
    type.value = Get.arguments[6]["type"];
    regNumber.value = Get.arguments[7]["regNumber"];
    websiteCompany.value = Get.arguments[8]["websiteCompany"];
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    introductionController.dispose();
    experienceController.dispose();
    teachingAreaController.dispose();
  }

  void checkNextButtonThird(){
    final isValidated = instructorSignUpFormKeyThird.currentState!.validate();
    if (isValidated) {
      if (isAgree.value == true) {
        instructorSignUpFormKeyThird.currentState!.save();
        print(name.value);
        print(email.value);
        print(mobile.value);
        print(password.value);
        print(address.value);
        print(socialProfile.value);
        print(type.value);
        print(regNumber.value);
        print(websiteCompany.value);
        print(introduction);
        print(experience);
        print(teachingAreas.value.toString());
        Get.defaultDialog(
          title: "",
          titleStyle: TextStyle(fontSize: 1.0),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/astronaut@2x.png',
                  height: 110,
                  width: 110,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Thank you! We got \nyour application.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Cocogoose-Regular",
                    color: Color(0xFF262261),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Thank you for signing up as an instructor. We will review your submission and once approved we will notify you through email. As for now you can log in as a learner to explore SKILLSTURE.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 15.0,
                      fontFamily: "Comfortaa-Regular",
                      color: Color(0xFF262261),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: 70,
                  child: RaisedButton(
                    color: const Color(0xFFF05A28),
                    textColor: Colors.white,
                    elevation: 1.0,
                    onPressed: () {
                      print("Third Screen Dialog Box");
                      Get.toNamed(RoutesConstant.routeFirstCourseList,
                          arguments: "instructor"/*[
                            {"name": name.value},
                            {"email": email.value},
                            {"mobile": mobile.value},
                            {"password": password.value},
                            {"address": address.value},
                            {"socialProfile": socialProfile.value},
                            {"type": type.value},
                            {"regNumber": regNumber.value},
                            {"websiteCompany": websiteCompany.value},
                            {"introduction": introduction},
                            {"experience": experience},
                            {"teachingAreas": teachingAreas.value.toString()},
                          ]*/);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Text(
                      "OK",
                      style: const TextStyle(
                          fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    /*    Get.toNamed(RoutesConstant.getRouteFirstCourseList(),
            arguments: [
              {"name": name.value},
              {"email": email.value},
              {"mobile": mobile.value},
              {"password": password.value},
              {"address": address.value},
              {"socialProfile": socialProfile.value},
              {"type": type.value},
              {"regNumber": regNumber.value},
              {"websiteCompany": websiteCompany.value},
              {"introduction": introduction},
              {"experience": experience},
              {"teachingAreas": teachingAreas.value.toString()},
            ]);*/
      }else {
        print("Please accept the terms & conditions");
        Get.snackbar("Error", "Please accept the terms & conditions",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  String? validateTextFormFields(String value, String field){
    if(value.isEmpty){
      return "Please enter a ${field}";
    }
    return null;
  }

  void isTermsAgreed(){
    isAgree.value = !isAgree.value;
  }

  void addChipItem(String value){
    if(value.isEmpty){
      print(value);
      return;
    }else if(teachingAreas.value.contains(value)){
      Get.snackbar("Error", "Teaching area already exit", snackPosition: SnackPosition.BOTTOM);
      return;
    }else{
        teachingAreas.value.add(value);
        teachingAreaController.clear();
        teachingAreas.value = teachingAreas.value;
        teachingAreas.refresh();
        print(teachingAreas.value);

    }
  }

  void removeChipItem(int index){
      teachingAreas.value.removeAt(index);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
      print(teachingAreas.value);
  }
}