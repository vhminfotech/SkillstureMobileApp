import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String label;
  const HeaderImage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/header.jpg',
          width: double.infinity,
          height: (MediaQuery.of(context).size.height) / 4,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: (MediaQuery.of(context).size.height) / 5,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text( label,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: "Cocogoose-Regular")),
          ),
        )
      ],
    );
  }
}
