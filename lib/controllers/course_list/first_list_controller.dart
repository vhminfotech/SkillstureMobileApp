import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/quiz_one_skill_list.dart';
import '../graphqlconfigs/graphql_provider.dart';
import '../graphqlconfigs/mutation_query.dart';
import '../navigation/routes_constant.dart';

class FirstListController extends GetxController {
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();

  Rx<List<QuizOneSkillList>> searchCourse = Rx<List<QuizOneSkillList>>([]);

  Rx<List<QuizOneSkillList>> selectedCourse = Rx<List<QuizOneSkillList>>([]);

  Rx<String> selectedSkillId = Rx<String>("");

  Rx<List<QuizOneSkillList>> getQuizOneList = Rx<List<QuizOneSkillList>>([]);

  Rx<List<String>> quizOneSelectedSkill = Rx<List<String>>([]);


  @override
  void onInit() {
    super.onInit();
    getQuizOneSkillList();
    selectedCourse.value = [];
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getQuizOneSkillList() async {
    GraphQLClient _client = graphqlProviderClass.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getQuizOneSkillList),
      ),
    );
    if(!result.hasException){
      print(result.toString());
      print(result.data.toString());
      var skillList = result.data!["getAllCoreSkill"]["allCoreSkillRes"];
      for(int i=0; i<skillList.length; i++){
        getQuizOneList.value.add(
          QuizOneSkillList(
            skillList[i]["code"],
            skillList[i]["_id"],
            skillList[i]["type"],
            skillList[i]["skillName"],
          ),
        );
      }
      searchCourse.value = getQuizOneList.value;
    }
  }

  void searchFirstListCourse(String courseTitle) {
    List<QuizOneSkillList> resultCourse = [];
    if (courseTitle.isEmpty) {
      resultCourse = getQuizOneList.value;
    } else {
      resultCourse = getQuizOneList.value
          .where((element) =>
              element.skillName.toLowerCase().contains(courseTitle.toLowerCase()))
          .toList();
    }
    searchCourse.value = resultCourse;
  }

  void selectedFirstListCourse(QuizOneSkillList CourseSelected) {
    selectedSkillId.value = CourseSelected.skillId;
    List<QuizOneSkillList> resultSelected = [];
    if (resultSelected.contains(CourseSelected)) {
      resultSelected.remove(CourseSelected);
    } else {
      resultSelected.add(CourseSelected);
    }
    selectedCourse.value = resultSelected;
  }

  bool selectToChangeColour(QuizOneSkillList CourseColorChange) {
    if (selectedCourse.value.contains(CourseColorChange)) {
      return true;
    } else {
      return false;
    }
  }

  void removeFromBottomSheetList(QuizOneSkillList CourseRemove) {
    selectedCourse.value.remove(CourseRemove);
    selectedCourse.value = selectedCourse.value;
    selectedCourse.refresh();
    print(CourseRemove);
  }

  void nextButtonPressed() {
    if (selectedCourse.value.isEmpty) {
      Get.snackbar("Error", "Please select the course",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      getSelectedSkillList();
      Get.toNamed(RoutesConstant.getRouteSecondCourseList(),
      arguments: selectedSkillId.value);
      quizOneSelectedSkill.value.clear();
    }
  }

  void getSelectedSkillList(){
    for(int i=0; i<selectedCourse.value.length; i++){
      quizOneSelectedSkill.value.add(selectedCourse.value[i].skillName);
    }
    print(quizOneSelectedSkill.value.toString());
  }
}
