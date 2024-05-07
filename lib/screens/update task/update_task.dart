import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/models/tasks/body/update_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/add%20task/widget.dart';
import 'package:task_manager/screens/home/home.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

class UpdateTaskScreen extends ConsumerStatefulWidget {
  const UpdateTaskScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends ConsumerState<UpdateTaskScreen> {
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

  void handleUpdateTask() {
    UpdateTaskModel data = UpdateTaskModel(
        title: titleController.text,
        description: descriptionController.text,
        date: dateController.text,
        trackid: widget.id);
    ref
        .read(updateTaskStateNotifierProvider.notifier)
        .updateTask(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final updateTaskState = ref.watch(updateTaskStateNotifierProvider);
    if (updateTaskState is UpdateTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(updateTaskStateNotifierProvider.notifier).resetState();
        // responseData = UpdateTaskState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: TaskManagerText.updateTaskSuccessResponse);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()));
      });
    } else if (updateTaskState is UpdateTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(updateTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: updateTaskState.failure.message);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            //////////////////////////////////////////////////////////
            /// HEADER SECTION
            /////////////////////////////////////////////////////////
            const HeaderWidget(
              rowTextPath: TaskManagerText.updateTask,
            ),

            SizedBox(height: 60.sp),

            //////////////////////////////////////////////////////////
            /// FORM FIELDS SECTION
            /////////////////////////////////////////////////////////
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
            DateFieldWidget(
              dateController: dateController,
              onTap: () => onTapFunction(context: context),
            ),

            SizedBox(height: 40.sp),

            if (UpdateTaskState is UpdateTaskLoading)
              const Center(child: CircularProgressIndicator())
            else

              //////////////////////////////////////////////////////////
              /// UPDATE BUTTON 
              /////////////////////////////////////////////////////////
              AddButton(
                textPath: TaskManagerText.update,
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
                    errorToast.showToast(
                        text: TaskManagerText.enterDescription);
                  } else if (dateController.text.isEmpty) {
                    AppSnackbar errorToast =
                        AppSnackbar(context, isError: true);
                    errorToast.showToast(text: TaskManagerText.enterDate);
                  } else {
                    handleUpdateTask();
                  }
                },
              ),

            SizedBox(height: 20.sp),
          ]),
        ),
      ),
    );
  }
}
