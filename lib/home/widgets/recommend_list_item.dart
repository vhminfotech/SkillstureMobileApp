import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/recommend_bg.jpg",
                ),
                fit: BoxFit.fill),
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
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "10 Benefits of Cloud Computing and ...",
          style: Utils.styleTextStyleWhatsNewTitleListTextField(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "4.0",
              style: Utils.styleTextStyleWhatsNewListSubTitleTextField(),
            ),
            const SizedBox(
              width: 5,
            ),
            RatingBar.builder(
              itemSize: 25,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
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
              style: Utils.styleTextStyleWhatsNewListSubTitleTextField(),
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
              "Alicia Yap",
              style: Utils.styleTextStyleWhatsNewListSubTitleTextField(),
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
              "900 views",
              style: Utils.styleTextStyleWhatsNewListSubTitleTextField(),
            ),
          ],
        ),
      ],
    );
  }
}
