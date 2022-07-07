import 'package:get/get.dart';
import 'package:skillsture_project/constants/performance_reviews_list.dart';
import 'package:skillsture_project/models/performance_livestream_model.dart';

import '../../models/performance_review_model.dart';


class PerformanceViewReviewsController extends GetxController{

  final getPerformanceViewModel = Rxn<TeachingPerformanceLiveStreamModel>();

  final double totalWidth = 180.0;

  Rx<List<PerformanceReviewModel>> reviewModel =
  Rx<List<PerformanceReviewModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getPerformanceViewModel.value = Get.arguments;
    reviewModel.value = PerformanceReviewList;
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