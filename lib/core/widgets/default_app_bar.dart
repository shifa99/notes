import 'package:flutter/material.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';

AppBar defaultAppbar(
    {required String title, Color? backgroundColor, List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor ?? ColorManager.primaryColor,
    actions: actions ?? [],
    title: Text(
      title,
      style: headerTextStyle(color: Colors.white),
    ),
  );
}
