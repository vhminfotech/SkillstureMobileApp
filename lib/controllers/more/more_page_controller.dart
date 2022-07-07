import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/more_page_item_list.dart';
import '../../models/more_page_list_model.dart';

class MorePageController extends GetxController {

  Rx<List<MorePageListItem>> morePageItemList =
  Rx<List<MorePageListItem>>([]);

  @override
  void onInit() {
    super.onInit();
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

}