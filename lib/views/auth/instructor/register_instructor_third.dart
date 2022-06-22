import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_third_controller.dart';

import '../../../constants/constants_utils.dart';
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
                _getCertificationTextField(),
                _getTermsAndCondition(),
                _getSignUpButton(),
                _getBackButton(),
                _getLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCertificationTextField() {
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
                onPressed: () {},
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
              Icon(Icons.picture_as_pdf_outlined, color: Color(0x80262261),),
              const SizedBox(
                height: 10,
              ),
              Text("PDF file format only",style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0x80262261),
                  fontFamily: "Comfortaa-Medium"),),
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
          //controller.values.value.add(controller.teachingAreaController.text.toString());
          controller
              .addChipItem(controller.teachingAreaController.text.toString());
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

    for (int i = 0; i < controller.values.value.length; i++) {
      InputChip actionChip = InputChip(
        deleteIcon: const Icon(Icons.clear, color: Color(0xFF262261)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        labelPadding: const EdgeInsets.all(7),
        backgroundColor: const Color(0xFFFEEDC5),
        label: Text(
          controller.values.value[i],
          style: const TextStyle(
              fontSize: 18.0,
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
          TextFormField(
            style: const TextStyle(
                fontSize: 20.0,
                color: Color(0xFF262261),
                fontFamily: "Comfortaa-Medium"),
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
              ),
            ),
            controller: controller.teachingAreaController,
          ),
        ],
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
            Get.toNamed(RoutesConstant.getRouteLogin());
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

  Widget _getSignUpButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          //controller.checkNextButtonValidated();
          Get.toNamed(RoutesConstant.getRouteRegisterInstructorThird());
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
