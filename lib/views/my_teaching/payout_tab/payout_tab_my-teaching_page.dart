import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skillsture_project/controllers/my_teaching/payout_tab_my_teaching_controller.dart';

import '../../home/widgets/my_teaching_payout_tab_list.dart';

class PayoutTabMyTeachingPageScreen extends GetView<PayoutTabMyTeachingController>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Payout",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262261),
                        fontFamily: "Cocogoose-Bold"),
                  ),
                ],
              ),
            ),
          ),
          _getSearchTextFieldView(),
          _getFilterDateView(),
          _getLiveStreamVideoView(),
        ],
      ),
    );
  }

  Widget _getLiveStreamVideoView() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
      child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
          itemCount: controller.scheduleLiveStreamModel.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              print(
                controller.scheduleLiveStreamModel.value[index].liveStreamTitle,
              );
            },
            child: MyTeachingPayoutTabList(
              liveStreamModel: controller.scheduleLiveStreamModel.value[index],
            ),
          ),
          scrollDirection: Axis.vertical,
          //physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _getFilterDateView(){
    return Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.only(left: 20, top: 5, bottom: 15),
      child: OutlinedButton(
        onPressed: () {
/*                  Get.bottomSheet(
                    _getBottomSheetView(),
                    enableDrag: false,
                  );*/
        },
        child: Row(
          children: [
            Text(
              "Filter Date",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Regular"),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/home_calendar@2x.png',
              height: 20,
              width: 20,
              color: const Color(0xFF262261),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF262261), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _getSearchTextFieldView() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          /*controller.searchLivestream(value.toString());*/
        },
        style: const TextStyle(
          fontSize: 15.0,
          color: Color(0xFF262261),
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Color(0xFF262261),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Color(0xFF262261),
          ),
          hintText: "Search for title name, stream ID...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Color(0xFF262261),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xFF262261),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}