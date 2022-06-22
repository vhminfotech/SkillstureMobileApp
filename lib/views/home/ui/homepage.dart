import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/models/utils.dart';
import 'package:skillsture_project/views/home/widgets/circular_list_item.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../widgets/divider_container.dart';
import '../widgets/instructors_list_item.dart';
import '../widgets/recommend_list_item.dart';
import '../widgets/upcoming_list_item.dart';
import '../widgets/video_list_item.dart';
import '../widgets/whats_new_list_item.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  int _selectedIndex = 0;
  static const TextStyle optionStyleSelected = TextStyle(
      fontSize: 12, fontFamily: "Comfortaa-Bold");

  static const TextStyle optionStyle = TextStyle(
      fontSize: 12, fontFamily: "Comfortaa-Medium");

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getCustomAppBar(),
              _getCircularListView(),
              _getVideoListView(),
              _getLearnedSkillView(),
              _getWhatsNewView(),
              _getRecommendView(),
              _getUpcomingView(),
              _getInstructorsView(),
              _getBottomImageView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/explore_unselected.png"),
                size: 25,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/search_unselected.png",
                ),
                size: 25,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/book_unselected.png"),
                size: 25,
              ),
              label: 'My Learning',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/more_unselected.png"),
                size: 25,
              ),
              label: 'More',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF262261),
          onTap: _onItemTapped,
          selectedLabelStyle: optionStyleSelected,
          unselectedLabelStyle: optionStyle,
        ),
      ),
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
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 70.0, left: 10),
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

  Widget _getUpcomingView() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.pink.shade50,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 480,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Skillsture Upcoming \n Livestreams",
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
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/home_astronaut-2@2x.png',
            height: 120,
            width: 120,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100.0, left: 10),
          height: 350,
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (_, i) => const UpcomingListItem(),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 440.0),
      ],
    );
  }

  Widget _getRecommendView() {
    return Stack(
      children: <Widget>[
        Container(
          //color: Colors.grey.shade400,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 480,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Recommended For You",
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
                    "Skills related to your profiling",
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
          height: 350,
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 30,
              );
            },
            itemBuilder: (_, i) => const RecommendItem(),
            scrollDirection: Axis.horizontal,
          ),
        ),
        const DividerContainer(topMargin: 440.0),
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
                    "What's New",
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
                    "Latest livestream based on skills",
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
        const DividerContainer(topMargin: 440.0),
      ],
    );
  }

  Widget _getLearnedSkillView() {
    return Container(
      //color: Colors.blueGrey,
      color: const Color(0xFFF4F3FF),
      padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Learn in-demand skills",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262261),
                    fontFamily: "Cocogoose-Regular"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Explore Our 100 Skills",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 130,
                  child: RaisedButton(
                    color: const Color(0xFFF05A28),
                    textColor: Colors.white,
                    onPressed: () {
                      Get.toNamed(
                        RoutesConstant.getRouteExploreSkills(),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Explore Skills",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comfortaa-Bold"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getVideoListView() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 300,
          color: const Color(0xFF262261),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/home_graphics_explore@2x.png',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0, left: 10),
          height: 240,
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 30,
              );
            },
            itemBuilder: (_, i) => const VideoListItem(),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _getCircularListView() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10),
      height: 120.0,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemBuilder: (_, i) => const CircularListItem(),
        scrollDirection: Axis.horizontal,
      ),
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
            onTap: () {},
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
