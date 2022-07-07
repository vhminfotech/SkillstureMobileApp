import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_teaching/performance_tab_my_teaching_controller.dart';
import 'package:skillsture_project/views/home/widgets/my_teaching_performance_livestream.dart';

import '../../../controllers/my_teaching/performance_tab_second_my_teaching_controller.dart';

class PerformanceTabMyTeachingPageScreen
    extends GetView<PerformanceTabMyTeachingController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 7.0),
                        child: Text(
                          "Performance",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF262261),
                              fontFamily: "Cocogoose-Bold"),
                        ),
                      ),
                      subtitle: Text("31 May 2022 - 06 Jun 2022",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF262261),
                              fontFamily: "Comfortaa-Bold")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: OutlinedButton(
                      onPressed: () {
/*                    Get.bottomSheet(
                            _getBottomSheetView(),
                            enableDrag: false,
                          );*/
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Text(
                              "Last 7 days",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF262261),
                                  fontFamily: "Comfortaa-Bold"),
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 25,
                              color: Color(0xFF262261),
                            ),
                          ],
                        ),
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 280,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: Color(0xFFF05A28),
                  indicatorWeight: 4,
                  controller: controller.performanceTabControllerFirst,
                  labelColor: Color(0xFFF05A28),
                  labelStyle: TextStyle(
                    fontSize: 19,
                    fontFamily: "Comfortaa-Bold",
                  ),
                  unselectedLabelColor: Color(0xFF262261),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: "Comfortaa-Medium",
                  ),
                  tabs: [
                    Tab(text: "Views"),
                    Tab(text: "Likes"),
                    Tab(text: "Followers"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 565,
            child: TabBarView(
              controller: controller.performanceTabControllerFirst,
              children: [
                _getViewsView(),
                _getLikesView(),
                _getFollowersView(),
              ],
            ),
          ),
          Container(
              child: SizedBox(
            height: 30,
          ),),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 230,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: Color(0xFFF05A28),
                  indicatorWeight: 4,
                  controller:
                      Get.find<PerformanceTabSecondMyTeachingController>()
                          .performanceTabControllerSecond,
                  labelColor: Color(0xFFF05A28),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: "Comfortaa-Bold",
                  ),
                  unselectedLabelColor: Color(0xFF262261),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 19,
                    fontFamily: "Comfortaa-Medium",
                  ),
                  tabs: [
                    Tab(text: "Livestream"),
                    Tab(text: "Courses"),
                  ],
                ),
              ),
            ),
          ),
/*          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: Text(
                      "Sort By:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Bold"),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child: OutlinedButton(
                    onPressed: () {
*//*                      Get.bottomSheet(
                        _getBottomSheetView(),
                        enableDrag: false,
                      );*//*
                    },
                    child: Row(
                      children: [
                       Text(
                            "Most Viewed",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF262261),
                                fontFamily: "Comfortaa-Bold"),
                          ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 30,
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
                  ),),
            ],
          ),*/
          Container(
            height: 700,
            child: TabBarView(
              controller: Get.find<PerformanceTabSecondMyTeachingController>()
                  .performanceTabControllerSecond,
              children: [
                _getLivestreamView(),
                _getCoursesView(),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget _getCoursesView() {
    return Container(
      color: Colors.white,
    );
  }

  Widget _getLivestreamView() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 40),
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.performanceLiveStreamModel.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
/*              controller.detailsButtonPressed(
                  controller.performanceLiveStreamModel.value[index]);*/
              print(
                controller
                    .performanceLiveStreamModel.value[index].liveStreamTitle,
              );
            },
            child: MyTeachingPerformanceLivestream(
              performanceModel:
                  controller.performanceLiveStreamModel.value[index],
            ),
          ),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  Widget _getFollowersView() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2.0,
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: Color(0xFFF6F5FF),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/graphics_followers@2x.png',
                  height: 160,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Followers",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 65, left: 20, right: 40),
              child: Text(
                "This Month",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF707070),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 40),
              child: Text(
                "1.3K",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 20, right: 40),
              child: Text(
                "Total 30.5K views",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 180,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      minLeadingWidth: 15,
                      horizontalTitleGap: 5,
                      leading: Icon(
                        Icons.circle,
                        color: Color(0xFF5672D8),
                        size: 20,
                      ),
                      title: Text(
                        "Livestream",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF262261),
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 230,
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 10, right: 20),
                child: Container(
                  //color: Color(0xFFE5F5F7),
                  height: 250,
                  width: double.infinity,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 30,
                      minY: 0,
                      maxY: 20,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: leftTitles(),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: bottomTitles(),
                        ),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                      ),
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey,
                            strokeWidth: 1,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(3, 4.7),
                            FlSpot(6, 2.4),
                            FlSpot(9, 7.3),
                            FlSpot(12, 4.9),
                            FlSpot(13.5, 13.4),
                            FlSpot(15, 11.4),
                            FlSpot(17, 9.1),
                            FlSpot(19, 14.6),
                            FlSpot(21, 13.2),
                            FlSpot(23, 17.5),
                            FlSpot(26, 15.4),
                            FlSpot(29, 19.7),
                          ],
                          isCurved: true,
                          color: Color(0xFF5672D8),
                          barWidth: 3,
                          dotData: FlDotData(
                            show: false,
                          ),
                          belowBarData:
                              BarAreaData(show: true, color: Color(0xFFEAECF3)),
                        ),
                      ],
                      lineTouchData: lineTouchData1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLikesView() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2.0,
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: Color(0xFFF6F5FF),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/graphics_views@2x.png',
                  height: 160,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Likes",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 65, left: 20, right: 40),
              child: Text(
                "This Month",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF707070),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 40),
              child: Text(
                "1.3K",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 20, right: 40),
              child: Text(
                "Total 30.5K views",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 180,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      minLeadingWidth: 15,
                      horizontalTitleGap: 5,
                      leading: Icon(
                        Icons.circle,
                        color: Color(0xFF5672D8),
                        size: 20,
                      ),
                      title: Text(
                        "Livestream",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF262261),
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 230,
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 10, right: 20),
                child: Container(
                  //color: Color(0xFFE5F5F7),
                  height: 250,
                  width: double.infinity,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 30,
                      minY: 0,
                      maxY: 20,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: leftTitles(),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: bottomTitles(),
                        ),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                      ),
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey,
                            strokeWidth: 1,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(3, 4.7),
                            FlSpot(6, 2.4),
                            FlSpot(9, 7.3),
                            FlSpot(12, 4.9),
                            FlSpot(13.5, 13.4),
                            FlSpot(15, 11.4),
                            FlSpot(17, 9.1),
                            FlSpot(19, 14.6),
                            FlSpot(21, 13.2),
                            FlSpot(23, 17.5),
                            FlSpot(26, 15.4),
                            FlSpot(29, 19.7),
                          ],
                          isCurved: true,
                          color: Color(0xFF5672D8),
                          barWidth: 3,
                          dotData: FlDotData(
                            show: false,
                          ),
                          belowBarData:
                              BarAreaData(show: true, color: Color(0xFFEAECF3)),
                        ),
                      ],
                      lineTouchData: lineTouchData1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getViewsView() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2.0,
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: Color(0xFFF6F5FF),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/graphics_views@2x.png',
                  height: 160,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Views",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 65, left: 20, right: 40),
              child: Text(
                "This Month",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF707070),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 40),
              child: Text(
                "1.3K",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 20, right: 40),
              child: Text(
                "Total 30.5K views",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 180,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      minLeadingWidth: 15,
                      horizontalTitleGap: 5,
                      leading: Icon(
                        Icons.circle,
                        color: Color(0xFF5672D8),
                        size: 20,
                      ),
                      title: Text(
                        "Livestream",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF262261),
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 230,
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 10, right: 20),
                child: Container(
                  //color: Color(0xFFE5F5F7),
                  height: 250,
                  width: double.infinity,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 30,
                      minY: 0,
                      maxY: 20,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: leftTitles(),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: bottomTitles(),
                        ),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                          reservedSize: 40,
                          showTitles: false,
                        )),
                      ),
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey,
                            strokeWidth: 1,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(3, 4.7),
                            FlSpot(6, 2.4),
                            FlSpot(9, 7.3),
                            FlSpot(12, 4.9),
                            FlSpot(13.5, 13.4),
                            FlSpot(15, 11.4),
                            FlSpot(17, 9.1),
                            FlSpot(19, 14.6),
                            FlSpot(21, 13.2),
                            FlSpot(23, 17.5),
                            FlSpot(26, 15.4),
                            FlSpot(29, 19.7),
                          ],
                          isCurved: true,
                          color: Color(0xFF5672D8),
                          barWidth: 3,
                          dotData: FlDotData(
                            show: false,
                          ),
                          belowBarData:
                              BarAreaData(show: true, color: Color(0xFFEAECF3)),
                        ),
                      ],
                      lineTouchData: lineTouchData1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF707070),
      fontFamily: "Comfortaa-Bold",
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '01 Jun';
        break;
      case 15:
        text = '15 Jun';
        break;
      case 29:
        text = '29 Jun';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles bottomTitles() => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF707070),
      fontFamily: "Comfortaa-Bold",
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text;
    switch (value.toInt()) {
      case 5:
        text = '5';
        break;
      case 10:
        text = '10';
        break;
      case 15:
        text = '15';
        break;
      case 20:
        text = '20';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 45,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            maxContentWidth: 200,
            tooltipBgColor: Colors.white,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final textStyle = TextStyle(
/*              color: touchedSpot.bar.gradient?.colors[0] ??
                  touchedSpot.bar.color,*/
                  fontSize: 15,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Regular",
                );
                return LineTooltipItem(
                    '${touchedSpot.x} \n\Views:\n${touchedSpot.y.toStringAsFixed(2)}',
                    textStyle);
              }).toList();
            }),
        handleBuiltInTouches: true,
        getTouchLineStart: (data, index) => 0,
      );
}
