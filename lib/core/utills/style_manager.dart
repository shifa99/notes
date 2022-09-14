import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/values_manager.dart';

TextStyle buildTextStyle({required double fontSize, required Color color}) =>
    TextStyle(
      fontSize: fontSize,
      height: 2.h,
      color: color,
    );
TextStyle headerTextStyle({Color? color}) {
  return buildTextStyle(fontSize: 25.sp, color: color ?? Colors.black);
}

TextStyle bodyStyle({Color? color}) {
  return buildTextStyle(fontSize: 16.sp, color: color ?? Colors.black);
}

TextStyle hintStyle({Color? color}) {
  return buildTextStyle(
      fontSize: 13.sp, color: color ?? ColorManager.semiBlackColor);
}
