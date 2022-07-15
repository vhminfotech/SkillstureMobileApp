import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/home/notification_page_controller.dart';

import '../widgets/notification_list_item.dart';

class NotificationPage extends GetView<NotificationPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Color(0xFF262261),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          "assets/images/back@2x.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Notifications",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    )
                  ],
                ),
              ),
              _getNotificationListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getNotificationListView() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.notifyModel.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              print(
                controller.notifyModel.value[index].notificationTitle,
              );
            },
            child: NotificationListItem(
              notificationModel: controller.notifyModel.value[index],
            ),
          ),
          scrollDirection: Axis.vertical,
          //physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
