import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/more/my_subscription_page_controller.dart';

class MySubscriptionPage extends GetView<MySubscriptionPageController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}