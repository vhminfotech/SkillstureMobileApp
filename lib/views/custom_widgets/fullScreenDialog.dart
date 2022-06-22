import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.blueGrey.withOpacity(2),
      useSafeArea: true
    );
  }

  static void cancelDialog(){
    Get.back();
  }
}
