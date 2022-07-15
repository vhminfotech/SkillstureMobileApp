import 'package:flutter/material.dart';
import '../../../models/utils.dart';
class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage("assets/images/video_bg.jpg",),fit: BoxFit.fill),
            color: Colors.blueGrey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 180,
          width: 260,
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
          height: 12,
        ),
        Container(
          width: 260,
          child: Text(
            "Fundamentals of being a Creative Technology",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: "Comfortaa-Medium"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 260,
          child: Row(
            children: [
              Image.asset(
                'assets/images/home_calendar@2x.png',
                height: 14,
                width: 14,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "18 May 2022 8:30pm",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontFamily: "Comfortaa-Regular"),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/home_instructor@2x.png',
                height: 14,
                width: 14,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "John Doe",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
