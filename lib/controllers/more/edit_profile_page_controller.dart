import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../constants/constants_utils.dart';
import '../../models/instructor_skills.dart';
import '../graphqlconfigs/graphql_provider.dart';
import '../graphqlconfigs/mutation_query.dart';

class EditProfilePageController extends GetxController{
  GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();
  late GraphQLClient _client;
  final loginData = GetStorage();
  final isRoleInstructor = Rx<bool>(false);
  late File certificateFile;

  late TextEditingController nameController,
      emailController,
      mobileController,
      addressController,
      socialProfileController,
      typeController,
      regNumberController,
      websiteController,
      introductionController,
      experienceController;

  var name = "";
  var email = "";
  var mobile = "";
  var address = "";
  var socialProfile = "";
  var type = "";
  var regNumber = "";
  var websiteCompany = "NA";
  var introduction = "";
  var experience = "";

  List<String> bottomSheetItem = ["Company", "Individual"];
  Rx<List<String>> selectedBottomItem = Rx<List<String>>([]);
  final bottomSheetIconVisible = Rx<bool>(false);
  final selectedIndex = RxInt(0);
  final selectedType = Rx<String>("Company");

  Rx<List<String>> areaValues = Rx<List<String>>([]);
  Rx<List<String>> teachingAreas = Rx<List<String>>([]);
  Rx<List<Widget>> widgetItemList = Rx<List<Widget>>([]);

  Rx<List<String>> selectedBottomSheetSkills = Rx<List<String>>([]);
  Rx<List<InstructorSkill>> getAddSkills = Rx<List<InstructorSkill>>([]);
  Rx<List<String>> getAddSkillsNew = Rx<List<String>>([]);
  Rx<String> userId = Rx<String>("");
  Rx<String> profilePicture = Rx<String>("");
  Rx<bool> profilePictureIndicator = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    isRoleInstructor.value = false;
    userRoleChecked();
    _client = graphqlProviderClass.clientToQuery();
    userId.value = loginData.read("userId");
    print("User Id ${userId.value}");
    getSkillList();
    getInstructorDetails();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    addressController = TextEditingController();
    socialProfileController = TextEditingController();
    typeController  = TextEditingController();
    typeController.text = "Company";
    regNumberController  = TextEditingController();
    websiteController = TextEditingController();
    selectedBottomItem.value = bottomSheetItem;
    bottomSheetIconVisible.value = false;
    selectedIndex.value = 0;
    selectedType.value = "Company";
    introductionController = TextEditingController();
    experienceController = TextEditingController();
    profilePictureIndicator.value = false;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    addressController.clear();
    socialProfileController.clear();
    typeController.clear();
    regNumberController.clear();
    websiteController.clear();
    introductionController.clear();
    experienceController.clear();
  }

  void userRoleChecked(){
    if(loginData.read("role") == "instructor"){
      isRoleInstructor.value = true;
      print(isRoleInstructor.toString());
    }else{
      isRoleInstructor.value = false;
      print(isRoleInstructor.toString());
    }
  }


  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter a name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter a email";
    } else if (!GetUtils.isEmail(value)){
      return "Invalid email address";
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Please enter a mobile";
    } else if (value.length < 8 || value.length > 14) {
      return "Invalid mobile number";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please enter an address";
    }
    return null;
  }

  String? validateSocialProfile(String value) {
    if (value.isEmpty) {
      return "Please enter a social profile";
    }
    return null;
  }

  String? validateRegNumber(String value){
    if(value.isEmpty){
      return "Please enter a number";
    }
    return null;
  }

  String? validateTextFormFields(String value, String field) {
    if (value.isEmpty) {
      return "Please enter a ${field}";
    }
    return null;
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

  void addChipItem(String value) {
    if (value.isEmpty) {
      return;
    } else if (teachingAreas.value.contains(value)) {
      teachingAreas.value.remove(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
    } else {
      teachingAreas.value.add(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
    }
  }

  void removeChipItem(int index) {
    teachingAreas.value.removeAt(index);
    teachingAreas.value = teachingAreas.value;
    teachingAreas.refresh();
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

  void getSkillList() async {
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getInstructorSkillList),
      ),
    );

    if (!result.hasException) {
      var list = result.data!["teachingAreaSkills"]["allChildSkillRes"];
      for (int i = 0; i < list.length; i++) {
        getAddSkills.value.add(
          InstructorSkill(
            list[i]["_id"],
            list[i]["childSkillName"],
          ),
        );
      }
    }
    for(int x=0; x<getAddSkills.value.length; x++){
      getAddSkillsNew.value.add(getAddSkills.value[x].skillName);
    }
    selectedBottomSheetSkills.value = getAddSkillsNew.value;
  }

  void getInstructorDetails() async {
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getInstructorData),
        variables: {
          "userId": userId.value,
        },
      ),
    );
    if(!result.hasException) {
      var teachingAreaFromJson = result
          .data!["getInstructorProfile"]["teachingArea"];
      List<String> teachingAreaList = List<String>.from(teachingAreaFromJson);
      print(result.toString());
      print(result.data);
      nameController.text = result.data!["getInstructorProfile"]["fullName"];
      emailController.text = result.data!["getInstructorProfile"]["email"];
      mobileController.text = result.data!["getInstructorProfile"]["mobile"];
      addressController.text = result.data!["getInstructorProfile"]["address"];
      socialProfileController.text =
      result.data!["getInstructorProfile"]["socialProfile"];
      typeController.text =
      result.data!["getInstructorProfile"]["companyOrInstructor"];
      regNumberController.text =
      result.data!["getInstructorProfile"]["registerNumber"];
      websiteController.text =
      result.data!["getInstructorProfile"]["companyWebsite"];
      introductionController.text =
      result.data!["getInstructorProfile"]["introduction"];
      experienceController.text =
      result.data!["getInstructorProfile"]["experience"];
      teachingAreas.value = teachingAreaList;
      if (result.data!["getInstructorProfile"]["profilePic"] == null) {
        profilePictureIndicator.value = false;
      } else {
        profilePictureIndicator.value = true;
        profilePicture.value = result.data!["getInstructorProfile"]["profilePic"];
      }
    }
  }

  void uploadProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      certificateFile = File(result.files.first.path!);
      var byteData = certificateFile.readAsBytesSync();
      var multipartSelectedFile = ConstantUtils.convertSelectedFile(
          byteData, result.files.first.name, result.files.first.extension!);

      QueryResult queryResult = await _client.mutate(
        MutationOptions(
          document: gql(MutationQuery().uploadProfile),
          variables: {
            "files": multipartSelectedFile,
          },
        ),
      );
      if(!queryResult.hasException){
        profilePictureIndicator.value = true;
        profilePicture.value = queryResult.data!["uploadProfilePic"]["uri"];
      }
    }
  }

  void updateProfileDetails() async{
      QueryResult queryResult = await _client.mutate(
        MutationOptions(
          document: gql(MutationQuery().updateProfileData),
          variables: {
            "userId": userId.value,
            "fullName": nameController.text.toString(),
            "email": emailController.text.toString(),
            "mobile": mobileController.text.toString(),
            "address": addressController.text.toString(),
            "socialProfile": socialProfileController.text.toString(),
            "companyOrInstructor": typeController.text.toString(),
            "registerNumber": regNumberController.text.toString(),
            "companyWebsite": websiteController.text.toString(),
            "introduction": introductionController.text.toString(),
            "experience": experienceController.text.toString(),
            "teachingArea": teachingAreas.value,
            "profilePic": profilePicture.value
          },
        ),
      );
      if(!queryResult.hasException){
        print("User Details Update...........");
        print(queryResult.data);
        Get.snackbar("Success", "Profile Data Updated Successfully");
      }
  }
}