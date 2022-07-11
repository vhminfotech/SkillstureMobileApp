import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skillsture_project/constants/constants_utils.dart';
import 'package:skillsture_project/controllers/auth/learner/register_controller.dart';
import '../../../constants/country_list.dart';
import '../../../controllers/graphqlconfigs/mutation_query.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../../custom_widgets/fullScreenDialog.dart';
import '../../custom_widgets/header_image.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.registerKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderImage(label: 'Get Started'),
                _getNameTextField(),
                _getEmailTextField(),
                _getMobileTextField(),
                _getPasswordTextField(),
                _getPasswordValidationField(),
                _getConfirmPasswordTextField(),
                _getTermsAndCondition(),
                _getSignUpMutation(),
                //_getSignUpButton(),
                _txtSignedInOption(),
                _getSocialButton(),
                _getLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSignUpMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registeredUser),
        onCompleted: (resultData) {
          if (resultData == null || resultData == "undefined") {
            print("Registered Failed");
            return;
          } else {
            print("Registered Token");
            controller.registerUserId.value = resultData["signupUser"]["userId"].toString();
            controller.registerRole.value = resultData["signupUser"]["role"].toString();
            controller.registerToken.value = resultData["signupUser"]["token"].toString();
            controller.registerDetailsStorage();
            Get.offNamed(
              RoutesConstant.getRouteFirstCourseList(),
            );
          }
        },
        onError: (errorData) {
          FullScreenDialog.cancelDialog();
          if(errorData!.linkException == null){
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
          Get.snackbar("Error", "Please check your connection",
              snackPosition: SnackPosition.BOTTOM);
          } else{
          Get.snackbar("Error", "Registration Failed",
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
          controller.checkSignUp(runMutation);
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

  Widget _getGoogleMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registeredGoogleUser),
        onCompleted: (resultData) {
          print("Registered : $resultData");
          if (resultData == null || resultData == "undefined") {
            print("Registered : $resultData");
            return;
          } else {
            print("Registered Token @@@@@@@@@@@@@@@@");
            print(resultData.toString());
            print(resultData["googleSignup"]);
            Get.offNamed(
              RoutesConstant.getRouteFirstCourseList(),
            );
          }
        },
        onError: (errorData) {
          FullScreenDialog.cancelDialog();
          if(errorData!.linkException == null){
            print("Registered Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
            print("Registered Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else{
            print("Registered Error: $errorData");
            Get.snackbar("Error", "Registration Failed",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
      builder: (runMutation, results) {
        return _googleButton(runMutation);
      },
    );
  }

  Widget _googleButton(RunMutation runMutation) {
    return RaisedButton(
      color: Colors.white,
      textColor: Colors.white,
      elevation: 1.0,
      onPressed: () {
        if (controller.isAgree.value == false) {
          print("Please accept the terms & conditions");
          Get.snackbar("Error", "Please accept the terms & conditions",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          controller.googleSignUpPressed(runMutation);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/ic_google.png',
            width: 18.0,
            height: 18.0,
          ),
          const Text(
            "Google",
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: "Comfortaa-Bold",
                color: Color(0xFF262261)),
          ),
        ],
      ),
    );
  }

  Widget _getFacebookMutation(){
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registeredFacebookUser),
        onCompleted: (resultData) {
          print("Registered : $resultData");
          if (resultData == null || resultData == "undefined") {
            print("Registered Failed");
            return;
          } else {
            print("Registered Token");
            print(resultData.toString());
            Get.offNamed(
              RoutesConstant.getRouteFirstCourseList(),
            );
          }
        },
        onError: (errorData) {
          FullScreenDialog.cancelDialog();
          if(errorData!.linkException == null){
            print("Registered Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
            print("Registered Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else{
            print("Registered Error: $errorData");
            Get.snackbar("Error", "Registration Failed",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
      builder: (runMutation, results) {
        return _facebookButton(runMutation);
      },
    );
  }

  Widget _facebookButton(RunMutation runMutation) {
    return RaisedButton(
      color: Colors.white,
      textColor: Colors.white,
      elevation: 1.0,
      onPressed: () {
        if (controller.isAgree.value == false) {
          print("Please accept the terms & conditions");
          Get.snackbar("Error", "Please accept the terms & conditions",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          controller.facebookSignUpPressed(runMutation);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/ic_facebook.png',
            width: 18.0,
            height: 18.0,
          ),
          const Text(
            "Facebook",
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: "Comfortaa-Bold",
                color: Color(0xFF262261)),
          ),
        ],
      ),
    );
  }

  Widget _getSocialButton() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 50,
              child: _getGoogleMutation(),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: _getFacebookMutation(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLogin() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Get.offAllNamed(
              RoutesConstant.getRouteLogin(),
            );
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

  Widget _txtSignedInOption() => Row(children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 25.0, right: 20.0),
              child: const Divider(
                color: Color(0xB3262261),
                height: 36,
              )),
        ),
        const Text("Or sign in with",
            style: TextStyle(
                color: Color(0xB3262261),
                fontSize: 14.0,
                fontFamily: "Comfortaa-Regular")),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 25.0),
              child: const Divider(
                color: Color(0xB3262261),
                height: 36,
              )),
        ),
      ],);

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
        onChanged: (value) {
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
        keyboardType: TextInputType.text,
        decoration: ConstantUtils.styleInputDecoration("Name"),
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
}
