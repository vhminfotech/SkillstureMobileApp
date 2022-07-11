import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_third_controller.dart';
import '../../../constants/constants_utils.dart';
import '../../../controllers/graphqlconfigs/mutation_query.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../../custom_widgets/header_image.dart';

class RegisterInstructorThirdScreen
    extends GetView<InstructorRegisterThirdController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.instructorSignUpFormKeyThird,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderImage(label: 'Become an \nInstructor'),
                _getHeaderArrowView(),
                _getIntroductionTextField(),
                _getExperienceTextField(),
                _getTeachingAreaTextField(),
                _getCertificateUploadMutation(),
                //_getCertificationTextField(),
                _getTermsAndCondition(),
                _getSignUpInstructorMutation(),
                //_getSignUpButton(),
                _getBackButton(),
                _getLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCertificateUploadMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().uploadCertificate),
        onCompleted: (resultData) {
          if (resultData == null || resultData == "undefined") {
            print("Upload Failed");
            return;
          } else {
            print("Certificate URL");
            print("!!!!!!!!!!!!!!!!");
            print(resultData["uploadFile"]["uri"]);
            controller.certification =
                resultData["uploadFile"]["uri"].toString();
            print(resultData.toString());
          }
        },
        onError: (errorData) {
          if (errorData!.linkException == null) {
            print("Certificate Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          } else if (errorData.linkException != null) {
            print("Certificate Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else {
            print("Certificate Error: $errorData");
            Get.snackbar("Error", "Upload Failed",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
      builder: (runMutation, results) {
        return _getCertificationTextField(runMutation);
      },
    );
  }

  Widget _getSignUpInstructorMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registerAsInstructor),
        onCompleted: (resultData) {
          if (resultData == null || resultData == "undefined") {
            print("Instructor Registration Failed");
            return;
          } else {
            print("Instructor Registration Token");
            print("!!!!!!!!!!!!!!!!");
            print(resultData["signupInstructor"]["role"]);
            print(resultData["signupInstructor"]["token"]);
            print(resultData["signupInstructor"]["userId"]);
            controller.registerUserId.value =
                resultData["signupInstructor"]["userId"].toString();
            controller.registerRole.value =
                resultData["signupInstructor"]["role"].toString();
            controller.registerToken.value =
                resultData["signupInstructor"]["token"].toString();
            controller.registerDetailsStorage();
          }
        },
        onError: (errorData) {
          if (errorData!.linkException == null) {
            print("Instructor Registration Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          } else if (errorData.linkException != null) {
            print("Instructor Registration Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else {
            print("Instructor Registration Error: $errorData");
            Get.snackbar("Error", "Instructor Registration Failed",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
      builder: (runMutation, results) {
        return _getSignUpButton(runMutation);
      },
    );
  }

  Widget _getSignUpButton(RunMutation runMutation) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.checkNextButtonThird(runMutation);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: 18.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _getCertificationTextField(RunMutation runMutation) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Certifications (if any)",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF262261),
                fontFamily: "Comfortaa-Medium"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  controller.uploadCertificatePressed(runMutation);
                },
                child: Container(
                  height: 40,
                  width: 110,
                  color: Colors.pink.shade50,
                  child: Center(
                    child: Text(
                      "Choose File",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Medium"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Icon(
                Icons.picture_as_pdf_outlined,
                color: Color(0x80262261),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "PDF file format only",
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Color(0x80262261),
                    fontFamily: "Comfortaa-Medium"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Color(0xFFFFB451),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChips() {
    List<Widget> chips = [
      TextButton(
        onPressed: () {
          Get.bottomSheet(
            _getStatusBottomSheet(),
            enableDrag: false,
          );
          //controller.values.value.add(controller.teachingAreaController.text.toString());
          /*controller
              .addChipItem(controller.teachingAreaController.text.toString());*/
        },
        child: const Text(
          "Add",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
              fontFamily: "Comfortaa-Regular"),
        ),
      ),
    ];

    for (int i = 0; i < controller.teachingAreas.value.length; i++) {
      InputChip actionChip = InputChip(
        deleteIcon: const Icon(Icons.clear, color: Color(0xFF262261)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        labelPadding: const EdgeInsets.all(5),
        backgroundColor: const Color(0xFFFEEDC5),
        label: Text(
          controller.teachingAreas.value[i],
          style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Regular"),
        ),
        onDeleted: () {
          controller.removeChipItem(i);
        },
      );
      chips.insert(0, actionChip);
    }
    return chips.map((e) => e).toList();
  }

  Widget _getStatusBottomSheet() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Add Skills",
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF262261),
                  fontFamily: "Cocogoose-Regular",
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: Color(0xFF262261),
                  size: 30,
                ),
              ),
            ),
            _getSearchView(),
            ListView.separated(
              itemCount: controller.selectedBottomSheetSkills.value.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //controller.checkedBottomStatusColor(index);
                    controller.addChipItem(controller
                        .selectedBottomSheetSkills.value[index]
                        .toString());
                    print(controller.teachingAreas.value);
                    print(controller.selectedBottomSheetSkills.value[index]);
                  },
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        controller.selectedBottomSheetSkills.value[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular",
                        ),
                      ),
                      trailing: controller.selectToChangeColour(
                              controller.selectedBottomSheetSkills.value[index])
                          ? Image.asset(
                              "assets/images/checkbox@2x.png",
                              //color: Colors.deepOrangeAccent,
                              height: 20,
                              width: 20,
                            )
                          : Container(
                              //color: Colors.deepOrangeAccent,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey.shade400,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTeachingAreaTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Teaching Area",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF262261),
                fontFamily: "Comfortaa-Medium"),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 8.0,
              children: buildChips(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Color(0xFFFFB451),
          ),
        ],
      ),
    );
  }

  Widget _getSearchView() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10.0, right: 20, bottom: 20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          controller.searchSkills(value);
        },
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black45,
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black45,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.black45,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black45,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTermsAndCondition() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      child: Column(
        children: [
          Row(children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: InkWell(
                onTap: () {
                  controller.isTermsAgreed();
                },
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xB3262261), width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: controller.isAgree.value
                        ? const Icon(Icons.check,
                            size: 17.0, color: Color(0xB3262261))
                        : const Icon(
                            null,
                            size: 17.0,
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "By signing up you have read and agree to the Skillsture ",
                      style: TextStyle(
                          color: Color(0xB3262261),
                          fontSize: 14.0,
                          fontFamily: "Comfortaa-Medium"),
                    ),
                    TextSpan(
                      text: "Term & Conditions",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFF05A28),
                          fontSize: 14.0,
                          fontFamily: "Comfortaa-Medium"),
                    )
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  Widget _getLogin() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Get.offAllNamed(RoutesConstant.getRouteLogin());
          },
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Color(0xFFF05A28),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                )
              ],
            ),
          ),
        ),
      );

  Widget _getBackButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: RaisedButton(
        color: Colors.white,
        elevation: 1.0,
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFFF05A28),
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Back",
          style: TextStyle(
              color: Color(0xFFF05A28),
              fontSize: 18.0,
              fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _getExperienceTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Experience"),
        keyboardType: TextInputType.text,
        controller: controller.experienceController,
        onSaved: (value) {
          controller.experience = value!;
        },
        validator: (value) {
          return controller.validateTextFormFields(value!, "experience");
        },
      ),
    );
  }

  Widget _getIntroductionTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration:
            ConstantUtils.styleInputDecoration("Introduction (About Yourself)"),
        keyboardType: TextInputType.text,
        controller: controller.introductionController,
        onSaved: (value) {
          controller.introduction = value!;
        },
        validator: (value) {
          return controller.validateTextFormFields(value!, "introduction");
        },
      ),
    );
  }

  Widget _getHeaderArrowView() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF05A28),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF05A28),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                  color: Color(0xFFF05A28),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF05A28),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                  color: Color(0xFFF05A28),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF05A28),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "1. Personal\n       Info",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
              ),
              Text(
                "2. Others",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
              Text(
                "3. Experience",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
