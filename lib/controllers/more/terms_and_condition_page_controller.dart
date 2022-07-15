import 'package:get/get.dart';

import '../../constants/content_model_list.dart';
import '../../models/content_model.dart';

class TermsAndConditionPageController extends GetxController {
  List<String> termsAndCondition = [
    "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ];

  Rx<List<ContentModel>> contentModelList = Rx<List<ContentModel>>([]);

  @override
  void onInit() {
    super.onInit();
    contentModelList.value = contentModel;
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
