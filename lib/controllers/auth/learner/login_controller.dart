import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../views/custom_widgets/fullScreenDialog.dart';
import '../../graphqlconfigs/graphql_provider.dart';
import '../../graphqlconfigs/mutation_query.dart';
import '../../navigation/routes_constant.dart';


class LoginController extends GetxController {

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();
  late GraphQLClient _client;


  late TextEditingController emailController,
      passwordController;

  var email = "";
  var password = "";

  final passwordVisible = Rx<bool>(true);

  final googleAccessToken = Rx<String>("");
  final facebookAccessToken = Rx<String>("");

  final loginUserId = Rx<String>("");
  final loginRole = Rx<String>("");
  final loginToken = Rx<String>("");

  final loginData = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _client = graphqlProviderClass.clientToQuery();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisible.value = true;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }

  void loginDetailsStorage(){
    loginData.write("isLogged", true);
    loginData.write("role", loginRole.value);
    loginData.write("userId", loginUserId.value);
    loginData.write("loginToken", loginToken.value);
  }

  bool isPasswordToggle() {
    return passwordVisible.value = !passwordVisible.value;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter a email";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email address";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter a password";
    }
    return null;
  }

  void googleLoginPressed() async {
    final googleUser = await GoogleSignIn(scopes: <String>['email']).signIn();
    FullScreenDialog.showDialog();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      googleAccessToken.value = googleAuth!.accessToken.toString();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        document: gql(MutationQuery().registeredGoogleUser),
        variables: {
          "accessToken": googleAccessToken.value,
        },
      ),
    );
    if (!queryResult.hasException) {
      print("Google: ${queryResult}");
      if (queryResult.data!.isEmpty || queryResult == "undefined") {
        FullScreenDialog.cancelDialog();
        print("Google Login Failed");
        Get.snackbar("Error", "Invalid Credentials");
      } else {
        print("Google Login Token New");
        print("!!!!!!!!!!!!!");
        print(queryResult.data!["googleSignup"]);
        loginUserId.value = queryResult.data!["googleSignup"]["userId"].toString();
        loginRole.value = queryResult.data!["googleSignup"]["role"].toString();
        loginToken.value = queryResult.data!["googleSignup"]["token"].toString();
        loginDetailsStorage();
        Get.offNamed(
          RoutesConstant.getRouteDashBoardPage(),
        );
      }
    } else {
      FullScreenDialog.cancelDialog();
      print(queryResult.exception);
      if (queryResult.exception!.graphqlErrors.isNotEmpty) {
        print("Google Error1: $queryResult");
        Get.snackbar("Error", queryResult.exception!.graphqlErrors[0].message.toString(),
            snackPosition: SnackPosition.BOTTOM);
      } else if (queryResult.exception!.linkException != null) {
        print("Google Error2: $queryResult");
        Get.snackbar("Error", "Please check your connection",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print("Google Error3: ${queryResult}");
        Get.snackbar("Error", "Invalid Credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    }

      await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void facebookLoginPressed() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
      if (facebookAuthCredential.accessToken == null) {
        Get.back();
      } else {
        facebookAccessToken.value = loginResult.accessToken!.token.toString();
        QueryResult queryResult = await _client.mutate(
          MutationOptions(
            document: gql(MutationQuery().registeredFacebookUser),
            variables: {
              "accessToken": facebookAccessToken.value,
            },
          ),
        );
        if (!queryResult.hasException) {
          print("Facebook: ${queryResult}");
          if (queryResult.data!.isEmpty || queryResult == "undefined") {
            FullScreenDialog.cancelDialog();
            print("Facebook Login Failed");
            Get.snackbar("Error", "Invalid Credentials");
          } else {
            print("Facebook Login Token New");
            print("!!!!!!!!!!!!!");
            print(queryResult.data!["facebookSignup"]);
            loginUserId.value = queryResult.data!["facebookSignup"]["userId"].toString();
            loginRole.value = queryResult.data!["facebookSignup"]["role"].toString();
            loginToken.value = queryResult.data!["facebookSignup"]["token"].toString();
            loginDetailsStorage();
            Get.offNamed(
              RoutesConstant.getRouteDashBoardPage(),
            );
          }
        } else {
          FullScreenDialog.cancelDialog();
          print(queryResult.exception);
          if (queryResult.exception!.graphqlErrors.isNotEmpty) {
            print("Facebook Error1: $queryResult");
            Get.snackbar("Error", queryResult.exception!.graphqlErrors[0].message.toString(),
                snackPosition: SnackPosition.BOTTOM);
          } else if (queryResult.exception!.linkException != null) {
            print("Facebook Error2: $queryResult");
            Get.snackbar("Error", "Please check your connection",
                snackPosition: SnackPosition.BOTTOM);
          } else {
            print("Facebook Error3: ${queryResult}");
            Get.snackbar("Error", "Invalid Credentials",
                snackPosition: SnackPosition.BOTTOM);
          }
        }
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      }
  }

  void loginButtonPressed() async {
    final isValidated = loginKey.currentState!.validate();
    if (isValidated) {
      loginKey.currentState!.save();
      FullScreenDialog.showDialog();
      QueryResult queryResult = await _client.mutate(
        MutationOptions(
          document: gql(MutationQuery().loginUser),
          variables: {
            "email": email,
            "password": password
          },
        ),
      );
      if (!queryResult.hasException) {
        if (queryResult.data!.isEmpty || queryResult == "undefined") {
          FullScreenDialog.cancelDialog();
          print("Login Failed");
          Get.snackbar("Error", "Invalid Credentials");
        } else {
          print("Login Token New");
          print("!!!!!!!!!!!!!");
          print(queryResult.data!["login"]);
          loginUserId.value = queryResult.data!["login"]["userId"].toString();
          loginRole.value = queryResult.data!["login"]["role"].toString();
          loginToken.value = queryResult.data!["login"]["token"].toString();
          loginDetailsStorage();
          Get.offNamed(
            RoutesConstant.getRouteDashBoardPage(),
          );
        }
      } else {
        FullScreenDialog.cancelDialog();
        print(queryResult.exception);
        if (queryResult.exception!.graphqlErrors.isNotEmpty) {
          print("Login Error1: $queryResult");
          Get.snackbar("Error", queryResult.exception!.graphqlErrors[0].message.toString(),
              snackPosition: SnackPosition.BOTTOM);
        } else if (queryResult.exception!.linkException != null) {
          print("Login Error2: $queryResult");
          Get.snackbar("Error", "Please check your connection",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          print("Login Error3: ${queryResult}");
          Get.snackbar("Error", "Invalid Credentials",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    }
  }
}