import 'package:get/get.dart';

import '../../controllers/my_teaching/performance_view_reviews_controller.dart';

class PerformanceViewReviewsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<PerformanceViewReviewsController>(PerformanceViewReviewsController());
  }
}