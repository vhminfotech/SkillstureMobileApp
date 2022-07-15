import 'package:get/get.dart';

import '../../constants/notification_list.dart';
import '../../models/notification_model.dart';

class NotificationPageController extends GetxController{

  Rx<List<NotificationModel>> notifyModel =
  Rx<List<NotificationModel>>([]);

  @override
  void onInit() {
    super.onInit();
    notifyModel.value = notificationList;
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