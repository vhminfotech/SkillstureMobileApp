import 'package:flutter/material.dart';

import '../../../localization/localization.dart';
import '../../constants/constants.dart';
import '../../navigation/navigation.dart';
import '../../utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final FocusNode _emailFocus = FocusNode();

  final GlobalKey<FormState> _key = GlobalKey();

  late String _email;
  final bool _messageVisible = false;

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
                  _getHeaderImage(),
                  _getEmailTextField(),
                  _resetPasswordButton(),
                  _getLoginScreen()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeaderImage() => Stack(children: <Widget>[
        Image.asset(
          'assets/images/header.jpg',
          width: double.infinity,
          height: (MediaQuery.of(context).size.height) / 4,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: (MediaQuery.of(context).size.height) / 5,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Text("Forgot \nPassword",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: "Cocogoose-Regular")),
          ),
        )
      ]);

  Widget _getEmailTextField() => Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.next,
          focusNode: _emailFocus,
          decoration: InputDecoration(
            suffixIcon: Icon(
              _messageVisible ? Icons.check : Icons.close_outlined,
              color: _messageVisible ? Colors.green : Colors.red,
            ),
            labelText: Localization.of(context)!.email,
            labelStyle: Utils.styleTextStyleTextField(),
          ),
          validator: (value) => Utils.isValidEmail(context, value!),
          onSaved: (value) {
            _email = value!;
          },
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _resetPasswordButton() => Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: RaisedButton(
          color: const Color(0xFFF05A28),
          textColor: Colors.white,
          elevation: 1.0,
          onPressed: _resetPasswordPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: const Text(
            "Reset Password",
            style: TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
          ),
        ),
      );

  Widget _getLoginScreen() => Container(
        height: (MediaQuery.of(context).size.height) / 2.40,
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          onPressed: _loginPressed,
          child: RichText(
            text: const TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              children: <TextSpan>[
                TextSpan(
                  text: "You remember your password? ",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Color(0xFFF05A28),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                )
              ],
            ),
          ),
        ),
      );

  void _loginPressed() {
    NavigationUtils.push(context, routeLogin);
  }

  void _resetPasswordPressed() {
    NavigationUtils.push(context, routeCheckYourMail);
  }
}
