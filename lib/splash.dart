import 'dart:async';
import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'navigation/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF262261), // This is needed
      height: double.infinity,
      width: double.infinity,
      child: Column(children: <Widget>[_getCenterIcon(), _getBottomIcon()]),
    );
  }

  Widget _getCenterIcon() => Container(
      margin: const EdgeInsets.only(top: 300.0),
      alignment: Alignment.topCenter,
      child: Image.asset("assets/images/splash_logo.png",
          width: 180, height: 130));

  Widget _getBottomIcon() => Expanded(
          child: Align(
          alignment: FractionalOffset.bottomCenter,
            child: Image.asset("assets/images/splash_bg.png",
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 162,
            fit: BoxFit.cover),
      ));

  _startTime() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, _gotoNextScreen);
  }

  void _gotoNextScreen() {
    NavigationUtils.pushReplacement(context, routeLogin);
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }
}
