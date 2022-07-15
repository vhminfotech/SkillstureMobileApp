import 'package:get/get.dart';
import '../../constants/performance_livestream_model_list.dart';
import '../../constants/search_upcoming_model_list.dart';
import '../../models/performance_livestream_model.dart';
import '../../models/search_upcoming_livestream_model.dart';

class SearchPageController extends GetxController {
  Rx<List<TeachingPerformanceLiveStreamModel>> ongoingLivestreamList =
  Rx<List<TeachingPerformanceLiveStreamModel>>([]);

  Rx<List<TeachingPerformanceLiveStreamModel>> ongoingLivestreamListPost =
  Rx<List<TeachingPerformanceLiveStreamModel>>([]);

  Rx<List<SearchUpcomingLivestreamModel>> upcomingLivestreamList =
  Rx<List<SearchUpcomingLivestreamModel>>([]);

  Rx<List<String>> selectedBottomItem = Rx<List<String>>([]);
  final selectedItem = Rx<String>("Livestream");
  final bottomSheetIconVisible = Rx<bool>(false);
  final selectedIndex = RxInt(0);
  final List<String> SearchItemList = [
    "Livestream",
    "Instructor",
  ];

  Rx<List<String>> selectedBottomStatus = Rx<List<String>>([]);
  final selectedStatusIcon = Rx<bool>(false);
  final selectedStatusIndex = RxInt(0);
  final selectedStatus = Rx<String>("All Status");
  final List<String> StatusList = [
    "All Status",
    "Ongoing",
    "Upcoming",
    "Past",
  ];

  Rx<List<String>> teachingAreas = Rx<List<String>>([]);
  Rx<List<String>> selectedBottomSkill = Rx<List<String>>([]);
  final selectedSkillIcon = Rx<bool>(false);
  final selectedSkillIndex = RxInt(0);
  final selectedSkill = Rx<String>("All Status");
  final List<String> SkillList = [
    "All Skills",
    "Accounting",
    "Adobe Suites",
    "Agile Business Analysis",
    "Animation",
    "Application Programming Interface ",
    "B2B Sales",
    "Booking Keeping",
    "Office Suites",
    "Data Analysis",
  ];


  @override
  void onInit() {
    super.onInit();
    ongoingLivestreamList.value = performanceLivestreamList;
    ongoingLivestreamListPost.value = performanceLivestreamListPost;
    upcomingLivestreamList.value = searchUpcomingList;
    selectedBottomItem.value = SearchItemList;
    bottomSheetIconVisible.value = false;
    selectedIndex.value = 0;
    selectedItem.value = "Livestream";
    selectedBottomStatus.value = StatusList;
    selectedStatusIcon.value = false;
    selectedStatusIndex.value = 0;
    selectedStatus.value = "All Status";
    selectedBottomSkill.value = SkillList;
    selectedSkillIcon.value = false;
    selectedSkillIndex.value = 0;
    selectedSkill.value = "All Skills";
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void checkedSearchTypeColor(int index) {
    selectedIndex.value = index;
  }

  void selectedTypeForSearch(String value) {
    selectedItem.value = value;
    List<String> resultSearchType = [];
    if (value.isEmpty) {
      resultSearchType = SearchItemList;
    } else if (value == "Livestream"){
      resultSearchType = SearchItemList;
    } else{
      resultSearchType = SearchItemList
          .where((element) => element
          .toLowerCase()
          .contains(value.toLowerCase()))
          .toList();
    }
  }

  void checkedFilterStatusColor(int index) {
    selectedStatusIndex.value = index;
  }

  void selectedFilterStatus(String value) {
    selectedStatus.value = value;
    List<String> resultStatus = [];
    if (value.isEmpty) {
      resultStatus = StatusList;
    } else if (value == "All Status"){
      resultStatus = StatusList;
    } else{
      resultStatus = StatusList
          .where((element) => element
          .toLowerCase()
          .contains(value.toLowerCase()))
          .toList();
    }
  }

  void checkedFilterSkillColor(int index) {
    selectedSkillIndex.value = index;
  }

  void selectedFilterSkill(String value) {
    selectedSkill.value = value;
    List<String> resultSkill = [];
    if (value.isEmpty) {
      resultSkill = SkillList;
    } else if (value == "All Status"){
      resultSkill = SkillList;
    } else{
      resultSkill = SkillList
          .where((element) => element
          .toLowerCase()
          .contains(value.toLowerCase()))
          .toList();
    }
  }

  void addChipItem(String value) {
    if (value.isEmpty) {
      return;
    } else if (teachingAreas.value.contains(value)) {
      teachingAreas.value.remove(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
    } else {
      teachingAreas.value.add(value);
      teachingAreas.value = teachingAreas.value;
      teachingAreas.refresh();
    }
  }

  bool selectToChangeColour(String CourseColorChange) {
    if (teachingAreas.value.contains(CourseColorChange)) {
      return true;
    } else {
      return false;
    }
  }

  void clearSkillFilterList(){
    teachingAreas.value.clear();
    teachingAreas.value = teachingAreas.value;
    teachingAreas.refresh();
  }

}