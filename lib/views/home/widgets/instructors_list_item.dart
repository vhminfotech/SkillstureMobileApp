import 'package:flutter/material.dart';

import '../../../models/utils.dart';

class InstructorsListItem extends StatelessWidget {
  const InstructorsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF262261),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 180,
          width: 350,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/instructor_bg14.jpg",
                      ),
                      fit: BoxFit.fill),
                  color: Colors.blueGrey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: 140,
              ),
              //Image.asset("assets/images/webinar_bg.png",),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Melissa Lynn",
                      style: Utils.styleTextStyleInstructorTitleListTextField(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "1.3K",
                          style: Utils
                              .styleTextStyleInstructorTitleListTextField(),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/images/user_group.png',
                          height: 22,
                          width: 22,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const SizedBox(
                          height: 15,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.7",
                          style: Utils
                              .styleTextStyleInstructorTitleListTextField(),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/images/star@2x.png',
                          height: 15,
                          width: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Creative Thinker, Graphic \nDesign, Product Design, \nAnimator, UI/U…",
                      style:
                          Utils.styleTextStyleInstructorListSubTitleTextField(),
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
