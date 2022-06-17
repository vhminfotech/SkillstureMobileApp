import 'package:flutter/material.dart';

class DividerContainer extends StatefulWidget {
  final double topMargin;
  const DividerContainer({Key? key, required this.topMargin}) : super(key: key);

  @override
  State<DividerContainer> createState() => _DividerContainerState();
}

class _DividerContainerState extends State<DividerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topMargin, left: 10),
      height: 4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFF05A28),
              Color(0xFFF05A28),
              Color(0xFFD4D4D4),
            ],
            stops: [
              0, 0.35, 0.35
            ]
        ),
      ),
    );
  }
}
