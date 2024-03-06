import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/home/home.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            //*********  Header *********/
            const HeaderWidget(rowTextPath: TaskManagerText.updateTask,),

            SizedBox(height: 60.sp),

            //********* Title TextField *********/
            TextFieldWidget(
              height: 54.sp,
              labelTextPath: TaskManagerText.title,
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: 40.sp),

            //********* Description TextField *********/
            TextFieldWidget(
              height: 74.sp,
              labelTextPath: TaskManagerText.description,
              keyboardType: TextInputType.multiline,
            ),

            SizedBox(height: 40.sp),

            //********* Date TextField *********/
            TextFieldWidget(
              height: 54.sp,
              labelTextPath: TaskManagerText.dateText,
              keyboardType: TextInputType.datetime,
            ),

            SizedBox(height: 40.sp),

            //********* Update Button *********/
            AddButton(
                textPath: TaskManagerText.update,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()))),
            
            SizedBox(height: 20.sp),

            //********* Delete Button *********/
            AddButton(
                textPath: TaskManagerText.delete,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()))),
          ]),
        ),
      ),
    );
  }
}
