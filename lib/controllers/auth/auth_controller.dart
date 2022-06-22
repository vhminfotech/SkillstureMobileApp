import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../navigation/routes_constant.dart';

class AuthController extends GetxController{

  late GoogleSignIn googleSignIn;
  var isGoogleSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    googleSignIn = GoogleSignIn();
    ever(isGoogleSignIn, googleSignInHandler);
    isGoogleSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isGoogleSignIn.value = event != null;
    });
  }

  @override
  void onClose(){
    super.onClose();
  }

  void googleSignInHandler(isLoggedIn){
    if(isLoggedIn){
      Get.offAllNamed(RoutesConstant.getRouteHomePage());
    } else {
      Get.offAllNamed(RoutesConstant.getRouteLogin());
    }
  }
}