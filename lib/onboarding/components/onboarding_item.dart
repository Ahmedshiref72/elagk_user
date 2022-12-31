import 'package:flutter/cupertino.dart';

import '../controllers/onboarding_model.dart';

Widget buildBoardingItem(BoardingModel model) {
  return Stack(
    children: [
      Container(
        color: model.color,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}',),

            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );
}