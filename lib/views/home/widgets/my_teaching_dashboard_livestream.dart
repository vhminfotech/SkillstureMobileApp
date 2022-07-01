import 'package:flutter/material.dart';

class MyTeachingDashboardLivestream extends StatelessWidget {
  const MyTeachingDashboardLivestream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/whats_bg.jpg",
                ),
                fit: BoxFit.fill),
            color: Colors.blueGrey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          width: 140,
          height: 90,
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              children: [
                Text(
                  "10 Benefits of Cloud Computing and Why We Need To Learn",
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
                      "18 May 2022 8:30pm",
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
    );
  }
}
