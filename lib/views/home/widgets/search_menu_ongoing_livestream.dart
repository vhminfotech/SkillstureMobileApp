import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../models/performance_livestream_model.dart';

class SearchMenuOngoingLivestream extends StatelessWidget {
  final TeachingPerformanceLiveStreamModel liveStreamModel;

  const SearchMenuOngoingLivestream({Key? key, required this.liveStreamModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        liveStreamModel.liveStreamImage,
                      ),
                      fit: BoxFit.fill),
                  color: Colors.blueGrey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      print("Play Button Pressed");
                    },
                    child: Image.asset(
                      'assets/images/home_play@2x.png',
                      height: 60,
                      width: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: (liveStreamModel.liveStreamLive == "Live") ? Color(0xFFF05A28) : Color(0xFFACACAC),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10,top: 5, bottom: 5),
                      child: Text(
                        (liveStreamModel.liveStreamLive == "Live") ? "Live" : liveStreamModel.liveStreamDuration,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Comfortaa-Regular",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            liveStreamModel.liveStreamTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF262261),
                fontFamily: "Comfortaa-Regular"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                liveStreamModel.liveStreamStarRatings,
                style: TextStyle(
                    fontSize: 13,
                    //fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBar(
                ignoreGestures: true,
                itemSize: 25,
                initialRating:
                    double.parse(liveStreamModel.liveStreamStarRatings),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
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
                color: const Color(0xFF262261),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                liveStreamModel.liveStreamDateTime,
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
                'assets/images/home_instructor@2x.png',
                height: 15,
                width: 15,
                color: const Color(0xFF262261),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                liveStreamModel.liveStreamInstructor,
                style: TextStyle(
                    fontSize: 13,
                    //fontWeight: FontWeight.bold,
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
                height: 18,
                width: 18,
                color: const Color(0xFF262261),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${liveStreamModel.liveStreamViews} views",
                style: TextStyle(
                    fontSize: 13,
                    //fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
