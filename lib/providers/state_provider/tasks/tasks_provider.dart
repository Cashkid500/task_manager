import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/state/tasks/tasks_notifier.dart';
import 'package:task_manager/state/tasks/tasks_state.dart';

//************ Create Task Provider ************
final createTaskStateNotifierProvider =
    StateNotifierProvider<CreateTaskStateNotifier, CreateTaskState>(
  (ref) => CreateTaskStateNotifier(ref),
);

//************ Update Task Provider ************
final updateTaskStateNotifierProvider =
    StateNotifierProvider<UpdateTaskStateNotifier, UpdateTaskState>(
  (ref) => UpdateTaskStateNotifier(ref),
);

//************ Delete Task Provider ************
final deleteTaskStateNotifierProvider =
    StateNotifierProvider<DeleteTaskStateNotifier, DeleteTaskState>(
  (ref) => DeleteTaskStateNotifier(ref),
);
