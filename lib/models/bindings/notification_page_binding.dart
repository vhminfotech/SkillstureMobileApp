import 'package:get/get.dart';
import 'package:skillsture_project/controllers/home/notification_page_controller.dart';

class NotificationPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NotificationPageController>(NotificationPageController());
  }
}