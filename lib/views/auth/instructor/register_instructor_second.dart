import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_second_controller.dart';

import '../../../constants/constants_utils.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../../custom_widgets/header_image.dart';

class RegisterInstructorSecondScreen
    extends GetView<InstructorRegisterSecondController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.instructorSignUpFormKeySecond,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderImage(label: 'Become an \nInstructor'),
                _getHeaderArrowView(),
                _getTypeTextField(),
                _getRegNumberTextField(),
                _getCompanyWebsiteTextField(),
                _getNextButton(),
                _getBackButton(),
                _getLogin(),
              ],
            ),
          ),
        ),
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

  Widget _getNextButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 50),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.checkNextButtonSecond();
/*          print("Second Screen: ${Get.arguments}");
          Get.toNamed(RoutesConstant.getRouteRegisterInstructorThird(),
          arguments: "${Get.arguments}");*/
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Next",
          style: TextStyle(fontSize: 18.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _getCompanyWebsiteTextField() {
    return Obx(
      () => SizedBox(
        child: controller.selectedType.value == "Company"
            ? Container(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Medium"),
                  textInputAction: TextInputAction.next,
                  decoration: ConstantUtils.styleInputDecoration(
                      "Company Website (if any)"),
                  keyboardType: TextInputType.text,
                  controller: controller.websiteController,
                  onSaved: (value) {
                    controller.websiteCompany = value!;
                  },
                ),
              )
            : Container(
                height: 10,
              ),
      ),
    );
  }

  Widget _getRegNumberTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: Obx(
        () => TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: controller.selectedType.value == "Company"
              ? ConstantUtils.styleInputDecoration("Registration Number")
              : ConstantUtils.styleInputDecoration("IC/Passport Number"),
          controller: controller.regNumberController,
          validator: (value) {
            return controller.validateRegNumber(value!);
          },
          onSaved: (value) {
            controller.regNumber = value!;
          },
          onChanged: (value) {
            controller.regNumber = value;
          },
        ),
      ),
    );
  }

  Widget _getTypeTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.none,
        controller: controller.typeController,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                _getBottomSheetView(),
                enableDrag: false,
              );
            },
            child: Icon(
              Icons.arrow_drop_down_sharp,
              size: 50,
              color: Color(0xFF262261),
            ),
          ),
          labelText: "Company/Individual",
          labelStyle: TextStyle(color: Color(0xFF262261)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
          ), //  border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _getBottomSheetView() {
    return Container(
      color: Colors.white,
      height: 250,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              "Type",
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Bold",
                  fontWeight: FontWeight.bold),
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
          ListView.separated(
            itemCount: controller.selectedBottomItem.value.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.checkedBottomItemColor(index);
                  controller.addTextFormFields(
                      controller.selectedBottomItem.value[index]);
                  controller.checkedBottomSheetItem(
                      controller.selectedBottomItem.value[index]);
                  print(controller.selectedBottomItem.value[index]);
                },
                child: Obx(
                  () => ListTile(
                    title: Text(
                      controller.selectedBottomItem.value[index],
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular",
                      ),
                    ),
                    trailing: controller.selectedIndex.value == index
                        ? Icon(
                            Icons.check,
                            color: Colors.red,
                            size: 25,
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
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
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                  color: Colors.white,
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
                    color: Colors.grey,
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
