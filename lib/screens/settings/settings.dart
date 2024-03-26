import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/widget.dart';
import 'package:task_manager/screens/settings/widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          //*********  Header *********/
          const HeaderWidget(rowTextPath: TaskManagerText.settings,),

          SizedBox(height: 80.sp),

          //********* Logo *********/
          Container(
            height: 80.sp,
            width: 80.sp,
            decoration: BoxDecoration(
              color: whiteText,
              borderRadius: BorderRadius.circular(100.sp),
            ),
            child: Icon(
              Icons.done_sharp,
              size: 50.sp,
              color: greenTeal,
            ),
          ),

          SizedBox(
            height: 10.sp,
          ),

          Text(
            TaskManagerText.taskmanager,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontFamily: TaskManagerAssetsPath.taskManagerFont,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            TaskManagerText.version,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontFamily: TaskManagerAssetsPath.taskManagerFont,
            ),
          ),

          const Dividing(),

          //*********  Clear Data Button *********/
          Container(
            height: 40.sp,
            width: 250.sp,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: Text(
                TaskManagerText.clear,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: whiteText,
                  fontFamily: TaskManagerAssetsPath.taskManagerFont,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 70.sp,
            width: 310.sp,
            child: Divider(
              color: Colors.grey,
              thickness: 1.5.sp,
            ),
          ),

          //*********  Terms and Condition *********/
          Padding(
            padding: EdgeInsets.only(right: 63.sp),
            child: Text(
              TaskManagerText.terms,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.brown,
                fontFamily: TaskManagerAssetsPath.taskManagerFont,
              ),
            ),
          ),

          SizedBox(height: 20.sp),

          //*********  Privacy Policy *********/
          Padding(
            padding: EdgeInsets.only(right: 120.sp),
            child: Text(
              TaskManagerText.privacy,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.brown,
                fontFamily: TaskManagerAssetsPath.taskManagerFont,
              ),
            ),
          ),

          SizedBox(
            height: 50.sp,
            width: 310.sp,
            child: Divider(
              color: Colors.grey,
              thickness: 1.5.sp,
            ),
          ),
        ]),
      ),
    );
  }
}

