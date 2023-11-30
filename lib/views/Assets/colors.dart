import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color kPrimary = Color(0xFFD1A661);
  static const Color kWhite = Color(0xFFFEFEFE);
  static LinearGradient customOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );

  static const Color kGrey60 = Color(0xFF9CA4AB);
  static const Color kGrey70 = Color(0xFF78828A);
  static const Color kGrey100 = Color(0xFF171725);
  static const Color bg = Color(0xfff8f8f8);
  static const Color dt = Color(0xfff2f2f2);

  static const Color pop1 = Color(0xffebf3c4);
  static const Color pop2 = Color(0xfff8e3e3);
  static const Color pop3 = Color(0xffc5f1fc);
  static const Color pop4 = Color(0xff90ee90);
}
