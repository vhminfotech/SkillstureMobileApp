import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/quiz_two_skill_list.dart';
import '../../models/selected_quiz_list.dart';
import '../graphqlconfigs/graphql_provider.dart';
import '../graphqlconfigs/mutation_query.dart';
import '../navigation/routes_constant.dart';

class SecondListController extends GetxController {
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();
  late GraphQLClient _client;
  dynamic argumentData = Get.arguments;
  final loginData = GetStorage();

  Rx<List<QuizTwoSkillList>> searchCourseSecond =
      Rx<List<QuizTwoSkillList>>([]);
  Rx<List<QuizTwoSkillList>> selectedCourseSecond =
      Rx<List<QuizTwoSkillList>>([]);

  Rx<String> userToken = Rx<String>("");
  Rx<String> selectedParentSkillId = Rx<String>("");
  Rx<String> selectedParentSkillName = Rx<String>("");

  Rx<List<QuizTwoSkillList>> getQuizTwoList = Rx<List<QuizTwoSkillList>>([]);
  Rx<List<SelectedQuizList>> quizTwoSelectedSkills =
      Rx<List<SelectedQuizList>>([]);
  List quizTwoSelectedSkillsMap = [];

  @override
  void onInit() {
    super.onInit();
    userToken.value = loginData.read("userId");
    print("UserToken: ${userToken.value}");
    _client = graphqlProviderClass.clientToQuery();
    selectedParentSkillId.value = argumentData[0]["skillId"];
    selectedParentSkillName.value = argumentData[1]["skillName"];
    print(selectedParentSkillId.value);
    print(selectedParentSkillName.value);
    getQuizTwoSkillList();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getQuizTwoSkillList() async {
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getQuizSecondSkillList),
        variables: {
          "coreSkillId": selectedParentSkillId.value.toString(),
        },
      ),
    );
    if (!result.hasException) {
      print(result.toString());
      print(result.data.toString());
      var skillList = result.data!["getAllChildSkill"]["allChildSkillRes"];
      if (skillList.isEmpty) {
        print("@@@@@@@@@@@@@");
        print(result.data);
        Get.snackbar("Error", "No skills found",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        for (int i = 0; i < skillList.length; i++) {
          getQuizTwoList.value.add(
            QuizTwoSkillList(
              skillList[i]["code"],
              skillList[i]["_id"],
              skillList[i]["type"],
              skillList[i]["childSkillName"],
            ),
          );
        }
        searchCourseSecond.value = getQuizTwoList.value;
      }
    } else if (result.exception!.linkException != null) {
      print("!!!!!!!@@@@@@@@@@@@@");
      print(result.exception!.linkException);
      Get.snackbar("Error", "Please connect to internet",
          snackPosition: SnackPosition.BOTTOM);
    } else if (result.exception!.graphqlErrors == true) {
      print("@@@@@@@@@@@@@");
      print(result.exception!.graphqlErrors);
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateQuizSkillToDatabase() async {
    QueryResult result = await _client.mutate(
      MutationOptions(
        document: gql(MutationQuery().updateQuizSkills),
        variables: {
          "userId": userToken.value,
          "coreSkills": [
            {
              "skillsName": selectedParentSkillName.value,
              "skillId": selectedParentSkillId.value
            }
          ],
          "childSkills":quizTwoSelectedSkillsMap
        },
      ),
    );
  }

  void searchSecondListCourse(String courseTitle) {
    List<QuizTwoSkillList> resultCourse = [];
    if (courseTitle.isEmpty) {
      resultCourse = getQuizTwoList.value;
    } else {
      resultCourse = getQuizTwoList.value
          .where((element) => element.childSkillName
              .toLowerCase()
              .contains(courseTitle.toLowerCase()))
          .toList();
    }
    searchCourseSecond.value = resultCourse;
  }

  List<QuizTwoSkillList> resultSelected = [];

  void selectedSecondListCourse(QuizTwoSkillList CourseSelected) {
    if (resultSelected.contains(CourseSelected)) {
      resultSelected.remove(CourseSelected);
    } else {
      resultSelected.add(CourseSelected);
    }
    resultSelected = resultSelected;
    selectedCourseSecond.value = resultSelected;
    selectedCourseSecond.refresh();
  }

  bool selectToChangeColour(QuizTwoSkillList CourseColorChange) {
    if (selectedCourseSecond.value.contains(CourseColorChange)) {
      return true;
    } else {
      return false;
    }
  }

  void removeFromBottomSheetList(QuizTwoSkillList CourseRemove) {
    selectedCourseSecond.value.remove(CourseRemove);
    selectedCourseSecond.value = selectedCourseSecond.value;
    selectedCourseSecond.refresh();
  }

  void nextButtonPressed() {
    if (selectedCourseSecond.value.isEmpty) {
      Get.snackbar("Error", "Please select the course",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      getSelectedSecondSkillList();
      updateQuizSkillToDatabase();
      Get.toNamed(
        RoutesConstant.getRouteDashBoardPage(),
      );
      quizTwoSelectedSkills.value.clear();
    }
  }

  void getSelectedSecondSkillList() {
    for (int i = 0; i < selectedCourseSecond.value.length; i++) {
      quizTwoSelectedSkills.value.add(
        SelectedQuizList(
          selectedCourseSecond.value[i].childSkillName,
          selectedCourseSecond.value[i].childSkillId,
        ),
      );
    }
    for (int j = 0; j < quizTwoSelectedSkills.value.length; j++) {
        var map = {
          'skillsName':quizTwoSelectedSkills.value[j].skillsName,
          'skillId': quizTwoSelectedSkills.value[j].skillId,
        };
        quizTwoSelectedSkillsMap.add(map);
        print('Quiz two skills:: $quizTwoSelectedSkillsMap');
    }
  }
}
