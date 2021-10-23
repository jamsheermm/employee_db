import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const TextStyle boldTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20.0,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle normalSmallTextStyle = TextStyle(
    fontSize: 10.0,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );
}
