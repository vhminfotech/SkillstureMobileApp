import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_teaching/schedule_tab_my_teaching_controller.dart';
import '../../home/widgets/my_teaching_schedule_livestream.dart';

class ScheduleTabMyTeachingPageScreen
    extends GetView<ScheduleTabMyTeachingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 250,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorColor: Colors.white,
              controller: controller.scheduleTabController,
              labelColor: Color(0xFF262261),
              labelStyle: TextStyle(
                  fontSize: 23,
                  fontFamily: "Cocogoose-Bold",
                  fontWeight: FontWeight.bold),
              unselectedLabelColor: Color(0x80262261),
              unselectedLabelStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: "Cocogoose-Medium",
                  fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: "Livestream"),
                Tab(text: "Courses"),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.scheduleTabController,
            children: [
              _getLiveStreamView(),
              _getCoursesView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getCoursesView() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _getLiveStreamView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getSearchTextFieldView(),
          _getFilterButtonListView(),
          _getLiveStreamVideoView(),
        ],
      ),
    );
  }

  Widget _getLiveStreamVideoView() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.scheduleLiveStreamModel.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              controller.detailsButtonPressed(
                  controller.scheduleLiveStreamModel.value[index]);
              print(
                controller.scheduleLiveStreamModel.value[index].liveStreamTitle,
              );
            },
            child: MyTeachingScheduleLivestream(
              liveStreamModel: controller.scheduleLiveStreamModel.value[index],
            ),
          ),
          scrollDirection: Axis.vertical,
          //physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _getFilterButtonListView() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      height: 50,
      child: ListView(
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
                    "Filter Date",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular"),
                  ),
                  SizedBox(
                    width: 10,
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
                side: BorderSide(color: Color(0xFF262261), width: 1),
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
                    "All Skills",
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
                side: BorderSide(color: Color(0xFF262261), width: 1),
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
                side: BorderSide(color: Color(0xFF262261), width: 1),
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
                side: BorderSide(color: Color(0xFF262261), width: 1),
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
                Get.bottomSheet(
                  _getStatusBottomSheet(),
                  enableDrag: false,
                );
              },
              child: Row(
                children: [
                  Obx(
                    () => Text(
                      controller.selectedStatus.value,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular"),
                    ),
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
                side: BorderSide(color: Color(0xFF262261), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStatusBottomSheet() {
    return Container(
      color: Colors.white,
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Status",
                style: const TextStyle(
                  fontSize: 25.0,
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
              itemCount: controller.selectedBottomStatus.value.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.checkedBottomStatusColor(index);
                    controller.selectedMonthFromBottom(
                        controller.selectedBottomStatus.value[index]);
                    print(controller.selectedBottomStatus.value[index]);
                  },
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        controller.selectedBottomStatus.value[index],
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

  Widget _getSearchTextFieldView() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          controller.searchLivestream(value.toString());
        },
        style: const TextStyle(
          fontSize: 18.0,
          color: Color(0xFF262261),
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Color(0xFF262261),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Color(0xFF262261),
          ),
          hintText: "Search for title name, stream ID...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Color(0xFF262261),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
