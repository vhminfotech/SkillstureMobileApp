import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/my_learning/my_learning_controller.dart';

class MyLearningPageScreen extends GetView<MyLearningPageController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text("My Learning Page"),
          ),
        ),
      ),
    );
  }
}