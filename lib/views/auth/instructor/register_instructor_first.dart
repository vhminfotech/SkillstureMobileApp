import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/constants/constants_utils.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_first_controller.dart';
import 'package:skillsture_project/controllers/navigation/routes_constant.dart';

import '../../../constants/country_list.dart';
import '../../custom_widgets/header_image.dart';

class RegisterInstructorFirstScreen extends GetView<InstructorRegisterFirstController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.instructorSignUpFormKeyFirst,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderImage(label: 'Become an \nInstructor'),
                _getHeaderArrowView(),
                _getNameTextField(),
                _getEmailTextField(),
                _getMobileTextField(),
                _getPasswordTextField(),
                _getPasswordValidationField(),
                _getConfirmPasswordTextField(),
                _getAddressTextField(),
                _getSocialProfileTextField(),
                SizedBox(height: 20),
                _getNextButton(),
                _getLogin(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPasswordValidationField() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          _rowPasswordField("contains at least 8 characters",
              controller.isPasswordEightDigit.value),
          _rowPasswordField("contains both lowercase and uppercase letters",
              controller.isPasswordUpperAndLower.value),
          _rowPasswordField("contains at least one number (0-9) or a symbol",
              controller.isPasswordOneNumberSymbol.value),
          _rowPasswordField("does not contain your email address",
              controller.isPasswordNotEmail.value),
        ],
      ),
    );
  }

  Widget _rowPasswordField(String label, bool passwordValidation) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        passwordValidation
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 20,
                ),
              )
            : const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 7,
                ),
              ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: ConstantUtils.styleTextStylePasswordTextField(),
        )
      ],
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

  Widget _getNextButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(20),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.checkNextButtonFirst();
          /*print("First Screen: ${Get.arguments}");
          Get.toNamed(RoutesConstant.getRouteRegisterInstructorSecond(),
          arguments: "${Get.arguments}" );*/
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Next",
          style: TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _getSocialProfileTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Social Profile"),
        keyboardType: TextInputType.text,
        controller: controller.socialProfileController,
        validator: (value) {
          return controller.validateSocialProfile(value!);
        },
        onSaved: (value) {
          controller.socialProfile = value!;
        },
      ),
    );
  }

  Widget _getAddressTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Address"),
        keyboardType: TextInputType.text,
        controller: controller.addressController,
        validator: (value) {
          return controller.validateAddress(value!);
        },
        onSaved: (value) {
          controller.address = value!;
        },
      ),
    );
  }

  Widget _getPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Obx(
        () => TextFormField(
          textInputAction: TextInputAction.next,
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: ConstantUtils.styleTextStyleTextField(),
            errorStyle: ConstantUtils.styleTextStyleErrorTextField(),
            suffixIcon: IconButton(
              icon: Icon(
                controller.passwordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xFF262261),
              ),
              onPressed: () {
                controller.isPasswordToggle();
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
          ),
          onChanged: (password) {
            controller.password = password;
            controller.onChangePassword(password);
          },
          obscureText: controller.passwordVisible.value,
          controller: controller.passwordController,
          validator: (value) {
            return controller.validatePassword(value!);
          },
          onSaved: (value) {
            controller.password = value!;
          },
        ),
      ),
    );
  }

  Widget _getConfirmPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Obx(
        () => TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            labelStyle: ConstantUtils.styleTextStyleTextField(),
            errorStyle: ConstantUtils.styleTextStyleErrorTextField(),
            suffixIcon: IconButton(
              icon: Icon(
                controller.confirmPasswordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xFF262261),
              ),
              onPressed: () {
                controller.isConfirmPasswordToggle();
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
          ),
          obscureText: controller.confirmPasswordVisible.value,
          controller: controller.confirmPasswordController,
          validator: (value) {
            return controller.validateConfirmPassword(value!);
          },
          onSaved: (value) {
            controller.confirmPassword = value!;
          },
          onChanged: (value) {
            controller.confirmPassword = value;
          },
        ),
      ),
    );
  }

  Widget _getMobileTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: <Widget>[
          Row(
            children: [
              CountryCodePicker(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Medium"),
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'MY',
                padding: EdgeInsets.only(right: 0, top: 5),
                flagWidth: 40,
                countryFilter: countryList,
                comparator: (a, b) => b.name!.compareTo(a.name.toString()),
                //Get the country information relevant to the initial selection
                onInit: (code) => print(
                    "on init ${code!.name} ${code.dialCode} ${code.name}"),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 40,
                color: Color(0xFF262261),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Medium"),
              textInputAction: TextInputAction.next,
              maxLength: 14,
              decoration: ConstantUtils.styleInputDecoration("Mobile"),
              keyboardType: TextInputType.number,
              controller: controller.mobileController,
              validator: (value) {
                return controller.validateMobile(value!);
              },
              onSaved: (value) {
                controller.mobile = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEmailTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: ConstantUtils.styleInputDecoration("Email"),
        controller: controller.emailController,
        validator: (value) {
          return controller.validateEmail(value!);
        },
        onSaved: (value) {
          controller.email = value!;
        },
        onChanged: (value){
          controller.email = value;
        },
      ),
    );
  }

  Widget _getNameTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Name"),
        keyboardType: TextInputType.text,
        controller: controller.nameController,
        validator: (value) {
          return controller.validateName(value!);
        },
        onSaved: (value) {
          controller.name = value!;
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
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                  color: Colors.white,
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
                    color: Colors.grey,
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
