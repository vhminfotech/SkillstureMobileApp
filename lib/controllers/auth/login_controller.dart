import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skillsture_project/controllers/auth/auth_controller.dart';
import 'package:skillsture_project/views/custom_widgets/fullScreenDialog.dart';

class LoginController extends GetxController {
  AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void login() async {
    FullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount = await authController.googleSignIn.signIn();
    if(googleSignInAccount == null){
      FullScreenDialog.cancelDialog();
    }else{
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );
      await authController.firebaseAuth.signInWithCredential(oAuthCredential);
      FullScreenDialog.cancelDialog();

    }

  }
}