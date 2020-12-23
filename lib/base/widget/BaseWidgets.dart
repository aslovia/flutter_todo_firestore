import 'package:flutter/material.dart';

import '../../main.dart';

class BaseWidgets {
  Widget displayBackground(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -64,
          right: -128,
          child: Container(
            width: 256.0,
            height: 256.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9000),
              color: mainColor,
            ),
          ),
        ),
        Positioned(
          top: -164,
          right: -8.0,
          child: Container(
            width: 256.0,
            height: 256.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9000),
              backgroundBlendMode: BlendMode.hardLight,
              color: Colors.redAccent.withOpacity(0.8),
            ),
          ),
        )
      ],
    );
  }

  // Widget displayFormAddEdit(BuildContext context) {
  //   return
  // }
}