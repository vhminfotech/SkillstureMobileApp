
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructorRegisterSecondController extends GetxController{

  GlobalKey<FormState> instructorSignUpFormKeySecond = GlobalKey<FormState>();

  late TextEditingController typeController,
      regNumberController,
      websiteController;

  var type = "";
  var regNumber = "";
  var websiteCompany = "";

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
  }

  @override
  void onReady() async {
    super.onReady();
  }

  String? validateRegNumber(String value){
    if(value.isEmpty){
      return "Please enter a number";
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    typeController.dispose();
    regNumberController.dispose();
    websiteController.dispose();
  }

  void checkNextButtonValidated(){
    final isValidated = instructorSignUpFormKeySecond.currentState!.validate();
    if (!isValidated) {
      return;
    }
    instructorSignUpFormKeySecond.currentState!.save();
    print(type);
    print(regNumber);
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