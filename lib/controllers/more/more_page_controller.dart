import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/more_page_item_list.dart';
import '../../models/more_page_list_model.dart';

class MorePageController extends GetxController {
  final loginData = GetStorage();

  Rx<List<MorePageListItem>> morePageItemList =
  Rx<List<MorePageListItem>>([]);

  Rx<String> subscriptionPlan = Rx<String>("");

  @override
  void onInit() {
    super.onInit();
    //subscriptionPlan.value = "Active";
    subscriptionPlan.value = "Expired";
    morePageItemList.value = morePageListItem;
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

}