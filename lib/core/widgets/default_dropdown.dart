import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';

Widget defaultDropdownButton({
  required String title,
  String? value,
  required Function onChanged,
  String? Function(String?)? validator,
  required List<DropdownMenuItem<String>> items,
}) {
  return Container(
    //height: 48.h,
    padding: EdgeInsetsDirectional.only(
      start: 10.w,
    ),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4.r),
      border: Border.all(color: ColorManager.semiBlackColor),
    ),
    child: DropdownButtonFormField<String>(
        isExpanded: true,
        validator: validator,
        decoration: InputDecoration(
          // hintStyle: TextStyle(color: Colors.black),
          focusColor: ColorManager.semiBlackColor,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.semiBlackColor)),
        ),
        iconEnabledColor: const Color(0xff989898),
        value: value,
        onChanged: (value) {
          onChanged(value);
        },
        hint: Text(
          title,
          style: bodyStyle(),
        ),
        items: items),
  );
}
