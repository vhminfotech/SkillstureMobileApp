import 'package:flutter/material.dart';
import '../widgets/first_course_item_selected.dart';

class FirstCourseList extends StatefulWidget {
  const FirstCourseList({Key? key}) : super(key: key);

  @override
  State<FirstCourseList> createState() => _FirstCourseListState();
}

class _FirstCourseListState extends State<FirstCourseList> {
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
                    const FirstCourseItemSelected(),
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

Widget _getCourseListView() {
  List<String> items = <String>[
    "Arts & Design",
    "Business",
    "Data Science",
    "Healthcare",
    "Music",
    "Advertising & Marketing",
    "Computer Science",
    "Information Technology",
    "Finance & Accounting",
    "Development",
    "Lorem ipsum",
    "Lorem ipsum",
    "Lorem ipsum",
    "Lorem ipsum",
    "Lorem ipsum",
    "Lorem ipsum",
    "Lorem ipsum",
  ];
  bool isSelected = false;
  return ListView.separated(
    itemBuilder: (BuildContext context, index) {
      return ListTile(
        title: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              print(items[index]);
            },
            child: Text(items[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Comfortaa-Regular",
                    fontSize: 16.0)),
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, index) {
      return const Divider(height: 1);
    },
    itemCount: items.length,
    shrinkWrap: true,
    padding: const EdgeInsets.all(5),
    scrollDirection: Axis.vertical,
  );
}

Widget _getCourseInfoView() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Industry you’re in / interested…",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Comfortaa-Bold",
              fontSize: 20.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Before get started, tell us industry you’re in or interested for better skills recommendation",
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
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
