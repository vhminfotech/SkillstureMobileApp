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


class LoginController extends GetxController {

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();
  //late GraphQLClient _client;

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
    //_client = graphqlProviderClass.clientToQuery();
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

  void checkLogin(RunMutation runMutation) {
    final isValidated = loginKey.currentState!.validate();
    if (isValidated) {
        loginKey.currentState!.save();
        FullScreenDialog.showDialog();
        runMutation(
          {
            "email": email,
            "password": password
          },
        );

    }
  }

  void googleLoginPressed(RunMutation runMutation) async {
    // TODO: Add loading stage while google nd facebook auth.
    final googleUser = await GoogleSignIn(scopes: <String>['email']).signIn();
    FullScreenDialog.showDialog();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      googleAccessToken.value = googleAuth!.accessToken.toString();
      runMutation(
        {
          "accessToken": googleAccessToken.value,
        },
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void facebookLoginPressed(RunMutation runMutation) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
      if (facebookAuthCredential.accessToken == null) {
        Get.back();
      } else {
        facebookAccessToken.value = loginResult.accessToken!.token.toString();
        runMutation(
          {
            "accessToken": facebookAccessToken.value,
          },
        );
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      }
  }

/*   Future<QueryResult<Object?>> loginDemo(String email, String password) async {
    print("@@@!!!!@@@@!!!!");
    var result = await _client.mutate(
      MutationOptions(
        document: gql(MutationQuery().login(email, password)),
      ),
    );
    getLoginData = result as Type;
    print(result);
    return result;
  }*/
}