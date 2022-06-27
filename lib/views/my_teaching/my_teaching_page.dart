import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_teaching/my_teaching_controller.dart';

import '../../controllers/navigation/routes_constant.dart';
import '../../models/utils.dart';

class MyTeachingPageScreen extends GetView<MyTeachingPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getCustomAppBar(),
              _getAstronautImageView(),
              _getBottomImageView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAstronautImageView() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/astronaut-5.png',
          height: 120,
          width: 120,
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
