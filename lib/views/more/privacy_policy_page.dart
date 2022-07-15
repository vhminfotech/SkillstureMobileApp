import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/more/privacy_policy_page_controller.dart';

import '../home/widgets/item_content_list.dart';

class PrivacyPolicyPage extends GetView<PrivacyPolicyPageController> {
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
                        "Privacy Policy",
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
              _getHeaderView(context),
              _getBody(),
              _getBottomImageView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderView(var context) => Row(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width) / 2,
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/home_logo@2x.png',
                  height: 60,
                  width: 160,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Key Information",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF262261),
                      fontFamily: "Cocogoose-Regular"),
                ),
                Text(
                  "Effective Date 26 May 2022",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Regular"),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/ic_terms_condition.png',
                width: (MediaQuery.of(context).size.width) / 2,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ],
      );

  Widget _getBody() => Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.privacyPolicy.length,
                itemBuilder: (context, index) {
                  return _getTermsAndConditions(
                      controller.privacyPolicy[index]);
                },
              ),
            ),
            _getTableOfContents(),
            _getContentTitleList(),
            _getDetailedDescList(),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              color: Color(0x4D707070),
              height: 1,
            ),
            _getBottomView(),
          ],
        ),
      );

  Widget _getTermsAndConditions(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 4.0),
            child: Icon(
              Icons.circle,
              color: Color(0xFF262261),
              size: 5,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF707070),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getTableOfContents() => Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Table of Contents",
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Cocogoose-Regular"),
            ),
          ],
        ),
      );

  Widget _getContentTitleList() => ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(left: 4.0, right: 8.0),
        shrinkWrap: true,
        itemCount: controller.contentModelList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${index + 1}. ${controller.contentModelList.value[index].title}",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Regular"),
            ),
          );
        },
      );

  Widget _getDetailedDescList() => ListView.builder(
        padding: EdgeInsets.only(left: 4.0, right: 8.0),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: controller.contentModelList.value.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ContentList(
              contentModel: controller.contentModelList.value[index],
            ),
          );
        },
      );

  Widget _getBottomView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'assets/images/home_logo@2x.png',
                height: 40,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/images/ic_social_facebook.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/images/ic_social_youtube.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_social_twitter.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "Skills",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-SemiBold"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "About",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-SemiBold"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "Terms & Conditions",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-SemiBold"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 80.0),
            child: Text(
              "Privacy Policy",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-SemiBold"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomImageView() {
    return Column(
      children: [
        Text(
          "© 2022 Skillture. All rights reserved.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
        ),
        const SizedBox(
          height: 40,
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
}
