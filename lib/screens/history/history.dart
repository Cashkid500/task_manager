import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/models/tasks/body/delete_task.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
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
    final GetTaskState = ref.watch(getTaskStateNotifierProvider);
    if (GetTaskState is GetTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          tasks = GetTaskState.responseData;
        });
      });
    } else if (GetTaskState is GetTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(getTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: GetTaskState.failure.message);
      });
    }

    final DeleteTaskState = ref.watch(deleteTaskStateNotifierProvider);
    if (DeleteTaskState is DeleteTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(deleteTaskStateNotifierProvider.notifier).resetState();
        // responseData = DeleteTaskState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: TaskManagerText.deleteTaskSuccessResponse);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()));
      });
    } else if (DeleteTaskState is DeleteTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(deleteTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: DeleteTaskState.failure.message);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(bottom: 20.sp),
            child: Column(
              children: [
              //*********  Header *********/
              const HeaderWidget(
                rowTextPath: TaskManagerText.history,
              ),
        
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
                                    //*********  Title *********/
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
                  
                                    //*********  Description *********/
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
                  
                                    //*********  Date *********/
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
                  
                            //*********  Delete Icon *********/
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
        
              // const Spacer(),
        
              // Container(
              //   height: 40.sp,
              //   width: 160.sp,
              //   decoration: BoxDecoration(
              //     color: blackText,
              //     borderRadius: BorderRadius.circular(30.sp),
              //   ),
              //   child: Center(
              //     child: Text(
              //       TaskManagerText.taskReassigned,
              //       style: TextStyle(
              //         fontSize: 15.sp,
              //         color: whiteText,
              //         fontFamily: TaskManagerAssetsPath.taskManagerFont,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
