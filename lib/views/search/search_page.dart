import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/search/search_controller.dart';
import 'package:skillsture_project/views/home/widgets/search_menu_ongoing_livestream.dart';

import '../home/widgets/divider_container.dart';
import '../home/widgets/search_menu_instructor_list_item.dart';
import '../home/widgets/search_menu_upcoming_livestream.dart';

class SearchPageScreen extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => (controller.selectedItem.value == "Livestream")
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      _headerSearchFilterView(),
                      _getOngoingLivestreamView(),
                      _getPostLivestreamView(),
                      _getUpcomingLivestreamView(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      _headerSearchFilterView(),
                      _getInstructorView(),
                      _getInstructorList(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _getInstructorList() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (_, i) => SearchMenuInstructorListItem(),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget _getInstructorView() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Instructors",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Regular"),
              ),
              Text(
                "20 results",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getUpcomingLivestreamView() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Livestream",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Regular"),
              ),
              Text(
                "${controller.upcomingLivestreamList.value.length} results",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100.0, left: 10),
          height: 350,
          child: ListView.separated(
            itemCount: controller.upcomingLivestreamList.value.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (_, index) => SearchMenuUpcomingLivestream(
              upcomingModel: controller.upcomingLivestreamList.value[index],
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 430.0),
      ],
    );
  }

  Widget _getPostLivestreamView() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Post Livestream",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Regular"),
              ),
              Text(
                "${controller.ongoingLivestreamListPost.value.length} results",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 90, left: 20, right: 20),
          height: 350,
          child: ListView.separated(
            itemCount: controller.ongoingLivestreamListPost.value.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 30,
              );
            },
            itemBuilder: (_, index) => SearchMenuOngoingLivestream(
              liveStreamModel: controller.ongoingLivestreamListPost.value[index],
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 430.0),
      ],
    );
  }

  Widget _getOngoingLivestreamView() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ongoing Livestream",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Regular"),
              ),
              Text(
                "${controller.ongoingLivestreamList.value.length} results",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 90, left: 20, right: 20),
          height: 350,
          child: ListView.separated(
            itemCount: controller.ongoingLivestreamList.value.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 30,
              );
            },
            itemBuilder: (_, index) => SearchMenuOngoingLivestream(
              liveStreamModel: controller.ongoingLivestreamList.value[index],
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 430.0),
      ],
    );
  }

  Widget _headerSearchFilterView() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: const Color(0xFF262261),
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/background-illustration@2x_search.png',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                _getStatusBottomSheet(),
                enableDrag: false,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    controller.selectedItem.value,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: "Comfortaa-Regular"),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 35,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 55),
          child: TextFormField(
            onChanged: (value) {
              print(value.toString());
            },
            style: const TextStyle(
              fontSize: 15.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Regular",
            ),
            cursorColor: Color(0xFF262261),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xFF262261),
              ),
              hintText: "Search a keyword",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 130),
          height: 50,
          child: Obx(
            () => (controller.selectedItem.value == "Livestream")
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            Get.dialog(
                              _getAllSkillsDialog(),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Skills",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 35,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Levels",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Languages",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            Get.dialog(
                              _getAllStatusDialog(),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Status",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "Filter Date",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/images/home_calendar@2x.png',
                                height: 20,
                                width: 20,
                                color: const Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Skills",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 35,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Rating",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: OutlinedButton(
                          onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
                          },
                          child: Row(
                            children: [
                              Text(
                                "Most Followed",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Regular"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                                color: Color(0xFF262261),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side:
                                BorderSide(color: Color(0xFF262261), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _getAllSkillsDialog() {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Skills",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular",),
                  ),
                  Text(
                    "${controller.selectedBottomSkill.value.length} selected",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular",),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ListView.separated(
                itemCount: controller.selectedBottomSkill.value.length,
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.checkedFilterSkillColor(index);
                      controller.selectedFilterSkill(
                          controller.selectedBottomSkill.value[index]);
                      controller.addChipItem(controller
                          .selectedBottomSkill.value[index]
                          .toString());
                      print(controller.selectedBottomSkill.value[index]);
                    },
                    child: Material(
                        color: Colors.white,
                        child: Obx(
                              () =>  ListTile(
                          title: Text(
                            controller.selectedBottomSkill.value[index],
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF262261),
                              fontFamily: "Comfortaa-Regular",
                            ),
                          ),
                          trailing: controller.selectToChangeColour(controller.selectedBottomSkill.value[index])
                              ? Image.asset(
                            "assets/images/checkbox@2x.png",
                            //color: Colors.deepOrangeAccent,
                            height: 20,
                            width: 20,
                          )
                              : Container(
                            //color: Colors.deepOrangeAccent,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  );
                },
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        print("Clear Pressed");
                        controller.clearSkillFilterList();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Clear",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFF05A28),
                              fontFamily: "Comfortaa-Bold"),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFFF05A28), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        print("Show Result Pressed");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Show Results",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "Comfortaa-Bold"),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFFF05A28),
                        side: BorderSide(color: Color(0xFFF05A28), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAllStatusDialog() {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular",),
                ),
              ],
            ),
            SizedBox(height: 20,),
            ListView.separated(
              itemCount: controller.selectedBottomStatus.value.length,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.checkedFilterStatusColor(index);
                    controller.selectedFilterStatus(
                        controller.selectedBottomStatus.value[index]);
                    print(controller.selectedBottomStatus.value[index]);
                  },
                  child: Obx(
                        () => Material(
                          color: Colors.white,
                          child: ListTile(
                      title: Text(
                          controller.selectedBottomStatus.value[index],
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF262261),
                            fontFamily: "Comfortaa-Regular",
                          ),
                      ),
                      trailing: controller.selectedStatusIndex.value == index
                            ? Icon(
                          Icons.check,
                          color: Colors.red,
                          size: 25,
                      )
                            : Icon(
                          Icons.circle,
                          color: Colors.white,
                      ),
                    ),
                        ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey.shade400,
                );
              },
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      print("Clear Pressed");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFF05A28),
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xFFF05A28), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  width: 160,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      print("Show Result Pressed");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Show Results",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFF05A28),
                      side: BorderSide(color: Color(0xFFF05A28), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStatusBottomSheet() {
    return Container(
      color: Colors.white,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Search By",
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF262261),
                  fontFamily: "Cocogoose-Regular",
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: Color(0xFF262261),
                  size: 30,
                ),
              ),
            ),
            ListView.separated(
              itemCount: controller.selectedBottomItem.value.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.checkedSearchTypeColor(index);
                    controller.selectedTypeForSearch(
                        controller.selectedBottomItem.value[index]);
                    print(controller.selectedBottomItem.value[index]);
                  },
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        controller.selectedBottomItem.value[index],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular",
                        ),
                      ),
                      trailing: controller.selectedIndex.value == index
                          ? Icon(
                              Icons.check,
                              color: Colors.red,
                              size: 25,
                            )
                          : Icon(
                              Icons.circle,
                              color: Colors.white,
                            ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey.shade400,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
