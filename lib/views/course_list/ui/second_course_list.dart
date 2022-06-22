import 'package:flutter/material.dart';
import '../widgets/second_course_item_selected.dart';
class SecondCourseList extends StatefulWidget {
  const SecondCourseList({Key? key}) : super(key: key);

  @override
  State<SecondCourseList> createState() => _SecondCourseListState();
}

class _SecondCourseListState extends State<SecondCourseList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF262261),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/background_quiz.png',
                width: 750,
                height: 170,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _getHeaderArrowView(),
                    _getCourseInfoView(),
                    const SecondCourseItemSelected(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getCourseInfoView() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Pick 4 interested skills to start…",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Comfortaa-Bold",
              fontSize: 20.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Most popular or relevant skills based on the selected industry",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Comfortaa-Regular",
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );
}

Widget _getHeaderArrowView() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF05A28),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF05A28),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
          width: 110,
          height: 3,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF05A28),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF05A28),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
