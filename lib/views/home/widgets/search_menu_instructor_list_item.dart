import 'package:flutter/material.dart';

class SearchMenuInstructorListItem extends StatelessWidget {
  const SearchMenuInstructorListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Melissa Lynn",
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
                          Text(
                            "1.3K",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontFamily: "Comfortaa-Regular"),
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
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontFamily: "Comfortaa-Regular"),
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
                        height: 30,
                      ),
                      Text(
                        "Creative Thinker, Graphic Design, Product Design, Animator, User Interface Design, User Design, Graphic Design, Product Design",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: "Comfortaa-Regular"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
