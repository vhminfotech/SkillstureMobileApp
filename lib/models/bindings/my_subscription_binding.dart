import 'package:get/get.dart';

import '../../controllers/more/my_subscription_page_controller.dart';

class MySubscriptionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MySubscriptionPageController>(MySubscriptionPageController());
  }
}