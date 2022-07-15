import 'package:flutter/material.dart';

import '../../../models/search_upcoming_livestream_model.dart';

class SearchMenuUpcomingLivestream extends StatelessWidget {
  final SearchUpcomingLivestreamModel upcomingModel;

  const SearchMenuUpcomingLivestream({Key? key, required this.upcomingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF262261),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: 300,
          width: 180,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        upcomingModel.liveStreamImage,
                      ),
                      fit: BoxFit.fill),
                  color: Colors.blueGrey.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                height: 120,
              ),
              //Image.asset("assets/images/webinar_bg.png",),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upcomingModel.liveStreamTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    const SizedBox(
                      height: 15,
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
                          upcomingModel.liveStreamDateTime,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          upcomingModel.liveStreamInstructor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: "Comfortaa-Regular"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 130,
                      child: RaisedButton(
                        color: const Color(0xfff7470b5),
                        textColor: Colors.white,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Remind Me",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Comfortaa-Bold",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
