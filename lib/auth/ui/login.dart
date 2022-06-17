import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../constants/constants.dart';
import '../../graphqlconfigs/mutation_query.dart';
import '../../localization/localization.dart';
import '../../navigation/navigation.dart';
import '../../utils.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _passwordVisible = true;
  final GlobalKey<FormState> _key = GlobalKey();

  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _getHeaderImage(),
                  _getEmailTextField(),
                  _getPasswordTextField(),
                  _getForgotPasswordButton(),
                  Mutation(
                    options: MutationOptions(
                        document: gql(MutationQuery().loginUser),
                        onError: (dynamic errorData){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Invalid Credentials",
                              ),
                            ),
                          );
                        },
                        onCompleted: (dynamic resultData) {
                          if (resultData == null) {
                            print("Login Failed");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Invalid Credentials",
                                ),
                              ),
                            );
                            return;
                          } else {
                            print("Login Token");
                            print(resultData.toString());
                            NavigationUtils.push(context, routeHomePage);
                          }
                        }),
                    builder: (runMutation, result) {
                      return _getLoginButton(runMutation);
                    },
                  ),
                  //_getLoginButton(),
                  _txtSignedInOption(),
                  _getSocialButton(),
                  _getAccountRegister(),
                  _getSignUpAsInstructor(),
                ],
              ),
            ),
          ),
        ),
      );

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
            child: Text("Welcome",
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
          decoration:
              Utils.styleInputDecoration(Localization.of(context)!.email),
          validator: (value) => Utils.isValidEmail(context, value!),
          onSaved: (value) {
            _email = value!;
          },
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _getForgotPasswordButton() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            onPressed: _forgotPasswordPressed,
            child: Text(
              Localization.of(context)!.forgotPassword,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xB3262261),
                  fontFamily: "Comfortaa-Medium"),
            ),
          ),
        ],
      );

  Widget _getSocialButton() => Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  textColor: Colors.white,
                  elevation: 1.0,
                  onPressed: () {
                    AuthBloc().googleLoginPressed().then((value) {
                      final userEmail = value.user!.email;
                      NavigationUtils.push(context, routeHomePage);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(value.user!.email.toString()),
                      ));
                      print(userEmail);
                    });
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
                  //onPressed: _facebookLoginPressed,
                  onPressed: () {
                    AuthBloc().facebookLoginPressed().then((value) {
                      final userEmail = value.user!.email;
                      NavigationUtils.push(context, routeHomePage);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(value.user!.email.toString()),
                      ));
                      print(userEmail);
                    });
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
        ),
      );

  Widget _getAccountRegister() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: _registerPressed,
          child: RichText(
            text: const TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              children: <TextSpan>[
                TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: " Sign Up",
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

  Widget _getSignUpAsInstructor() => Container(
        margin: const EdgeInsets.all(10),
        child: FlatButton(
          padding: const EdgeInsets.all(10),
          //onPressed: _registerPressed,
          onPressed: () {
            NavigationUtils.push(context, routeRegister);
          },
          child: RichText(
            text: const TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              children: <TextSpan>[
                TextSpan(
                  text: "Want to become an instructor?",
                  style: TextStyle(
                      color: Color(0xFF262261),
                      fontSize: 14.0,
                      fontFamily: "Comfortaa-Medium"),
                ),
                TextSpan(
                  text: "\n        Sign up as Instructor",
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

  Widget _getLoginButton(RunMutation runMutation) => Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(20),
        child: RaisedButton(
          color: const Color(0xFFF05A28),
          textColor: Colors.white,
          elevation: 1.0,
          //onPressed: _loginPressed,
          onPressed: () {
            if (_key.currentState!.validate()) {
              _key.currentState!.save();
              print(_email);
              print(_password);
              runMutation({"email": _email, "password": _password});
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: Text(
            Localization.of(context)!.loginTitle,
            style:
                const TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
          ),
        ),
      );

/*  Widget _getLoginButton() => Container(
    width: double.infinity,
    height: 50,
    margin: const EdgeInsets.all(20),
    child: RaisedButton(
      color: const Color(0xFFF05A28),
      textColor: Colors.white,
      elevation: 1.0,
      onPressed: _loginPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Text(
        Localization.of(context)!.loginTitle,
        style: const TextStyle(fontSize: 16.0, fontFamily: "Comfortaa-Bold"),
      ),
    ),
  );*/

  Widget _getPasswordTextField() => Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.done,
          focusNode: _passwordFocus,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
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
          ),
          onSaved: (value) {
            _password = value!;
          },
          validator: (value) {
            return Utils().onValidationPassword(value!);
          },
          obscureText: _passwordVisible,
          onFieldSubmitted: (_) {
            _passwordFocus.unfocus();
          },
        ),
      );

  void _loginPressed() {
    NavigationUtils.push(context, routeHomePage);
  }

  void _registerPressed() {
    NavigationUtils.push(context, routeRegister);
  }

  void _forgotPasswordPressed() {
    NavigationUtils.push(context, routeForgotPassword);
  }
}
