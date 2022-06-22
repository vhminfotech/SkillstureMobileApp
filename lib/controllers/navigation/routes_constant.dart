import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_first_controller.dart';
import 'package:skillsture_project/models/bindings/explore_skill_details_binding.dart';
import 'package:skillsture_project/models/bindings/first_course_list_binding.dart';
import 'package:skillsture_project/models/bindings/instructor_register_binding.dart';
import 'package:skillsture_project/models/bindings/instructor_register_third_binding.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_first.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_second.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_third.dart';
import 'package:skillsture_project/views/explore_skills/explore_skill_details_screen.dart';
import 'package:skillsture_project/views/explore_skills/explore_skill_screen.dart';
import 'package:skillsture_project/views/splash.dart';
import '../../models/bindings/explore_skill_binding.dart';
import '../../models/bindings/instructor_register_second_binding.dart';
import '../../views/auth/learner/check_your_mail.dart';
import '../../views/auth/learner/forgot_password.dart';
import '../../views/auth/learner/login.dart';
import '../../views/auth/learner/register.dart';
import '../../views/course_list/ui/first_course_list.dart';
import '../../views/course_list/ui/second_course_list.dart';
import '../../views/home/ui/homepage.dart';

class RoutesConstant {
  static String routeLaunch = "/";
  static String routeLogin = "/routeLogin";
  static String routeRegister = "/routeRegister";
  static String routeForgotPassword = "/routeForgotPassword";
  static String routeCheckYourMail = "/routeCheckYourMail";
  static String routeHomePage = "/routeHomePage";
  static String routeFirstCourseList = "/routeFirstCourseList";
  static String routeSecondCourseList = "/routeSecondCourseList";
  static String routeExploreSkills = "/routeExploreSkills";
  static String routeExploreSkillDetails = "/routeExploreSkillDetails";
  static String routeRegisterInstructorFirst = "/routeRegisterInstructorFirst";
  static String routeRegisterInstructorSecond =
      "/routeRegisterInstructorSecond";
  static String routeRegisterInstructorThird = "/routeRegisterInstructorThird";

  static String getRouteLaunch() => routeLaunch;

  static String getRouteLogin() => routeLogin;

  static String getRouteRegister() => routeRegister;

  static String getRouteForgotPassword() => routeForgotPassword;

  static String getRouteCheckYourMail() => routeCheckYourMail;

  static String getRouteHomePage() => routeHomePage;

  static String getRouteFirstCourseList() => routeFirstCourseList;

  static String getRouteSecondCourseList() => routeSecondCourseList;

  static String getRouteExploreSkills() => routeExploreSkills;

  static String getRouteExploreSkillDetails() => routeExploreSkillDetails;

  static String getRouteRegisterInstructorFirst() =>
      routeRegisterInstructorFirst;

  static String getRouteRegisterInstructorSecond() =>
      routeRegisterInstructorSecond;

  static String getRouteRegisterInstructorThird() =>
      routeRegisterInstructorThird;

  static List<GetPage> routes = [
    GetPage(name: routeLaunch, page: () => SplashScreen()),
    GetPage(name: routeLogin, page: () => LoginScreen()),
    GetPage(name: routeRegister, page: () => RegisterScreen()),
    GetPage(name: routeForgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: routeCheckYourMail, page: () => CheckYourMailScreen()),
    GetPage(name: routeHomePage, page: () => HomePageScreen()),
    GetPage(
        name: routeFirstCourseList,
        page: () => FirstCourseListScreen(),
        binding: FirstCourseListBinding()),
    GetPage(name: routeSecondCourseList, page: () => SecondCourseList()),
    GetPage(
        name: routeExploreSkills,
        page: () => ExploreSkillsScreen(),
        binding: ExploreSkillBinding()),
    GetPage(
        name: routeExploreSkillDetails,
        page: () => ExploreSkillDetailsScreen(),
        binding: ExploreSkillDetailsBinding()),
    GetPage(
        name: routeRegisterInstructorFirst,
        page: () => RegisterInstructorFirstScreen(),
        binding: InstructorRegisterBinding()),
    GetPage(
        name: routeRegisterInstructorSecond,
        page: () => RegisterInstructorSecondScreen(),
        binding: InstructorRegisterBindingSecond()),
    GetPage(
      name: routeRegisterInstructorThird,
      page: () => RegisterInstructorThirdScreen(),
      binding: InstructorRegisterBindingThird()),
  ];
}
