import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skillsture_project/constants/constants_utils.dart';
import '../../../models/instructor_skills.dart';
import '../../graphqlconfigs/graphql_provider.dart';
import '../../graphqlconfigs/mutation_query.dart';
import '../../navigation/routes_constant.dart';

class InstructorRegisterThirdController extends GetxController {
  GlobalKey<FormState> instructorSignUpFormKeyThird = GlobalKey<FormState>();
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();
  late TextEditingController introductionController, experienceController;

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
  var certification = "";

  final isAgree = Rx<bool>(false);

  Rx<List<String>> areaValues = Rx<List<String>>([]);
  Rx<List<String>> teachingAreas = Rx<List<String>>([]);
  Rx<List<Widget>> widgetItemList = Rx<List<Widget>>([]);

  Rx<String> instructorRole = Rx<String>("");

  final registerUserId = Rx<String>("");
  final registerRole = Rx<String>("");
  final registerToken = Rx<String>("");

  final registerData = GetStorage();
  late File certificateFile;

  Rx<List<String>> selectedBottomSheetSkills = Rx<List<String>>([]);
  Rx<List<InstructorSkill>> getAddSkills = Rx<List<InstructorSkill>>([]);
  Rx<List<String>> getAddSkillsNew = Rx<List<String>>([]);

  @override
  void onInit() {
    super.onInit();
    getSkillList();
    introductionController = TextEditingController();
    experienceController = TextEditingController();
    isAgree.value = false;
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
    introductionController.clear();
    experienceController.clear();
  }

  void getSkillList() async {
    GraphQLClient _client = graphqlProviderClass.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getInstructorSkillList),
      ),
    );
    if (!result.hasException) {
      print(result.toString());
      print(result.data.toString());
      var list = result.data!["teachingAreaSkills"]["allChildSkillRes"];
      print("list:: "+list.length.toString());

      for (int i = 0; i < list.length; i++) {
        getAddSkills.value.add(
          InstructorSkill(
            list[i]["_id"],
            list[i]["childSkillName"],
          ),
        );
        print(getAddSkills.value[i].skillName);
      }
    }

    for(int x=0; x<getAddSkills.value.length; x++){
      getAddSkillsNew.value.add(getAddSkills.value[x].skillName);
    }
    print(getAddSkillsNew.toString());
    selectedBottomSheetSkills.value = getAddSkillsNew.value;
    print(selectedBottomSheetSkills.value.toString());
  }

  void registerDetailsStorage() {
    registerData.write("isLogged", true);
    registerData.write("role", registerRole.value);
    registerData.write("userId", registerUserId.value);
    registerData.write("loginToken", registerToken.value);
  }

  void checkNextButtonThird(RunMutation runMutation) {
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
        print(certification);

        runMutation(
          {
            "fullName": name.value,
            "email": email.value,
            "mobile": mobile.value,
            "password": password.value,
            "address": address.value,
            "socialProfile": socialProfile.value,
            "companyOrInstructor": type.value,
            "registerNumber": regNumber.value,
            "companyWebsite": websiteCompany.value,
            "introduction": introduction,
            "experience": experience,
            "teachingArea": teachingAreas.value,
            "certification": certification
          },
        );

        Get.defaultDialog(
          //TODO : Remove dialog from controller
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
                      Get.toNamed(
                        RoutesConstant.routeFirstCourseList,
                      );
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
      } else {
        print("Please accept the terms & conditions");
        Get.snackbar("Error", "Please accept the terms & conditions",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  String? validateTextFormFields(String value, String field) {
    if (value.isEmpty) {
      return "Please enter a ${field}";
    }
    return null;
  }

  void isTermsAgreed() {
    isAgree.value = !isAgree.value;
  }

  void addChipItem(String value) {
    if (value.isEmpty) {
      print(value);
      return;
    } else if (teachingAreas.value.contains(value)) {
      teachingAreas.value.remove(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
    } else {
      teachingAreas.value.add(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
      print(teachingAreas.value);
    }
  }

  void removeChipItem(int index) {
    teachingAreas.value.removeAt(index);
    teachingAreas.value = teachingAreas.value;
    teachingAreas.refresh();
    print(teachingAreas.value);
  }

  bool selectToChangeColour(String CourseColorChange) {
    if (teachingAreas.value.contains(CourseColorChange)) {
      return true;
    } else {
      return false;
    }
  }

  void searchSkills(String skillTitle) {
    List<String> resultCourse = [];
    if (skillTitle.isEmpty) {
      resultCourse = getAddSkillsNew.value;
    } else {
      resultCourse = getAddSkillsNew.value
          .where((element) =>
              element.toLowerCase().contains(skillTitle.toLowerCase()))
          .toList();
    }
    selectedBottomSheetSkills.value = resultCourse;
  }

  void uploadCertificatePressed(RunMutation runMutation) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var fileSelected = result.files.first;
      certificateFile = File(result.files.first.path!);
      var byteData = certificateFile.readAsBytesSync();
      var multipartSelectedFile = ConstantUtils.convertSelectedFile(
          byteData, result.files.first.name, result.files.first.extension!);
      print(fileSelected.name);
      print(fileSelected.size);
      print(fileSelected.extension);
      print(fileSelected.path);
      print(fileSelected.toString());

      runMutation(
        {
          "files": multipartSelectedFile,
        },
      );
    } else {
      // User canceled the picker
      print("Mutation Failed");
      print("Please select the file");
    }
  }
}
