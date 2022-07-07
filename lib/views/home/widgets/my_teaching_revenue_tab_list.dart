import 'package:flutter/material.dart';

import '../../../models/schedule_livestream_model.dart';

class MyTeachingRevenueTabList extends StatelessWidget {
  final TeachingScheduleLiveStreamModel liveStreamModel;
  const MyTeachingRevenueTabList({Key? key, required this.liveStreamModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Container(
              color: Color(0xFFF6F5FF),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      liveStreamModel.liveStreamCode,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    Text(
                      liveStreamModel.liveStreamDate,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular"),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      liveStreamModel.liveStreamTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Bold"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    liveStreamModel.liveStreamRevenue,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Bold"),
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
