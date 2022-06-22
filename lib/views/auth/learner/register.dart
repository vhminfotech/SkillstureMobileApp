import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../constants/country_list.dart';
import '../../../controllers/graphqlconfigs/mutation_query.dart';
import '../../../controllers/navigation/routes_constant.dart';
import '../../../localization/localization.dart';
import '../../../models/utils.dart';
import '../../custom_widgets/header_image.dart';
import '../../../controllers/auth/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool agree = false;
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;
  bool _isPasswordEightDigit = false;
  bool _isPasswordUpperAndLower = false;
  bool _isPasswordOneNumberSymbol = false;
  bool _isPasswordNotEmail = false;

  late String _name;
  late String _email;
  late String _mobile;
  late String _password;
  late String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderImage(label: 'Get Started'),
                //_getHeaderImage(),
                _getNameTextField(),
                _getEmailTextField(),
                _getMobileTextField(),
                _getPasswordTextField(),
                _getPasswordValidationField(),
                _getConfirmPasswordTextField(),
                _getTermsAndCondition(),
                Mutation(
                  options: MutationOptions(
                      document: gql(MutationQuery().registeredUser),
                      onError: (dynamic errorData) {
                        print("Registered Error: $errorData");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("User exists already."),
                          ),
                        );
                      },
                      onCompleted: (dynamic resultData) {
                        print("Registered : $resultData");
                        if (resultData == null || resultData == "undefined") {
                          print("Registered Failed");
/*                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("User exists already."),
                          ),);*/
                          return;
                        } else {
                          print("Registered Token");
                          print(resultData.toString());
                          Get.toNamed(
                            RoutesConstant.getRouteFirstCourseList(),
                          );
                        }
                      }),
                  builder: (runMutation, result) {
                    return _getSignUpButton(runMutation);
                  },
                ),
                //_getSignUpButton(),
                _txtSignedInOption(),
                _getSocialButton(),
                _getLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPasswordValidationField() {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        _rowPasswordField(
            "contains at least 8 characters", _isPasswordEightDigit),
        _rowPasswordField("contains both lowercase and uppercase letters",
            _isPasswordUpperAndLower),
        _rowPasswordField("contains at least one number (0-9) or a symbol",
            _isPasswordOneNumberSymbol),
        _rowPasswordField(
            "does not contain your email address", _isPasswordNotEmail),
      ],
    );
  }

  Widget _rowPasswordField(String label, bool passwordValidation) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        passwordValidation
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 20,
                ),
              )
            : const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 7,
                ),
              ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: Utils.styleTextStylePasswordTextField(),
        )
      ],
    );
  }


  Widget _getEmailTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        focusNode: _emailFocus,
        decoration: Utils.styleInputDecoration(Localization.of(context)!.email),
        validator: (value) {
          return Utils.isValidEmail(context, value!);
        },
        onChanged: (value) {
          _email = value;
        },
        onSaved: (value) {
          _email = value!;
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

/*  Widget _getMobileTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: IntlPhoneField(
        decoration:
            Utils.styleInputDecoration(Localization.of(context)!.mobile),
        initialCountryCode: 'MY',
        validator: (phone) {
          return Utils.isEmpty(
            context,
            phone!.completeNumber,
            Localization.of(context)!.msgEnterMobile,
          );
        },
        onChanged: (phone) {
          print(phone.completeNumber);
          _mobile = phone.completeNumber;
        },
        onSaved: (phone) {
          _mobile = phone!.completeNumber;
        },
      ),
    );
  }*/

  Widget _getMobileTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: <Widget>[
          Row(
            children: [
              CountryCodePicker(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Medium"),
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'MY',
                padding: EdgeInsets.only(right: 0, top: 5),
                flagWidth: 40,
                countryFilter: countryList,
                comparator: (a, b) => b.name!.compareTo(a.name.toString()),
                //Get the country information relevant to the initial selection
                onInit: (code) => print(
                    "on init ${code!.name} ${code.dialCode} ${code.name}"),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 40,
                color: Color(0xFF262261),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Medium"),
              textInputAction: TextInputAction.next,
              focusNode: _mobileFocus,
              maxLength: 14,
              decoration:
                  Utils.styleInputDecoration(Localization.of(context)!.mobile),
              validator: (value) {
                return Utils.isMobileNumberValidation(
                    context, value.toString());
              },
              onChanged: (value) {
                _mobile = value;
              },
              onSaved: (value) {
                _mobile = value.toString();
              },
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getNameTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        focusNode: _nameFocus,
        decoration: Utils.styleInputDecoration(Localization.of(context)!.name),
        validator: (value) {
          return Utils.isEmpty(
            context,
            value!,
            Localization.of(context)!.msgEnterName,
          );
        },
        onChanged: (value) {
          _name = value;
        },
        onSaved: (value) {
          _name = value!;
        },
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _getSignUpButton(RunMutation runMutation) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(20),
      child: RaisedButton(
        color: const Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        //onPressed: _registerPressed,
        onPressed: () {
          if (_key.currentState!.validate()) {
            if (agree == true) {
              _key.currentState!.save();
              print(_name);
              print(_email);
              print(_password);
              print(_mobile);
              print(_confirmPassword);
              runMutation({
                "fullName": _name,
                "email": _email,
                "mobile": _mobile,
                "password": _password
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Please accept terms & conditions"),
              ));
              print("Please accept terms & conditions");
            }
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

/*  Widget _getSignUpButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(20),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: _registerPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }*/

  Widget _getPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        focusNode: _passwordFocus,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        decoration: InputDecoration(
          labelText: Localization.of(context)!.password,
          labelStyle: Utils.styleTextStyleTextField(),
          errorStyle: Utils.styleTextStyleErrorTextField(),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
          ),
        ),
        validator: (value) {
          return Utils().onValidationPassword(value!);
        },
        onSaved: (value) {
          _password = value!;
        },
        onChanged: (password) {
          _password = password;
          onChangePassword(password);
        },
        obscureText: _passwordVisible,
      ),
    );
  }

  Widget _getConfirmPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.done,
        focusNode: _confirmPasswordFocus,
        decoration: InputDecoration(
          labelText: Localization.of(context)!.confirmPassword,
          labelStyle: Utils.styleTextStyleTextField(),
          errorStyle: Utils.styleTextStyleErrorTextField(),
          suffixIcon: IconButton(
            icon: Icon(
              _confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            },
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
          ),
        ),
        onSaved: (value) {
          _confirmPassword = value!;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a confirm password";
          }
          if (value != _password) {
            return Localization.of(context)?.errorDiffPassword;
          }
          return null;
          //return Utils.isPasswordMatched(context, value!, _password);
        },
        obscureText: _confirmPasswordVisible,
      ),
    );
  }

  Widget _getTermsAndCondition() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 15, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    agree = !agree;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xB3262261), width: 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: agree
                      ? const Icon(Icons.check,
                          size: 17.0, color: Color(0xB3262261))
                      : const Icon(
                          null,
                          size: 17.0,
                        ),
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "By signing up you have read and agree to the Skillsture ",
                      style: TextStyle(
                          color: Color(0xB3262261),
                          fontSize: 14.0,
                          fontFamily: "Comfortaa-Medium"),
                    ),
                    TextSpan(
                      text: "Term & Conditions",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFF05A28),
                          fontSize: 14.0,
                          fontFamily: "Comfortaa-Medium"),
                    )
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  Widget _getSocialButton() => Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 50,
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.white,
                elevation: 1.0,
                onPressed: () {
                  if (agree == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please accept the terms & conditions"),
                      ),
                    );
                  } else {
                    AuthBloc().googleLoginPressed().then(
                      (value) {
                        final userEmail = value.user!.email;
                        Get.toNamed(
                          RoutesConstant.getRouteHomePage(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value.user!.email.toString()),
                          ),
                        );
                        print(userEmail);
                      },
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_google.png',
                      width: 18.0,
                      height: 18.0,
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Comfortaa-Bold",
                          color: Color(0xFF262261)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.white,
                elevation: 1.0,
                onPressed: () {
                  if (agree == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please accept the terms & conditions"),
                      ),
                    );
                  } else {
                    AuthBloc().facebookLoginPressed().then(
                      (value) {
                        final userEmail = value.user!.email;
                        Get.toNamed(
                          RoutesConstant.getRouteHomePage(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value.user!.email.toString()),
                        ));
                        print(userEmail);
                      },
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_facebook.png',
                      width: 18.0,
                      height: 18.0,
                    ),
                    const Text(
                      "Facebook",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Comfortaa-Bold",
                          color: Color(0xFF262261)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));

  Widget _getLogin() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: _loginPressed,
          child: RichText(
            text: const TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              children: <TextSpan>[
                TextSpan(
                  text: "Already have an account? ",
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

  Widget _txtSignedInOption() => Row(children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 25.0, right: 20.0),
              child: const Divider(
                color: Color(0xB3262261),
                height: 36,
              )),
        ),
        const Text("Or sign in with",
            style: TextStyle(
                color: Color(0xB3262261),
                fontSize: 14.0,
                fontFamily: "Comfortaa-Regular")),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 25.0),
              child: const Divider(
                color: Color(0xB3262261),
                height: 36,
              )),
        ),
      ]);

  void _registerPressed() {
    if (_key.currentState!.validate()) {
      if (agree == true) {
        _key.currentState!.save();

        print(_name);
        print(_email);
        print(_password);
        print(_mobile);
        print(_confirmPassword);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please accept terms & conditions"),
        ));
        print("Please accept terms & conditions");
      }
    }
  }

  void _loginPressed() {
    Get.toNamed(
      RoutesConstant.getRouteLogin(),
    );
  }

  void onChangePassword(String password) {
    final upperLowerReg = RegExp(r'[A-Za-z]');
    final numberOrSymbol = RegExp(r'[!@#$%^&*_0-9]');

    setState(() {
      //_isPasswordEightDigit = false;
      if (password.length >= 8) {
        _isPasswordEightDigit = true;
      }

      //_isPasswordOneNumberSymbol = false;
      if (numberOrSymbol.hasMatch(password)) {
        _isPasswordOneNumberSymbol = true;
      }

      //_isPasswordUpperAndLower = false;
      if (upperLowerReg.hasMatch(password)) {
        _isPasswordUpperAndLower = true;
      }

      //_isPasswordNotEmail = false;
      if (password != _email) {
        _isPasswordNotEmail = true;
      }
    });
  }

}
