import 'package:flutter/material.dart';
import '../../../models/notification_model.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationListItem({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        shape: (notificationModel.notificationStatus == true) ? Border(
          left: BorderSide(color: Color(0xFFF05A28), width: 5),) : Border(
        left: BorderSide(color: Colors.white, width: 5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      "assets/images/envelope-1@2x.png",
                      height: 22,
                      width: 22,
                    ),
                    backgroundColor: Color(0x0FF05A28),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notificationModel.notificationTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF262261),
                                fontFamily: "Comfortaa-Bold"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            notificationModel.notificationDescription,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF707070),
                                fontFamily: "Comfortaa-Regular"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            notificationModel.notificationDateTime,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF707070),
                                fontFamily: "Comfortaa-Regular"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
