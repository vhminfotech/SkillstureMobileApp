import 'package:flutter/material.dart';

class MyTeachingDashboardReviews extends StatelessWidget {
  const MyTeachingDashboardReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFF262261),
                ),
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user-avatar.png'),
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Siti Norshahida Binti Ahmad",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    SizedBox(height: 7,),
                    Text(
                      "Lorem ipsum dolor sit met consectetur adipis eiusmod tempor incididunt",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF707070),
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "18 May 2022 8:30pm",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF707070),
                          fontFamily: "Comfortaa-Regular"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/video_bg.jpg",
                    ),
                    fit: BoxFit.fill),
                color: Colors.blueGrey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              width: 140,
              height: 70,
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Container(
                height: 70,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      "10 Benefits of Cloud Computing and Why We Need To Learn",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
