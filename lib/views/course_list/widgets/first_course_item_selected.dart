import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/navigation/routes_constant.dart';

class FirstCourseItemSelected extends StatefulWidget {
  const FirstCourseItemSelected({Key? key}) : super(key: key);

  @override
  State<FirstCourseItemSelected> createState() =>
      _FirstCourseItemSelectedState();
}

class _FirstCourseItemSelectedState extends State<FirstCourseItemSelected> {
  final TextEditingController _textController = TextEditingController();

  static List<String> items = [
    "Arts & Design",
    "Business",
    "Data Science",
    "Healthcare",
    "Music",
    "Advertising & Marketing",
    "Computer Science",
    "Information Technology",
    "Finance & Accounting",
    "Development"
  ];

  List<String> newDataList = List.from(items);

  onItemChanged(String value) {
    setState(() {
      newDataList = items
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  List<String> tempArray = [];
  List<String> temp1Array = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getSearchView(),
        Container(
          padding: EdgeInsets.all(5.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (tempArray.contains(items[index].toString())) {
                      tempArray.remove(items[index].toString());
                      temp1Array.remove(items[index].toString());
                    } else if (tempArray.length == 1) {
                      tempArray = tempArray;
                    } else if (!tempArray.contains(items[index].toString())) {
                      temp1Array.clear();
                      tempArray.add(items[index].toString());
                      temp1Array.addAll(tempArray);
                    }
                  });
                  print(tempArray.toString());
                  showModalBottomSheet(
                    enableDrag: false,
                    context: context,
                    /* builder: (context) => FirstBottomSheet(
                      itemArray: tempArray,
                    ),*/
                    builder: (context) => _showBottomSheet(),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(
                    10,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: tempArray.contains(items[index].toString())
                        ? const Color(0xFFF05A28)
                        : Colors.transparent,
                    border: Border.all(
                      color: tempArray.contains(items[index].toString())
                          ? const Color(0xFFF05A28)
                          : Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      newDataList[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Comfortaa-Regular",
                          fontSize: 16.0),
                    ),
                  ),
                ),
              );
            },
            itemCount: newDataList.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: const Text(
            "Load More",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Comfortaa-Regular",
                fontSize: 20.0),
          ),
        )
      ],
    );
  }

  Widget _showBottomSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 15),
          child: Text(
            "Selected (1/1):",
            style: TextStyle(
                color: Color(0xff262261),
                fontFamily: "Comfortaa-Medium",
                fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 80.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: temp1Array.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    tempArray.clear();
                    temp1Array.clear();
                    print("array: $temp1Array ==== $tempArray");
                    Navigator.pop(context, true);
                  });
                },
                child: _getSelectedListItems(
                  temp1Array[index].toString(),
                ),
              );
            },
          ),
        ),
        _getNextButton()
      ],
    );
  }

  Widget _getNextButton() => Container(
        margin: const EdgeInsets.all(10.0),
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFF05A28)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFF05A28)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      side: BorderSide(color: Color(0xFFF05A28))))),
          onPressed: () {
            Get.toNamed(
              RoutesConstant.getRouteSecondCourseList(),
            );
          },
          child: const Text(
            "Next",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Comfortaa-Regular",
                fontSize: 16.0),
          ),
        ),
      );

  Widget _getSelectedListItems(String courseName) => Container(
        margin: const EdgeInsets.all(10.0),
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFEEDC5),
            border: Border.all(
              color: const Color(0xFFFEEDC5),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  courseName,
                  style: const TextStyle(
                      color: Color(0xff262261),
                      fontFamily: "Comfortaa-Regular",
                      fontSize: 16.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.close,
                  color: Color(0xff262261),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _getSearchView() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10.0, right: 20, bottom: 20),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Colors.white,
        controller: _textController,
        onChanged: onItemChanged,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.white,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
