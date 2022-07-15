import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_teaching/performance_view_reviews_controller.dart';
import '../../home/widgets/my_teaching_performance_review.dart';

class ViewReviewsPageScreen extends GetView<PerformanceViewReviewsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Color(0xFF262261),
                    height: 250,
                    width: double.infinity,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/back@2x.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 70, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    controller.getPerformanceViewModel.value!
                                        .liveStreamImage,
                                  ),
                                  fit: BoxFit.fill),
                              color: Colors.blueGrey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: 170,
                            height: 120,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    print("Play Button Pressed");
                                  },
                                  child: Image.asset(
                                    'assets/images/home_play@2x.png',
                                    height: 40,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Text(
                                    controller.getPerformanceViewModel.value!
                                        .liveStreamTitle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        height: 1.5,
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "Comfortaa-Bold"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller.getPerformanceViewModel
                                            .value!.liveStreamStarRatings,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontFamily: "Comfortaa-Regular"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      RatingBar(
                                        ignoreGestures: true,
                                        itemSize: 18,
                                        initialRating: double.parse(controller
                                            .getPerformanceViewModel
                                            .value!
                                            .liveStreamStarRatings),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                        ratingWidget: RatingWidget(
                                          full: Image.asset(
                                            'assets/images/star@2x_full.png',
                                            height: 10,
                                            width: 10,
                                          ),
                                          half: Image.asset(
                                            'assets/images/star@2x_half.png',
                                            height: 10,
                                            width: 10,
                                          ),
                                          empty: Image.asset(
                                            'assets/images/star@2x_empty.png',
                                            height: 10,
                                            width: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_calendar@2x.png',
                                        height: 15,
                                        width: 15,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.getPerformanceViewModel
                                            .value!.liveStreamDateTime,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontFamily: "Comfortaa-Regular"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_instructor@2x.png',
                                        height: 15,
                                        width: 15,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.getPerformanceViewModel
                                            .value!.liveStreamInstructor,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontFamily: "Comfortaa-Regular"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_views@2x.png',
                                        height: 15,
                                        width: 15,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${controller.getPerformanceViewModel.value!.liveStreamViews}  views',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontFamily: "Comfortaa-Regular"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 280, left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.getPerformanceViewModel.value!
                                  .liveStreamStarRatings,
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Bold"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RatingBar(
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating: double.parse(controller
                                  .getPerformanceViewModel
                                  .value!
                                  .liveStreamStarRatings),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              ratingWidget: RatingWidget(
                                full: Image.asset(
                                  'assets/images/star@2x_full.png',
                                  height: 10,
                                  width: 10,
                                ),
                                half: Image.asset(
                                  'assets/images/star@2x_half.png',
                                  height: 10,
                                  width: 10,
                                ),
                                empty: Image.asset(
                                  'assets/images/star@2x_empty.png',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Average Rating",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Bold"),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _getAverageRatingView("5", 0.85),
                            SizedBox(
                              height: 10,
                            ),
                            _getAverageRatingView("4", 0.75),
                            SizedBox(
                              height: 10,
                            ),
                            _getAverageRatingView("3", 0.4),
                            SizedBox(
                              height: 10,
                            ),
                            _getAverageRatingView("2", 0.2),
                            SizedBox(
                              height: 10,
                            ),
                            _getAverageRatingView("1", 0.1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _getSearchTextFieldView(),
                  _getFilterDateView(),
                ],
              ),
              _getReviewList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getReviewList() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.reviewModel.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              print(
                controller.reviewModel.value[index].reviewName,
              );
            },
            child: MyTeachingPerformanceReview(
              reviewModel: controller.reviewModel.value[index],
            ),
          ),
          scrollDirection: Axis.vertical,
          //physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _getFilterDateView() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20, top: 510, bottom: 15),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () {
/*          Get.bottomSheet(
                _getStatusBottomSheet(),
                enableDrag: false,
              );*/
            },
            child: Row(
              children: [
                Text(
                  "Filter Date",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/home_calendar@2x.png',
                  height: 20,
                  width: 20,
                  color: const Color(0xFF262261),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xFF262261), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          OutlinedButton(
            onPressed: () {
/*          Get.bottomSheet(
                _getStatusBottomSheet(),
                enableDrag: false,
              );*/
            },
            child: Row(
              children: [
                Text(
                  "All Rating",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                  color: Color(0xFF262261),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xFF262261), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSearchTextFieldView() {
    return Container(
      margin: EdgeInsets.only(top: 430, bottom: 20, left: 20, right: 20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          /*controller.searchLivestream(value.toString());*/
        },
        style: const TextStyle(
          fontSize: 15.0,
          color: Color(0xFF262261),
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Color(0xFF262261),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Color(0xFF262261),
          ),
          hintText: "Search for name, keyword",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Color(0xFF262261),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAverageRatingView(String star, double percentage) {
    return Row(
      children: [
        Text(
          "${star} Star",
          style: TextStyle(
              fontSize: 14,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Bold"),
        ),
        SizedBox(
          width: 10,
        ),
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 8,
                width: controller.totalWidth),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFB451),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 8,
                width: controller.totalWidth * percentage),
          ],
        ),
      ],
    );
  }
}
