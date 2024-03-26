import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/text_constants.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      width: 310.sp,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 240, 240, 1.0),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Center(
        child: Text(
          TaskManagerText.completed,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.blueGrey,
            fontFamily: TaskManagerAssetsPath.taskManagerFont,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}