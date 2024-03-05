import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/home/home.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())),
                      child: const Icon(Icons.arrow_back_ios)),
                  SizedBox(width: 30.sp),

                  //*********  Add Task Text *********/
                  Text(
                    TaskManagerText.addTask,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.sp),

            //********* TextField *********/
            SizedBox(
              height: 54.sp,
              width: 320.sp,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                  isCollapsed: true,
                  labelText: TaskManagerText.title,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: blackText,
                    fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    fontWeight: FontWeight.normal,
                  ),
                  filled: true,
                  fillColor: whiteText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5.sp,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.sp),

            //********* Description TextField *********/
            SizedBox(
              height: 74.sp,
              width: 320.sp,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                  isCollapsed: true,
                  labelText: TaskManagerText.description,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: blackText,
                    fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    fontWeight: FontWeight.normal,
                  ),
                  filled: true,
                  fillColor: whiteText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5.sp,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.sp),

            //********* Add Button *********/
            Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Container(
                height: 59.sp,
                width: 327.sp,
                decoration: BoxDecoration(
                    color: redText,
                    borderRadius: BorderRadius.circular(43.r)),
                child: Center(
                  child: Text(
                    TaskManagerText.add,
                    style: TextStyle(
                        fontFamily: TaskManagerAssetsPath.taskManagerFont,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                        color: whiteText),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
