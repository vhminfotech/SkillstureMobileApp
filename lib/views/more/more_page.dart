import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skillsture_project/controllers/more/more_page_controller.dart';

import '../../constants/more_page_navigation_list.dart';
import '../../controllers/navigation/routes_constant.dart';

class MorePageScreen extends GetView<MorePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerImage(),
              if (controller.subscriptionPlan.value == "Expired") _getSubscriptionView(),
              _getMoreListView(),
              _getLogoutButton(),
              _getAppNameView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSubscriptionView() {
    return Container(
      color: Color(0xFFF4F3FF),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join Our Membership",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular"),
                ),
                SizedBox(height: 10,),
                Text(
                  "Enjoy unlimited skills & livestream",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  color: const Color(0xFFF05A28),
                  textColor: Colors.white,
                  onPressed: () {
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 15,),
                    child: const Text(
                      "Renew Now",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comfortaa-Bold"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMoreListView() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      child: ListView.separated(
        itemCount: controller.morePageItemList.value.length,
        itemBuilder: (context, index) {
          final skillItem = controller.morePageItemList.value[index];
          return InkWell(
            onTap: () {
              print(skillItem.title);
              Get.toNamed(MorePageNavigationList[index]);
            },
            child: ListTile(
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              leading: Image.asset(
                controller.morePageItemList.value[index].icon,
                height: 22,
                width: 18,
              ),
              title: Text(
                controller.morePageItemList.value[index].title,
                style: const TextStyle(
                    color: const Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular",
                    fontSize: 16.0),
              ),
              trailing: Image.asset(
                "assets/images/Chevron-right@2x.png",
                height: 18,
                width: 18,
              ),
            ),
          );
        },
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey.shade400,
          );
        },
      ),
    );
  }

  Widget _getAppNameView() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0,right: 40, top: 30, bottom: 30),
      child: Text(
        "Skillsture v1.0.1",
        style: TextStyle(
            color: Color(0xFF707070),
            fontSize: 16.0,
            fontFamily: "Comfortaa-Regular"),
      ),
    );
  }

  Widget _getLogoutButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: RaisedButton(
        color: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.loginDetailsRemoved();
          Get.offAllNamed(RoutesConstant.getRouteLogin());
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFFF05A28),
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Logout",
          style: TextStyle(
              color: Color(0xFFF05A28),
              fontSize: 18.0,
              fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  Widget _headerImage() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          color: const Color(0xFF262261),
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/background-illustration-more1@2x.png',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20,top: 20),
          height: 150,
          child: Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Color(0xFFD6DE23),
                      child: Center(
                          child: Text('JD',style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "Comfortaa-Bold"),),
                      ),
                    ),
                    Positioned(
                        top: 0.0,
                        right: 0.0,
                        child:Stack(
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  'assets/images/premium@2x.png',
                                ),
                              ),
                            ),
                          ],
                        ),),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.0,
                          fontFamily: "Comfortaa-Bold"),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Membership plan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Expiry date: 26 May 2023",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: (controller.subscriptionPlan.value == "Active") ? Colors.blue : Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                  height: 30,
                  child: Center(
                    child: Text(controller.subscriptionPlan.value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: "Comfortaa-Regular"),),
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
