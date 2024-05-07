import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/add%20task/widget.dart';
import 'package:task_manager/screens/history/widget.dart';
import 'package:task_manager/screens/home/home.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  GetTaskResponse? tasks;

  void handleGetTask() {
    ref.read(getTaskStateNotifierProvider.notifier).getTask();
  }

  void handleDeleteTask({
    required String id,
  }) {
    DeleteTaskModel data = DeleteTaskModel(trackid: id);
    ref
        .read(deleteTaskStateNotifierProvider.notifier)
        .deleteTask(payload: data);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleGetTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getTaskState = ref.watch(getTaskStateNotifierProvider);
    if (getTaskState is GetTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          tasks = getTaskState.responseData;
        });
      });
    } else if (getTaskState is GetTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(getTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: getTaskState.failure.message);
      });
    }

    final deleteTaskState = ref.watch(deleteTaskStateNotifierProvider);
    if (deleteTaskState is DeleteTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(deleteTaskStateNotifierProvider.notifier).resetState();
        // responseData = DeleteTaskState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: TaskManagerText.deleteTaskSuccessResponse);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()));
      });
    } else if (deleteTaskState is DeleteTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(deleteTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: deleteTaskState.failure.message);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(bottom: 20.sp),
            child: Column(
              children: [
              //////////////////////////////////////////////////////////
              /// HEADER SECTION
              /////////////////////////////////////////////////////////
              const HeaderWidget(rowTextPath: TaskManagerText.history),
        
              SizedBox(height: 30.sp),
        
              //////////////////////////////////////////////////////////
              /// COMPLETED TASK CONTAINER
              /////////////////////////////////////////////////////////
              const CompletedTaskWidget(),
        
              SizedBox(height: 20.sp),
        
              if (GetTaskState is GetTaskLoading || tasks == null) ...[
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ] else ...[
                ...List.generate(
                  tasks!.data.tasks.length,
                  (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.sp),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //////////////////////////////////////////////////////////
                                    /// FORM FIELDS SECTION
                                    /////////////////////////////////////////////////////////
                                    //*********  Title TextField *********/
                                    Text(
                                      tasks!.data.tasks[index].title,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: blackText,
                                        fontFamily:
                                            TaskManagerAssetsPath.taskManagerFont,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                  
                                    SizedBox(height: 5.sp),
                  
                                    //*********  Description TextField *********/
                                    Text(
                                      tasks!.data.tasks[index].description,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: blackText,
                                        fontFamily:
                                            TaskManagerAssetsPath.taskManagerFont,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                  
                                    SizedBox(height: 5.sp),
                  
                                    //*********  Date TextField *********/
                                    Text(
                                      tasks!.data.tasks[index].date,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: blackText,
                                        fontFamily:
                                            TaskManagerAssetsPath.taskManagerFont,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    if (index != tasks!.data.tasks.length - 1)
                                      SizedBox(height: 20.sp),
                                  ]),
                            ),
                  
                            //////////////////////////////////////////////////////////
                            /// DELETE TASK ICON
                            /////////////////////////////////////////////////////////
                            GestureDetector(
                                onTap: () => handleDeleteTask(
                                    id: tasks!.data.tasks[index].trackid),
                                child: const Icon(Icons.restore_from_trash,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}

