import 'package:get/get.dart';

import '../../constants/content_model_list.dart';
import '../../models/content_model.dart';

class PrivacyPolicyPageController extends GetxController {
  List<String> privacyPolicy = [
    "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ];

  Rx<List<ContentModel>> contentModelList = Rx<List<ContentModel>>([]);

  @override
  void onInit() {
    super.onInit();
    contentModelList.value = privacyPolicyModel;
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
