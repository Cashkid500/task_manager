import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/models/tasks/response/get_task.dart';
import 'package:task_manager/providers/state_provider/tasks/tasks_provider.dart';
import 'package:task_manager/screens/add%20task/add_task.dart';
import 'package:task_manager/screens/add%20task/widget.dart';
import 'package:task_manager/screens/history/history.dart';
import 'package:task_manager/screens/home/widget.dart';
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
  bool isArraySet = false;
  List<bool> arrayOfChecks = [];
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

  void fillArray() {
    if (tasks != null && !isArraySet) {
      if (tasks!.data.tasks.isNotEmpty) {
        for (int i = 0; i < tasks!.data.tasks.length; i++) {
          setState(() {
            arrayOfChecks.add(false);
          });
        }

        setState(() {
          isArraySet = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final getTaskState = ref.watch(getTaskStateNotifierProvider);
    if (getTaskState is GetTaskSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          tasks = getTaskState.responseData;
        });
        fillArray();
      });
    } else if (getTaskState is GetTaskFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(getTaskStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: getTaskState.failure.message);
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
                  GestureDetector(child: const Icon(Icons.apps)),

                  SizedBox(width: 30.sp),

                  //*********  Task Manager Text *********/
                  const RichTextWidget(),
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

            //********* Pending Task Container *********/
            const PendingTaskWidget(),

            SizedBox(height: 20.sp),

            if (GetTaskState is GetTaskLoading || tasks == null) ...[
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ] else ...[
              ...List.generate(
                tasks!.data.tasks.length,
                (index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateTaskScreen(
                            id: tasks!.data.tasks[index].trackid)),
                  ),
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
                                  //*********  Title FormField *********/
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

                                  //*********  Description FormField *********/
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

                                  //*********  Date FormField *********/
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

                          //*********  Checkbox *********/
                          Checkbox(
                            value: arrayOfChecks[index],
                            checkColor: blackText,
                            onChanged: (bool? value) {
                              setState(() {
                                arrayOfChecks[index] = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.sp),
            ],
          ]),
        ),
      ),
    );
  }
}
