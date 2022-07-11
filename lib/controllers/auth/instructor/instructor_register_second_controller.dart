
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigation/routes_constant.dart';

class InstructorRegisterSecondController extends GetxController{

  GlobalKey<FormState> instructorSignUpFormKeySecond = GlobalKey<FormState>();

  late TextEditingController typeController,
      regNumberController,
      websiteController;

  Rx<String> name = Rx<String>("");
  Rx<String> email = Rx<String>("");
  Rx<String> mobile = Rx<String>("");
  Rx<String> password = Rx<String>("");
  Rx<String> address = Rx<String>("");
  Rx<String> socialProfile = Rx<String>("");

  var type = "";
  var regNumber = "";
  var websiteCompany = "NA";

  List<String> bottomSheetItem = ["Company", "Individual"];

  Rx<List<String>> selectedBottomItem = Rx<List<String>>([]);

  final bottomSheetIconVisible = Rx<bool>(false);

  final selectedIndex = RxInt(0);

  final selectedType = Rx<String>("Company");

  @override
  void onInit() {
    super.onInit();
    typeController  = TextEditingController();
    typeController.text = "Company";
    regNumberController  = TextEditingController();
    websiteController = TextEditingController();
    selectedBottomItem.value = bottomSheetItem;
    bottomSheetIconVisible.value = false;
    selectedIndex.value = 0;
    selectedType.value = "Company";
    name.value = Get.arguments[0]["name"];
    email.value = Get.arguments[1]["email"];
    mobile.value = Get.arguments[2]["mobile"];
    password.value = Get.arguments[3]["password"];
    address.value = Get.arguments[4]["address"];
    socialProfile.value = Get.arguments[5]["socialProfile"];
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    typeController.clear();
    regNumberController.clear();
    websiteController.clear();
  }


  String? validateRegNumber(String value){
    if(value.isEmpty){
      return "Please enter a number";
    }
    return null;
  }

  void checkNextButtonSecond(){
    final isValidated = instructorSignUpFormKeySecond.currentState!.validate();
    if (!isValidated) {
      return;
    }
    instructorSignUpFormKeySecond.currentState!.save();
    print(name.value);

    print(typeController.text);
    print(regNumber);
    Get.toNamed(RoutesConstant.getRouteRegisterInstructorThird(),
    arguments: [
        {"name": name.value},
        {"email": email.value},
        {"mobile": mobile.value},
        {"password": password.value},
        {"address": address.value},
        {"socialProfile": socialProfile.value},
        {"type": typeController.text.toString()},
        {"regNumber": regNumber},
        {"websiteCompany": websiteCompany},
        ]);
  }

  void checkedBottomSheetItem(String item){
    if (item.isEmpty){
      typeController.text = "Company";
    }
    typeController.text = item;
  }

  void checkedBottomItemColor(int index){
     selectedIndex.value = index;
  }

  void addTextFormFields(String value){
    selectedType.value = value;
  }

}