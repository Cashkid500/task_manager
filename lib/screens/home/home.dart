import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/history/history.dart';
import 'package:task_manager/screens/settings/settings.dart';
import 'package:task_manager/screens/update%20task/update_task.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isChecked = false;
  GetTaskResponse? tasks;

  void handleGetTask() {
    ref.read(getTaskStateNotifierProvider.notifier).getTask();
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen())),
        backgroundColor: whiteText,
        focusColor: blackText,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_outlined),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  GestureDetector(
                      // onTap: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const UpdateTaskScreen())),
                      child: const Icon(Icons.apps)),

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
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryScreen())),
                      child: Icon(Icons.history_outlined,
                          color: blackText, size: 25.sp)),

                  SizedBox(width: 30.sp),

                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen())),
                      child: Icon(Icons.settings_outlined,
                          color: blackText, size: 25.sp)),
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

            if (GetTaskState is GetTaskLoading || tasks == null) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ] else ...[
              ...List.generate(
                tasks!.data.tasks.length,
                (index) => GestureDetector(
                  onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  UpdateTaskScreen(id: tasks!.data.tasks[index].trackid))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                  if (index != tasks!.data.tasks.length - 1) SizedBox(height: 20.sp),
                                ]),
                          ),
                  
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
                    ],
                  ),
                ),
              ),
            ],
          ]),
        ),
      ),
    );
  }
}
