import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skillsture_project/controllers/navigation/routes_constant.dart';

import '../../constants/more_page_item_list.dart';
import '../../models/more_page_list_model.dart';

class MorePageController extends GetxController {
  final loginData = GetStorage();

  Rx<List<MorePageListItem>> morePageItemList =
  Rx<List<MorePageListItem>>([]);

  Rx<String> subscriptionPlan = Rx<String>("");
  Rx<String> profilePictureUri = Rx<String>("");
  Rx<bool> profilePictureIndicator = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    //subscriptionPlan.value = "Active";
    subscriptionPlan.value = "Expired";
    morePageItemList.value = morePageListItem;
    getProfilePictureUri();

  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void loginDetailsRemoved(){
    loginData.write("isLogged", false);
    loginData.remove("role");
    loginData.remove("userId");
    loginData.remove("loginToken");
  }

  void getProfilePictureUri() async {
    if(profilePictureUri.value.isEmpty){
      profilePictureIndicator.value = false;
      print(profilePictureUri.value);
    }else{
      profilePictureIndicator.value = true;
      print(profilePictureUri.value);
      profilePictureUri.value = await Get.to(RoutesConstant.getRouteEditProfilePage());
    }
  }
}