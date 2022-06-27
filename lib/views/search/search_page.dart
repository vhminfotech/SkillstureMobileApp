import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/search/search_controller.dart';

class SearchPageScreen extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text("Search Page"),
          ),
        ),
      ),
    );
  }
}
