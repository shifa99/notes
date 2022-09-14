import 'package:flutter/material.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';

TextButton defaultTextButton(
    {required Function onPressed,
    required String title,
    Color? buttonColor,
    Color? textColor}) {
  return TextButton(
    onPressed: () {
      onPressed();
    },
    // ignore: sort_child_properties_last
    child: Text(
      title,
      style: bodyStyle(color: textColor ?? Colors.white),
    ),
    style: TextButton.styleFrom(
      backgroundColor: buttonColor ?? ColorManager.primaryColor,
    ),
  );
}
