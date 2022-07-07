import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skillsture_project/controllers/more/more_page_controller.dart';

class MorePageScreen extends GetView<MorePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerImage(),
              _getMoreListView(),
              _getLogoutButton(),
              _getAppNameView(),
            ],
          ),
        ),
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
              print(skillItem);
              // Get.toNamed(RoutesConstant.getRouteExploreSkillDetails(),arguments:skillItem);
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
        "Skillture v1.0.1",
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
          Get.back();
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
          height: 200,
          color: const Color(0xFF262261),
          child: Align(
            alignment: Alignment.centerRight,
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
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Color(0xFFD6DE23),
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
                          fontSize: 25.0,
                          fontFamily: "Comfortaa-Bold"),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Membership plan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Expiry date: 26 May 2023",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "Comfortaa-Regular"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 20,
                  color: Colors.blue,
                  child: Text("Active"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
