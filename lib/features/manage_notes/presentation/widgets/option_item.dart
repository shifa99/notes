import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';
import 'package:notes_project/core/utills/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionItem extends StatefulWidget {
  const OptionItem({Key? key}) : super(key: key);

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.size15H, horizontal: AppSizes.size20w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Use Local Database',
                style: bodyStyle(),
              ),
              SizedBox(
                height: AppSizes.size5H,
              ),
              Text(
                'data' * 15,
                style: hintStyle(),
              )
            ],
          )),
          SizedBox(
            width: AppSizes.size20w,
          ),
          Switch.adaptive(
              value: checked,
              activeColor: ColorManager.primaryColor,
              onChanged: (value) {
                checked = value;
                setState(() {});
              }),
        ],
      ),
    );
  }
}
