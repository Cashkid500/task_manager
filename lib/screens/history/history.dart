import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/home/home.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 20.sp),
          child: Column(
            children: [
            //*********  Header *********/
            const HeaderWidget(rowTextPath: TaskManagerText.history,),

            SizedBox(height: 30.sp),

            //********* Container *********/
            Container(
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
            ),

            SizedBox(height: 20.sp),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*********  Title *********/
                        Text(
                          TaskManagerText.api,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: blackText,
                            fontFamily: TaskManagerAssetsPath.taskManagerFont,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        SizedBox(height: 5.sp),

                        //*********  Description *********/
                        Text(
                          TaskManagerText.handles,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: blackText,
                            fontFamily: TaskManagerAssetsPath.taskManagerFont,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        SizedBox(height: 5.sp),

                        //*********  Date *********/
                        Text(
                          TaskManagerText.date,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: blackText,
                            fontFamily: TaskManagerAssetsPath.taskManagerFont,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                ),

                SizedBox(width: 50.sp),

                //*********  Checkbox *********/
                const Icon(Icons.restore_from_trash, color: Colors.red),
              ],
            ),

            
            const Spacer(),

            Container(
              height: 40.sp,
              width: 160.sp,
              decoration: BoxDecoration(
                color: blackText,
                borderRadius: BorderRadius.circular(30.sp),
              ),
              child: Center(
                child: Text(
                  TaskManagerText.taskReassigned,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: whiteText,
                    fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    fontWeight: FontWeight.normal,
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
