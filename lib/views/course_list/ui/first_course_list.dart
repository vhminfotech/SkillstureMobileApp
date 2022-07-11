import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/course_list/first_list_controller.dart';
import '../../../models/quiz_one_skill_list.dart';

class FirstCourseListScreen extends GetView<FirstListController> {
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
                    _getSearchView(),
                    _getCourseListView(),
                    //const FirstCourseItemSelected(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCourseListView() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.searchCourse.value.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.selectedFirstListCourse(
                        controller.searchCourse.value[index]);
                    Get.bottomSheet(
                      _showBottomSheet(),
                      enableDrag: false,
                    );
                    print(controller.searchCourse.value[index].skillName);
                    print(controller.searchCourse.value[index].skillId);
                  },
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.all(
                        10,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color: controller.selectToChangeColour(controller.searchCourse.value[index])
                            ? const Color(0xFFF05A28)
                            : Colors.transparent,
                        border: Border.all(
                          color: controller.selectToChangeColour(controller.searchCourse.value[index])
                              ? const Color(0xFFF05A28)
                              : Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          controller.searchCourse.value[index].skillName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Comfortaa-Regular",
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showBottomSheet() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              "Selected (1/1):",
              style: TextStyle(
                  color: Color(0xff262261),
                  fontFamily: "Comfortaa-Medium",
                  fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 80.0,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.selectedCourse.value.length,
                itemBuilder: (BuildContext context, int index) {
                  if(controller.selectedCourse.value.isEmpty){
                    return Container(
                      child: Text("Please Select Course Item"),
                    );
                  }else{
                    return InkWell(
                      onTap: () {
                       controller.removeFromBottomSheetList(controller.selectedCourse.value[index]);
                      },
                      child: _getSelectedListItems(
                          controller.selectedCourse.value[index]),
                    );
                  }
                },
              ),
            ),
          ),
          _getNextButton(),
        ],
      ),
    );
  }

  Widget _getSelectedListItems(QuizOneSkillList courseName) => Container(
        margin: const EdgeInsets.all(10.0),
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFEEDC5),
            border: Border.all(
              color: const Color(0xFFFEEDC5),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  courseName.skillName,
                  style: const TextStyle(
                      color: Color(0xff262261),
                      fontFamily: "Comfortaa-Regular",
                      fontSize: 16.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.close,
                  color: Color(0xff262261),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _getNextButton() => Container(
        margin: const EdgeInsets.all(10.0),
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFF05A28)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFF05A28)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      side: BorderSide(color: Color(0xFFF05A28))))),
          onPressed: () {
            print("First List Dialog");
            controller.nextButtonPressed();
          },
          child: const Text(
            "Next",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Comfortaa-Regular",
                fontSize: 16.0),
          ),
        ),
      );

  Widget _getSearchView() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10.0, right: 20, bottom: 20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          controller.searchFirstListCourse(value);
        },
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.white,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCourseInfoView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Industry you’re in interested…",
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
}
