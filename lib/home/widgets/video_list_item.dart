import 'package:flutter/material.dart';

import '../../utils.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage("assets/images/video_bg.jpg",),fit: BoxFit.fill),
            color: Colors.blueGrey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 180,
          width: 300,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
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
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Fundamentals of being a Creative T...",
          style: Utils.styleTextStyleVideoTitleListTextField(),
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
              "18 May 2022 8:30pm",
              style: Utils.styleTextStyleVideoListSubTitleTextField(),
            ),
            const SizedBox(
              width: 10,
            ),
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
              "John Doe",
              style: Utils.styleTextStyleVideoListSubTitleTextField(),
            ),
          ],
        ),
      ],
    );
  }
}
