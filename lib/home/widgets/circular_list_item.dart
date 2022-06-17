import 'package:flutter/material.dart';
import 'package:skillsture_project/utils.dart';

class CircularListItem extends StatelessWidget {
  const CircularListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          //padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: const Color(0xFF262261),
            ),
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user-avatar.png'),
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          "Instruct...",
          style: Utils.styleTextStyleCircularListTextField(),
        ),
      ],
    );
  }
}
