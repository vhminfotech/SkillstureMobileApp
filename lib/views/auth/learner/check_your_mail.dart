import 'package:flutter/material.dart';

import '../../custom_widgets/header_image.dart';

class CheckYourMailScreen extends StatefulWidget {
  const CheckYourMailScreen({Key? key}) : super(key: key);

  @override
  _CheckYourMailState createState() => _CheckYourMailState();
}

class _CheckYourMailState extends State<CheckYourMailScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                   HeaderImage(label: 'Check Your \nEmail'),
                  _getBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _getBody() => Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 60,
              width: 60,
              child: RaisedButton(
                elevation: 0,
                color: const Color(0x4DF05A28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5),
                ),
                onPressed: () {

                },
                child: Image.asset(
                  'assets/images/ic_mail.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "We’ve sent you an email to",
                style: TextStyle(
                    color: Color(0xFF262261),
                    fontSize: 14.0,
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
            const Text(
              "johndoe@gmail.com",
              style: TextStyle(
                  color: Color(0xFF262261),
                  fontSize: 14.0,
                  fontFamily: "Comfortaa-Bold"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "Click the link in the email to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xFF262261),
                    fontSize: 14,
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
          ],
        ),
      );

  void _checkYourMailPressed() {
  }
}
