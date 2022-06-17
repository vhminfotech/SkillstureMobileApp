import 'package:flutter/material.dart';
import 'package:skillsture_project/course_list/ui/second_course_list.dart';

import '../auth/ui/check_your_mail.dart';
import '../auth/ui/forgot_password.dart';
import '../auth/ui/login.dart';
import '../auth/ui/register.dart';
import '../constants/constants.dart';
import '../course_list/ui/first_course_list.dart';
import '../home/ui/homepage.dart';
import '../splash.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeRegister:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeLaunch:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeForgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case routeCheckYourMail:
        return MaterialPageRoute(builder: (_) => const CheckYourMailScreen());
      case routeHomePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case routeFirstCourseList:
        return MaterialPageRoute(builder: (_) => const FirstCourseList());
      case routeSecondCourseList:
        return MaterialPageRoute(builder: (_) => const SecondCourseList());
      default:
        return _errorRoute(" Coming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}
