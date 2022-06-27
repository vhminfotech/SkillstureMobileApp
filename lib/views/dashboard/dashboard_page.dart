import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/dashboard_page_controller.dart';
import '../home/ui/homepage.dart';
import '../more/more_page.dart';
import '../my_learning/my_learning_page.dart';
import '../my_teaching/my_teaching_page.dart';
import '../search/search_page.dart';

class DashboardPageScreen extends GetView<DashboardPageController> {
  final List<BottomNavigationBarItem> learnerNavigationBarItems = [
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
  ];

  final List<BottomNavigationBarItem> adminNavigationBarItems = [
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
        AssetImage("assets/images/my-teaching-solid@2x.png"),
        size: 25,
      ),
      label: 'My Teaching',
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.isRoleInstructor.value == true)
            ? controller
                .adminNavigationScreens()[controller.selectedItemIndex.value]
            : controller
                .learnerNavigationScreens()[controller.selectedItemIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: (controller.isRoleInstructor.value == true)
              ? adminNavigationBarItems
              : learnerNavigationBarItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedItemIndex.value,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF262261),
          onTap: controller.onItemTapped,
          selectedLabelStyle: optionStyleSelected,
          unselectedLabelStyle: optionStyle,
        ),
      ),
    );
  }

  static const TextStyle optionStyleSelected =
      TextStyle(fontSize: 11, fontFamily: "Comfortaa-Bold");
  static const TextStyle optionStyle =
      TextStyle(fontSize: 11, fontFamily: "Comfortaa-Medium");
}
