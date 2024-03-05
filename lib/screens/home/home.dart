import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/history/history.dart';
import 'package:task_manager/screens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskScreen())),
        backgroundColor: whiteText,
        focusColor: blackText,
        child: const Icon(Icons.add_outlined),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  const Icon(Icons.apps),
                  SizedBox(width: 30.sp),

                  //*********  Task Manager Text *********/
                  RichText(
                    text: TextSpan(children: [
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
                  ),
                  SizedBox(width: 60.sp),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
                    child: Icon(Icons.history_outlined, color: blackText, size: 25.sp)),
                  
                  SizedBox(width: 30.sp),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen())),
                    child: Icon(Icons.settings_outlined, color: blackText, size: 25.sp)),
                ],
              ),
            ),

            SizedBox(height: 20.sp),

            //*********  Container *********/
            Container(
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
                Checkbox(
                  value: isChecked,
                  checkColor: blackText,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
