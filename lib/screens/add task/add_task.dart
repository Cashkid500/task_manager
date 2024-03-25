import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/models/tasks/body/create_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/home/home.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  //***************  Text Controllers ****************/
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

  void handleAddTask() {
    CreateTaskModel data = CreateTaskModel(
        title: titleController.text,
        description: descriptionController.text,
        date: dateController.text);
    ref
        .read(createTaskStateNotifierProvider.notifier)
        .createTask(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final CreateTaskState = ref.watch(createTaskStateNotifierProvider);
    if (CreateTaskState is CreateTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(createTaskStateNotifierProvider.notifier).resetState();
        // responseData = CreateTaskState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: TaskManagerText.successResponse);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()));
      });
    } else if (CreateTaskState is CreateTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(createTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: CreateTaskState.failure.message);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            //*********  Header *********/
            const HeaderWidget(rowTextPath: TaskManagerText.addTask),

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

            if (CreateTaskState is CreateTaskLoading)
              const Center(
                child: CircularProgressIndicator(),
              )

            else
            //********* Add Button *********/
            AddButton(
                textPath: TaskManagerText.add,
                onTap: () {
                  if (titleController.text.isEmpty &&
                        descriptionController.text.isEmpty &&
                        dateController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: TaskManagerText.enterAllFields);
                    } else if (titleController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: TaskManagerText.enterTitle);
                    } else if (descriptionController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: TaskManagerText.enterDescription);
                    } else if (dateController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: TaskManagerText.enterDate);
                    } else {
                      handleAddTask();
                    }
                }),
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen())),
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
    required this.controller,
  });
  final TextInputType? keyboardType;
  final String labelTextPath;
  final double? height;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 320.sp,
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
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

class AppSnackbar {
  final BuildContext context;
  final bool isError;
  final int? seconds;
  final double height;
  final FToast _fToast = FToast();
  AppSnackbar(
    this.context, {
    this.isError = false,
    this.seconds,
    this.height = 60,
  }) {
    _fToast.init(context);
  }
  void showToast({required String text}) {
    final Size size = MediaQuery.of(context).size;
    final Widget toastWidget = Container(
      width: size.width,
      height: height.sp,
      padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 14.0),
      decoration: BoxDecoration(
        color: isError ? const Color(0xFFFF8C39) : const Color(0xFF34A853),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 1.4,
            child: Text(
              text,
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: isError
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFFFFFFFF),
                  fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
    _fToast.showToast(
      child: toastWidget,
      toastDuration: Duration(seconds: seconds ?? 4),
      gravity: ToastGravity.TOP,
      positionedToastBuilder: (context, child) => Positioned(
        //top: 0.h,
        top: size.height * 0.034,
        //left: size.width * 0.0628,
        child: Center(child: child),
      ),
    );
  }
}

class ShowToast {
  static void errorToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context, isError: true);
    toast.showToast(text: text);
  }

  static void successToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context);
    toast.showToast(text: text);
  }
}
