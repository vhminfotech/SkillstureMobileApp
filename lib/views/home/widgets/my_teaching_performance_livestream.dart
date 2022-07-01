import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/performance_livestream_model.dart';

class MyTeachingPerformanceLivestream extends StatelessWidget {

  final TeachingPerformanceLiveStreamModel performanceModel;

  const MyTeachingPerformanceLivestream({Key? key, required this.performanceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          performanceModel.liveStreamImage,
                        ),
                        fit: BoxFit.fill),
                    color: Colors.blueGrey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  width: 130,
                  height: 80,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 185,
                    child: Column(
                      children: [
                        Text(
                          performanceModel.liveStreamTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF262261),
                              fontFamily: "Comfortaa-Regular"),
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
                              color: const Color(0xFF262261),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              performanceModel.liveStreamDateTime,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF262261),
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
                              'assets/images/like@2x.png',
                              height: 15,
                              width: 15,
                              color: const Color(0xFF262261),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${performanceModel.liveStreamLikes}  likes',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF262261),
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
                              color: const Color(0xFF262261),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${performanceModel.liveStreamViews}  views',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Regular"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              performanceModel.liveStreamStarRatings,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Regular"),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RatingBar.builder(
                              updateOnDrag:true,
                              itemSize: 17,
                              initialRating: double.parse(performanceModel.liveStreamStarRatings),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xFFFFB451),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'View reviews',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Bold"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
