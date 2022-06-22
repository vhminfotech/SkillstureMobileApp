import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/explore_skill/explore_skill_details_controller.dart';

import '../home/widgets/divider_container.dart';
import '../home/widgets/instructors_list_item.dart';
import '../home/widgets/whats_new_list_item.dart';

class ExploreSkillDetailsScreen extends GetView<ExploreSkillDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _getHeaderImageView(),
              const SizedBox(
                height: 20,
              ),
              _getWhatsNewView(),
              const SizedBox(
                height: 20,
              ),
              _getInstructorsView(),
              _getOtherRelevantSkillView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getOtherRelevantSkillView() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.pink.shade50,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 200,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Other Relevant Skills",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262261),
                        fontFamily: "Cocogoose-Regular"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 70.0, left: 10),
          height: 40,
          child: Obx(
            () => ListView.separated(
              itemCount: controller.relevantSkill.value.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemBuilder: (_, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  controller.relevantSkill.value[index],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        const DividerContainer(topMargin: 150.0),
      ],
    );
  }

  Widget _getInstructorsView() {
    return Stack(
      children: <Widget>[
        Container(
          //color: Colors.indigoAccent,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 350,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Recommended Instructors",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262261),
                        fontFamily: "Cocogoose-Regular"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Courses you might interested in",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 90.0, left: 10),
          height: 200,
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (_, i) => const InstructorsListItem(),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 300.0),
      ],
    );
  }

  Widget _getWhatsNewView() {
    return Stack(
      children: <Widget>[
        Container(
          //color: Colors.grey.shade400,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 460,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Livestreams",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262261),
                        fontFamily: "Cocogoose-Regular"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/home_astronaut-9@2x.png',
            height: 120,
            width: 120,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 95.0, left: 10),
          height: 350,
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 30,
              );
            },
            itemBuilder: (_, i) => const WhatsNewItem(),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 445.0),
      ],
    );
  }

  Widget _getHeaderImageView() {
    return Stack(
      children: [
        Container(
          color: const Color(0xFF262261),
          width: double.infinity,
          height: 280,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/background-illustration1@2x.png',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/images/back@2x.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 90,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "${Get.arguments}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Comfortaa-Bold",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 130, left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et do.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Comfortaa-Regular",
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 190),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: const Color(0xFFF05A28),
                  textColor: Colors.white,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa-Bold"),
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
