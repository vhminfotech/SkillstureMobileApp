import 'package:flutter/material.dart';

import '../../../models/schedule_livestream_model.dart';

class MyTeachingScheduleLivestream extends StatelessWidget {
  final TeachingScheduleLiveStreamModel liveStreamModel;

  const MyTeachingScheduleLivestream({Key? key, required this.liveStreamModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  ElevatedButton(
                    child: Text(liveStreamModel.liveStreamStatus,
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Comfortaa-Regular")),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: (liveStreamModel.liveStreamStatus == "Upcoming")
                          ? Color(0xFF40A1AE)
                          : (liveStreamModel.liveStreamStatus == "Ongoing")
                              ? Color(0xFFF05A28)
                              : Color(0xFFACACAC),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          liveStreamModel.liveStreamImage,
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
                    height: 90,
                    child: Column(
                      children: [
                        Text(
                          liveStreamModel.liveStreamTitle,
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
                              liveStreamModel.liveStreamDateTime,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF262261),
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
        ],
      ),
    );
  }
}
