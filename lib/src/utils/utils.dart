import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  final colors = [
    const Color(0xFFEDEDED),
    const Color(0xFFE2EFDA),
    const Color(0xFFBDD7EE),
    const Color(0xFFFCE4D6),
    const Color(0xFFFCE4D6),
    const Color(0xFFFFF2CC),
  ];

  final index = Random().nextInt(colors.length);

  return colors[index];
}
