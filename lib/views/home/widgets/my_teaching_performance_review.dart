import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/performance_review_model.dart';

class MyTeachingPerformanceReview extends StatelessWidget {
  final  PerformanceReviewModel reviewModel;
  const MyTeachingPerformanceReview({Key? key, required this.reviewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20, top: 20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    //padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF262261),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(reviewModel.reviewImage),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reviewModel.reviewName,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Medium"),
                              ),
                              Text(
                                reviewModel.reviewDateTime,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF707070),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RatingBar(
                            ignoreGestures: true,
                            updateOnDrag:false,
                            itemSize: 17,
                            initialRating: double.parse(reviewModel.reviewRating),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
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
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            reviewModel.reviewDescription,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF707070),
                                fontFamily: "Comfortaa-Regular"),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
