import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/more/more_page_controller.dart';

class MorePageScreen extends GetView<MorePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF262261),
                child: _headerImage(context),
              ),
              _getMoreListView(),
              _getLogoutButton(),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  "Skillture v1.0.1",
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 16.0,
                      fontFamily: "Comfortaa-Regular"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerImage(context) => Stack(
        children: <Widget>[
          /*  Image.asset(
            'assets/images/background-illustration.png',
            width: (MediaQuery.of(context).size.width),
            height: 120,
          ),*/
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: (MediaQuery.of(context).size.height) / 5,
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Color(0xFFD6DE23),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "Comfortaa-Bold"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Text(
                          "Membership plan",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: "Comfortaa-Regular"),
                        ),
                      ),
                      Text(
                        "Expiry date: 26 May 2023",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: "Comfortaa-Regular"),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/background-illustration.png',
                  width: 85,
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      );

  Widget _getMoreListView() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        itemCount: controller.moreItemsList.length,
        itemBuilder: (context, index) {
          final skillItem = controller.moreItemsList[index];
          return InkWell(
            onTap: () {
              print(skillItem);
              // Get.toNamed(RoutesConstant.getRouteExploreSkillDetails(),arguments:skillItem);
            },
            child: ListTile(
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              leading: Image.asset(
                controller.iconItemsList[index],
                height: 22,
                width: 18,
              ),
              title: Text(
                skillItem,
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
}
