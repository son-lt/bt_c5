import 'package:flutter/material.dart';

class AppTextStyles {
  static const primaryS20 = TextStyle(fontSize: 20);
  static final primaryS20W600 =
      primaryS20.copyWith(fontWeight: FontWeight.w600);

  static const white = TextStyle(color: Colors.white);
  static final whiteS20 = white.copyWith(fontSize: 20);
  static final whiteS20W600 = whiteS20.copyWith(fontWeight: FontWeight.w600);

  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18W600 = whiteS18.copyWith(fontWeight: FontWeight.w600);
}
