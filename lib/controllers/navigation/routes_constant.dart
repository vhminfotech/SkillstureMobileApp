import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:skillsture_project/controllers/auth/instructor/instructor_register_first_controller.dart';
import 'package:skillsture_project/controllers/auth/learner/login_controller.dart';
import 'package:skillsture_project/models/bindings/explore_skill_details_binding.dart';
import 'package:skillsture_project/models/bindings/first_course_list_binding.dart';
import 'package:skillsture_project/models/bindings/home_page_binding.dart';
import 'package:skillsture_project/models/bindings/instructor_register_binding.dart';
import 'package:skillsture_project/models/bindings/instructor_register_third_binding.dart';
import 'package:skillsture_project/models/bindings/login_binding.dart';
import 'package:skillsture_project/views/dashboard/dashboard_page.dart';
import 'package:skillsture_project/views/home/ui/homepage_instructor.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_first.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_second.dart';
import 'package:skillsture_project/views/auth/instructor/register_instructor_third.dart';
import 'package:skillsture_project/views/explore_skills/explore_skill_details_screen.dart';
import 'package:skillsture_project/views/explore_skills/explore_skill_screen.dart';
import 'package:skillsture_project/splash.dart';
import 'package:skillsture_project/views/more/more_page.dart';
import 'package:skillsture_project/views/my_learning/my_learning_page.dart';
import 'package:skillsture_project/views/my_teaching/my_teaching_page.dart';
import 'package:skillsture_project/views/search/search_page.dart';
import '../../models/bindings/dashboard_page_binding.dart';
import '../../models/bindings/explore_skill_binding.dart';
import '../../models/bindings/instructor_register_second_binding.dart';
import '../../models/bindings/register_binding.dart';
import '../../models/bindings/second_course_list_binding.dart';
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
  static String routeHomePageInstructor = "/routeHomePageInstructor";
  static String routeDashBoardPage = "/routeDashBoardPage";
  static String routeSearchPage = "/routeSearchPage";
  static String routeMyTeachingPage = "/routeMyTeachingPage";
  static String routeMyLearningPage = "/routeMyLearningPage";
  static String routeMorePage = "/routeMorePage";

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

  static String getRouteHomePageInstructor() => routeHomePageInstructor;

  static String getRouteDashBoardPage() => routeDashBoardPage;

  static String getRouteSearchPage() => routeSearchPage;

  static String getRouteMyTeachingPage() => routeMyTeachingPage;

  static String getRouteMyLearningPage() => routeMyLearningPage;

  static String getRouteMorePage() => routeMorePage;

  static List<GetPage> routes = [
    GetPage(name: routeLaunch, page: () => SplashScreen()),
    GetPage(
        name: routeLogin, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: routeRegister,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(name: routeForgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: routeCheckYourMail, page: () => CheckYourMailScreen()),
    GetPage(
        name: routeHomePage,
        page: () => HomePageScreen(),
        binding: HomePageBinding()),
    GetPage(
        name: routeFirstCourseList,
        page: () => FirstCourseListScreen(),
        binding: FirstCourseListBinding()),
    GetPage(
        name: routeSecondCourseList,
        page: () => SecondCourseListScreen(),
        binding: SecondCourseListBinding()),
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
    GetPage(name: routeHomePageInstructor, page: () => HomePageInstructor()),
    GetPage(
        name: routeDashBoardPage,
        page: () => DashboardPageScreen(),
        binding: DashBoardPageBinding()),
    GetPage(name: routeSearchPage, page: () => SearchPageScreen()),
    GetPage(name: routeMyTeachingPage, page: () => MyTeachingPageScreen()),
    GetPage(name: routeMyLearningPage, page: () => MyLearningPageScreen()),
    GetPage(name: routeMorePage, page: () => MorePageScreen()),
  ];
}
