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
          Image.asset(
            'assets/images/background-illustration.png',
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height) / 4,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: (MediaQuery.of(context).size.height) / 5,
            child: CircleAvatar(
              maxRadius: 40,
              backgroundImage: AssetImage('assets/images/home_astronaut-2.png'),
            ),
          )
        ],
      );

  Widget _getMoreListView() {
    return Container(
      padding: EdgeInsets.only(top: 10),
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
              // leading: ,
              title: Text(
                skillItem,
                style: const TextStyle(
                    color: const Color(0xFF262261),
                    fontFamily: "Comfortaa-Regular",
                    fontSize: 16.0),
              ),
              trailing: IconButton(
                icon: Image.asset(
                  "assets/images/Chevron-right@2x.png",
                  height: 18,
                  width: 18,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(5),
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
