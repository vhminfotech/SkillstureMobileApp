import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructorRegisterThirdController extends GetxController {
  GlobalKey<FormState> instructorSignUpFormKeyThird = GlobalKey<FormState>();

  late TextEditingController introductionController,
      experienceController,teachingAreaController;

  var introduction = "";
  var experience = "";

  final isAgree = Rx<bool>(false);

  Rx<List<String>> areaValues = Rx<List<String>>([]);

  Rx<List<String>> values = Rx<List<String>>([]);
  Rx<List<Widget>> widgetItemList = Rx<List<Widget>>([]);

  @override
  void onInit() {
    super.onInit();
    introductionController = TextEditingController();
    experienceController = TextEditingController();
    teachingAreaController = TextEditingController();
    isAgree.value = false;
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
    }else {
      values.value.add(value);
      teachingAreaController.clear();
      values.value = values.value;
      values.refresh();
      print(values.value);
    }
  }

  void removeChipItem(int index){
      values.value.removeAt(index);
      values.value = values.value;
      values.refresh();
      print(values.value);

  }
}