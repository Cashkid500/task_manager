import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/history/history.dart';
import 'package:task_manager/screens/home/home.dart';
import 'package:task_manager/screens/settings/settings.dart';
import 'package:task_manager/screens/update%20task/update_task.dart';

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

//*********************************************************/
//***************   Task Manager Drawer Widget ********************/
//*********************************************************/
class TaskManagerDrawerWidget extends StatelessWidget {
  const TaskManagerDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.sp),
          child: Column(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: TaskManagerText.task,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    ),
                  ),
                  TextSpan(
                    text: TaskManagerText.manager,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    ),
                  ),
                ]),
              ),
      
              const Divider(),
      
              SizedBox(
                height: 30.sp,
              ),
      
              //************  Add Task Row ************
              DrawerRowWidget(
                drawerRowText: TaskManagerText.addTask,
                icon: Icons.add_outlined,
                color: blackText,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTaskScreen())),
              ),
      
              SizedBox(height: 30.sp,),

              //************  Fetch Task Row ************
              DrawerRowWidget(
                drawerRowText: TaskManagerText.fetchTask,
                icon: Icons.home,
                color: blackText,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),),
              ),
      
              SizedBox(
                height: 30.sp,
              ),
      
              //************  Delete Task Row ************
              DrawerRowWidget(
                drawerRowText: TaskManagerText.deleteTask,
                icon: Icons.restore_from_trash,
                color: Colors.red,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen())),
              ),
      
              SizedBox(
                height: 30.sp,
              ),
      
              //************  History Row ************
              DrawerRowWidget(
                drawerRowText: TaskManagerText.history,
                icon: Icons.history_outlined,
                color: blackText,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen())),
              ),
      
              SizedBox(
                height: 30.sp,
              ),
      
              //************  Settings Row ************
              DrawerRowWidget(
                drawerRowText: TaskManagerText.settings,
                icon: Icons.settings_outlined,
                color: blackText,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//*********************************************************/
//***************   Drawer Row Widget ********************/
//*********************************************************/
class DrawerRowWidget extends StatelessWidget {
  const DrawerRowWidget({
    super.key,
    required this.drawerRowText,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final String drawerRowText;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.sp, left: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            drawerRowText,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
              fontFamily: TaskManagerAssetsPath.taskManagerFont,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(icon, color: color, size: 25.sp),
          ),
        ],
      ),
    );
  }
}
