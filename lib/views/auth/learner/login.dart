import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skillsture_project/controllers/auth/learner/login_controller.dart';
import '../../../constants/constants_utils.dart';
import '../../../controllers/graphqlconfigs/mutation_query.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../../custom_widgets/header_image.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.loginKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderImage(label: 'Welcome'),
                _getEmailTextField(),
                _getPasswordTextField(),
                _getForgotPasswordButton(),
                _getLoginMutation(),
                _txtSignedInOption(),
                _getSocialButton(),
                _getAccountRegister(),
                _getSignUpAsInstructor(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLoginMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().loginUser),
        onCompleted: (resultData) {
          print("Login : $resultData");
          if (resultData == null || resultData == "undefined") {
            print("Login Failed");
            return;
          } else {
            print("Login Token");
            print("@@@@@@@@@@@");
            print(resultData["login"]);
            print(resultData["login"]["userId"]);
            print(resultData["login"]["role"].toString());
            print(resultData["login"]["token"]);
            controller.loginUserId.value = resultData["login"]["userId"].toString();
            controller.loginRole.value = resultData["login"]["role"].toString();
            controller.loginToken.value = resultData["login"]["token"].toString();
            controller.loginDetailsStorage();
            Get.toNamed(
              RoutesConstant.getRouteHomePage(),
            );
          }
        },
        onError: (errorData) {
          if(errorData!.linkException == null){
            print("Login Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
            print("Login Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else{
            print("Login Error: $errorData");
            Get.snackbar("Error", "Invalid Credentials",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
      builder: (runMutation, results) {
        return _getLoginButton(runMutation);
      },
    );
  }

  Widget _getLoginButton(RunMutation runMutation) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.checkLogin(runMutation);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 18.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _getAccountRegister() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Get.toNamed(RoutesConstant.getRouteRegister());
          },
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: " Sign Up",
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

  Widget _getSignUpAsInstructor() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            print("login screen");
            Get.toNamed(RoutesConstant.getRouteRegisterInstructorFirst(),
                arguments: "instructor");
          },
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Want to become an instructor?",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: "\n        Sign up as Instructor",
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

  Widget _getGoogleMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registeredGoogleUser),
        onCompleted: (resultData) {
          if (resultData == null || resultData == "undefined") {
            print("Registered Failed");
            return;
          } else {
            print("Login Token @@@@@@@@@@@@@@@@");
            print(resultData.toString());
            print(resultData["googleSignup"]["token"]);
            Get.toNamed(
              RoutesConstant.getRouteHomePage(),
            );
          }
        },
        onError: (errorData) {
          if(errorData!.linkException == null){
            print("Login Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
            print("Login Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else{
            print("Login Error: $errorData");
            Get.snackbar("Error", "Invalid Credentials",
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
        controller.googleLoginPressed(runMutation);
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

  Widget _getFacebookMutation() {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationQuery().registeredFacebookUser),
        onCompleted: (dynamic resultData) {
          if (resultData == null || resultData == "undefined") {
            print("Login Failed");
            return;
          } else {
            print("Login Token");
            print(resultData.toString());
            Get.toNamed(
              RoutesConstant.getRouteHomePage(),
            );
          }
        },
        onError: (dynamic errorData) {
          if(errorData!.linkException == null){
            print("Login Error: $errorData");
            Get.snackbar("Error", errorData.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          }else if(errorData.linkException != null) {
            print("Login Error: $errorData");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else{
            print("Login Error: $errorData");
            Get.snackbar("Error", "Invalid Credentials",
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
        controller.facebookLoginPressed(runMutation);
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
      ]);

  Widget _getForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            Get.toNamed(
              RoutesConstant.getRouteForgotPassword(),
            );
/*            Get.toNamed(
              RoutesConstant.getRouteDashBoardPage(),
            );*/
          },
          child: Text(
            "Forget Password",
            style: const TextStyle(
                fontSize: 16.0,
                color: Color(0xB3262261),
                fontFamily: "Comfortaa-Medium"),
          ),
        ),
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
}