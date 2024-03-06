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
          child: Column(
            children: [
            //*********  Header *********/
            const HeaderWidget(rowTextPath: TaskManagerText.addTask,),

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

            //********* Add Button *********/
            AddButton(
                textPath: TaskManagerText.add,
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

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.rowTextPath,
  });
  final String rowTextPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            rowTextPath,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
              fontFamily: TaskManagerAssetsPath.taskManagerFont,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.keyboardType,
    required this.labelTextPath,
    required this.height,
  });
  final TextInputType? keyboardType;
  final String labelTextPath;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 320.sp,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          isCollapsed: true,
          labelText: labelTextPath,
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
                color: Colors.grey, width: 0.5.sp, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onTap,
    required this.textPath,
  });
  final VoidCallback onTap;
  final String textPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 59.sp,
          width: 327.sp,
          decoration: BoxDecoration(
              color: redText, borderRadius: BorderRadius.circular(43.r)),
          child: Center(
            child: Text(
              textPath,
              style: TextStyle(
                  fontFamily: TaskManagerAssetsPath.taskManagerFont,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                  color: whiteText),
            ),
          ),
        ),
      ),
    );
  }
}
