import 'package:get/get.dart';

class MorePageController extends GetxController {
  final List<String> moreItemsList = [
    "Edit Profile",
    "My Subscription",
    "Change Password",
    "Help Centre",
    "Terms & Conditions",
    "Privacy Policy",
  ];
  final List<String> iconItemsList = [
    "assets/images/icon_edit_profile.png",
    "assets/images/icon_my_subscription.png",
    "assets/images/icon_change_password.png",
    "assets/images/icon_help_center.png",
    "assets/images/icon_info.png",
    "assets/images/icon_info.png",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
