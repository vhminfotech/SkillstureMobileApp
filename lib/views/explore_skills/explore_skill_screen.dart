import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/explore_skill/explore_skill_controller.dart';
import 'package:skillsture_project/controllers/navigation/routes_constant.dart';

class ExploreSkillsScreen extends GetView<ExploreSkillsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFF262261),
                width: double.infinity,
                height: 160,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/background-illustration@2x.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/images/back@2x.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Skills",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Comfortaa-Regular",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                const EdgeInsets.only(left: 20, top: 90.0, right: 20),
                child: TextFormField(
                  onChanged: (value) {
                    print(value.toString());
                  },
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontFamily: "Comfortaa-Regular",
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: "Search for skills",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  _getExploreSkillsListView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getExploreSkillsListView() {
    return Container(
      padding: EdgeInsets.only(top: 160),

      child: Obx(
        () => ListView.separated(
          itemCount: controller.searchSkill.value.length,
          itemBuilder: (context, index) {
            final sortedItem = controller.searchSkill.value..sort((item1, item2) => item1.compareTo(item2));
            final skillItem = sortedItem[index];
            return InkWell(
              onTap: () {
                print(skillItem);
                Get.toNamed(RoutesConstant.getRouteExploreSkillDetails(),arguments:skillItem);
              },
              child:ListTile(
                title: Text(
                  skillItem,
                  style: const TextStyle(
                      color: const Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular",
                      fontSize: 16.0),
                ),
                trailing: IconButton(
                  icon: Image.asset("assets/images/Chevron-right@2x.png",
                  height: 18,
                  width: 18,),
                  onPressed: (){
                  },
                ),
              ),
            );
          },
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1,color: Colors.grey.shade400,);
          },
        ),
      ),
    );
  }
}
