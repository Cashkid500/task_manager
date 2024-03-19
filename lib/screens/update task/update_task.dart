import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/home/home.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return;
    dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
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
              controller: titleController,
            ),

            SizedBox(height: 40.sp),

            //********* Description TextField *********/
            TextFieldWidget(
              height: 74.sp,
              labelTextPath: TaskManagerText.description,
              keyboardType: TextInputType.multiline,
              controller: descriptionController,
            ),

            SizedBox(height: 40.sp),

            //********* Date TextField *********/
            SizedBox(
              height: 54.sp,
              width: 320.sp,
              child: TextField(
                keyboardType: TextInputType.datetime,
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                  isCollapsed: true,
                  labelText: TaskManagerText.dateText,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    color: blackText,
                    fontFamily: TaskManagerAssetsPath.taskManagerFont,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: GestureDetector(
                      onTap: () => onTapFunction(context: context),
                      child: const Icon(Icons.calendar_today_outlined)),
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
