import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/quiz_two_skill_list.dart';
import '../graphqlconfigs/graphql_provider.dart';
import '../graphqlconfigs/mutation_query.dart';
import '../navigation/routes_constant.dart';

class SecondListController extends GetxController{
  final GraphqlProviderClass graphqlProviderClass = GraphqlProviderClass();

  Rx<List<QuizTwoSkillList>> searchCourseSecond = Rx<List<QuizTwoSkillList>>([]);

  Rx<List<QuizTwoSkillList>> selectedCourseSecond = Rx<List<QuizTwoSkillList>>([]);

  Rx<String> selectedParentSkillId = Rx<String>("");

  Rx<List<QuizTwoSkillList>> getQuizTwoList = Rx<List<QuizTwoSkillList>>([]);

  Rx<List<String>> quizTwoSelectedSkills = Rx<List<String>>([]);

  @override
  void onInit() {
    super.onInit();
    selectedParentSkillId.value = Get.arguments;
    print(selectedParentSkillId.value);
    //searchCourseSecond.value = courseItemsSecond;
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
    GraphQLClient _client = graphqlProviderClass.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(MutationQuery().getQuizSecondSkillList),
        variables: {
          "coreSkillId": selectedParentSkillId.value.toString(),
        },
      ),
    );
    if(!result.hasException){
      print(result.toString());
      print(result.data.toString());
      var skillList = result.data!["getAllChildSkill"]["allChildSkillRes"];
      for(int i=0; i<skillList.length; i++){
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
  void selectedSecondListCourse(QuizTwoSkillList CourseSelected){
    if(resultSelected.contains(CourseSelected)){
      resultSelected.remove(CourseSelected);
    } else {
      resultSelected.add(CourseSelected);
    }
    resultSelected = resultSelected;
    selectedCourseSecond.value = resultSelected;
    selectedCourseSecond.refresh();
  }

  bool selectToChangeColour(QuizTwoSkillList CourseColorChange){
    if(selectedCourseSecond.value.contains(CourseColorChange)){
      return true;
    } else{
      return false;
    }
  }

  void removeFromBottomSheetList(QuizTwoSkillList CourseRemove){
    selectedCourseSecond.value.remove(CourseRemove);
    selectedCourseSecond.value = selectedCourseSecond.value;
    selectedCourseSecond.refresh();
  }

  void nextButtonPressed(){
    if(selectedCourseSecond.value.isEmpty){
      Get.snackbar("Error", "Please select the course",snackPosition: SnackPosition.BOTTOM);
    }
    else{
      getSelectedSecondSkillList();
      Get.toNamed(
        RoutesConstant.getRouteDashBoardPage(),);
      quizTwoSelectedSkills.value.clear();
    }
  }

  void getSelectedSecondSkillList(){
    for(int i=0; i<selectedCourseSecond.value.length; i++){
      quizTwoSelectedSkills.value.add(selectedCourseSecond.value[i].childSkillName);
    }
    print(quizTwoSelectedSkills.value.toString());
  }
}