import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_teaching/my_teaching_controller.dart';
import 'package:skillsture_project/views/my_teaching/performance_tab/performance_tab_my_teaching_page.dart';
import 'package:skillsture_project/views/my_teaching/schedule_tab/schedule_tab_my_teaching_page.dart';
import '../../controllers/navigation/routes_constant.dart';
import '../../models/utils.dart';
import '../home/widgets/my_teaching_dashboard_livestream.dart';
import '../home/widgets/my_teaching_dashboard_reviews.dart';

class MyTeachingPageScreen extends GetView<MyTeachingPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (controller.applicationApproved == true)
            ? _applicationApprovedTrue()
            : _applicationApprovedFalse(),
      ),
    );
  }

  Widget _applicationApprovedFalse() {
    return Column(
      children: <Widget>[
        _getCustomAppBar(),
        _getAstronautImageView(),
        Spacer(),
        _getBottomImageView(),
      ],
    );
  }

  Widget _applicationApprovedTrue() {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: _topInfoAndImageView(),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.deepOrange,
              indicatorWeight: 4,
              controller: controller.tabController,
              labelColor: Color(0xFF262261),
              labelStyle: TextStyle(fontSize: 16, fontFamily: "Comfortaa-Bold"),
              unselectedLabelColor: Color(0x80262261),
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, fontFamily: "Comfortaa-Medium"),
              tabs: [
                Tab(text: "Dashboard"),
                Tab(text: "Schedule"),
                Tab(text: "Performance"),
                Tab(text: "Revenue"),
                Tab(text: "Payout"),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: controller.tabController,
        children: [
          _getDashboardView(),
          _getScheduleView(),
          _getPerformanceView(),
          _getRevenueView(),
          _getPayoutView(),
        ],
      ),
    );
  }

  Widget _getPayoutView() {
    return Container(
      color: Colors.grey,
    );
  }

  Widget _getRevenueView() {
    return Container(
      color: Colors.blueGrey,
    );
  }

  Widget _getPerformanceView() {
    return PerformanceTabMyTeachingPageScreen();
  }

  Widget _getScheduleView() {
    return ScheduleTabMyTeachingPageScreen();
  }

  Widget _getDashboardView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color(0xFFE5F5F7),
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Stream",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular"),
                ),
              ),
              subtitle: Text("28",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Bold")),
              trailing: Container(
                color: Color(0xFFA0DBE1),
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/stream@2x.png',
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFAFBE8),
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Average Rating",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular"),
                ),
              ),
              subtitle: Text("4.7 / 5.0",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Bold")),
              trailing: Container(
                color: Color(0xFFECEFAC),
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/star@2x_filled.png',
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFDF2E5),
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Follower",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular"),
                ),
              ),
              subtitle: Text(
                "1.3K",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Bold"),
              ),
              trailing: Container(
                color: Color(0xFFF9D0A0),
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/follower@2x.png',
                  ),
                ),
              ),
            ),
          ),
          _dashboardRevenue(),
          _dashboardUpcomingLiveStream(),
          _dashboardLatestReview(),
        ],
      ),
    );
  }

  Widget _dashboardLatestReview() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
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
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Latest Reviews",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF262261),
                            fontFamily: "Cocogoose-Bold"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 620,
              margin: EdgeInsets.only(top: 60),
              child: Container(
                margin: EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      height: 1,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (_, i) => MyTeachingDashboardReviews(),
                  scrollDirection: Axis.vertical,
                  //physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardUpcomingLiveStream() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
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
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Upcoming Livestream",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF262261),
                            fontFamily: "Cocogoose-Bold"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 450,
              margin: EdgeInsets.only(top: 60),
              child: Container(
                margin: EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      height: 1,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (_, i) => MyTeachingDashboardLivestream(),
                  scrollDirection: Axis.vertical,
                  //physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardRevenue() {
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
                  'assets/images/graphics_revenu@2x.png',
                  height: 160,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Revenue",
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
                "View All >",
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
                  Container(
                      margin: EdgeInsets.only(right: 30),
                      child: OutlinedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            _getBottomSheetView(),
                            enableDrag: false,
                          );
                        },
                        child: Row(
                          children: [
                            Obx(
                              () => Text(
                                controller.selectedMonth.value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF262261),
                                    fontFamily: "Comfortaa-Bold"),
                              ),
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
                      )),
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
                      maxY: 25,
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
                            FlSpot(15, 12.4),
                            FlSpot(17, 10.1),
                            FlSpot(19, 15.6),
                            FlSpot(21, 14.2),
                            FlSpot(23, 18.4),
                            FlSpot(26, 16.4),
                            FlSpot(29, 22.7),
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
        text = '5,000';
        break;
      case 10:
        text = '10,000';
        break;
      case 15:
        text = '15,000';
        break;
      case 20:
        text = '20,000';
        break;
      case 25:
        text = '25,000';
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

  Widget _getBottomSheetView() {
    return Container(
      color: Colors.white,
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Filter By",
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
              itemCount: controller.selectedBottomMonth.value.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.checkedBottomMonthColor(index);
                    controller.selectedMonthFromBottom(
                        controller.selectedBottomMonth.value[index]);
                    print(controller.selectedBottomMonth.value[index]);
                  },
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        controller.selectedBottomMonth.value[index],
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
                    '${touchedSpot.x} \n\nRevenue:\n${touchedSpot.y.toStringAsFixed(2)}',
                    textStyle);
              }).toList();
            }),
        handleBuiltInTouches: true,
        getTouchLineStart: (data, index) => 0,
      );

  Widget _topInfoAndImageView() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          color: const Color(0xFF262261),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/graphics_top banner@2x.png',
              height: 170,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 20),
          child: Text(
            "My Teaching",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Comfortaa-Bold"),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 75, left: 20, right: 40),
          child: Text(
            "Teach what you know and help learners gain new skills, start your journey as an Instructor now.",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: "Comfortaa-Regular"),
          ),
        ),
      ],
    );
  }

  Widget _getAstronautImageView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100, bottom: 40),
          child: Image.asset(
            'assets/images/astronaut-5.png',
            height: 110,
            width: 110,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 30),
          child: Text(
            "Your application still being review. You can access my teaching once application approved by SKILLSTURE.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF707070),
                fontFamily: "Comfortaa-Regular"),
          ),
        ),
      ],
    );
  }

  Widget _getBottomImageView() {
    return Column(
      children: [
        Text(
          "That's all for now",
          textAlign: TextAlign.center,
          style: Utils.styleTextStyleWhatsNewListSubTitleTextField(),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/home_astronaut-11@2x.png",
                ),
                fit: BoxFit.fill),
            //color: Colors.grey,
          ),
          width: double.infinity,
          height: 110,
        ),
      ],
    );
  }

  Widget _getCustomAppBar() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/home_logo@2x.png',
            height: 30,
          ),
          GestureDetector(
            onTap: () {
/*              loginData.write("isLogged", false);
              loginData.remove("role");
              loginData.remove("userId");
              loginData.remove("loginToken");*/
              Get.toNamed(RoutesConstant.getRouteLogin());
            },
            child: Image.asset(
              'assets/images/home_bell@2x.png',
              height: 30,
            ),
          ),
        ],
      ),
      height: kToolbarHeight,
    );
  }
}
