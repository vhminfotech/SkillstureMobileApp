import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skillsture_project/controllers/more/more_page_controller.dart';

class MorePageScreen extends GetView<MorePageController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text("More Page"),
          ),
        ),
      ),
    );
  }
}