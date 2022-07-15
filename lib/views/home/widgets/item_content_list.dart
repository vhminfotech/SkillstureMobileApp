import 'package:flutter/material.dart';
import 'package:skillsture_project/models/content_model.dart';

class ContentList extends StatelessWidget {
  final ContentModel contentModel;

  const ContentList({Key? key, required this.contentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              contentModel.title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF262261),
                  fontFamily: "Cocogoose-Regular"),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                color: Color(0x0D262261),
                borderRadius: new BorderRadius.all(const Radius.circular(5.0))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                contentModel.desc,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF707070),
                    fontFamily: "Comfortaa-Regular"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
