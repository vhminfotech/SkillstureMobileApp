import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/my_teaching/schedule_livestream_details_controller.dart';

class LivestreamDetailPageScreen
    extends GetView<ScheduleLivestreamDetailsController> {
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
                    height: 400,
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
                    margin: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        controller.getLiveStreamModel.value!.liveStreamImage,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 305),
                    child: Text(
                      controller.getLiveStreamModel.value!.liveStreamTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.3,
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 360),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/home_calendar@2x.png',
                          height: 15,
                          width: 15,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            "18 May 2022 8:30pm",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Comfortaa-Regular"),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: ElevatedButton(
                            child: Text(
                              controller.getLiveStreamModel.value!.liveStreamStatus,
                              style: TextStyle(
                                  fontSize: 13, fontFamily: "Comfortaa-Regular"),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF40A1AE),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              _getLivestreamDetailView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLivestreamDetailView() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description  :",
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular")),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    controller.getLiveStreamModel.value!.liveStreamDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 9,
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Bold"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Skills             :",
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular")),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    controller.getLiveStreamModel.value!.liveStreamSkills,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Bold"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Levels           :",
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular")),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    controller.getLiveStreamModel.value!.liveStreamLevel,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Bold"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Language    :",
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular")),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    controller.getLiveStreamModel.value!.liveStreamLanguage,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Bold"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
