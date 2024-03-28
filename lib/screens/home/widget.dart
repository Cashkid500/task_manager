import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/text_constants.dart';

//*********************************************************/
//***************   Rich Text Widget ********************/
//*********************************************************/
class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
        TextSpan(
          text: TaskManagerText.task,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            fontFamily: TaskManagerAssetsPath.taskManagerFont,
          ),
        ),
        TextSpan(
          text: TaskManagerText.manager,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            fontFamily: TaskManagerAssetsPath.taskManagerFont,
          ),
        ),
      ]),
    );
  }
}

//*********************************************************/
//***************   Pending Task Widget ********************/
//*********************************************************/
class PendingTaskWidget extends StatelessWidget {
  const PendingTaskWidget({
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
          TaskManagerText.pending,
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
