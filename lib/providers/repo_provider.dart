import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/tasks/tasks_abstract.dart';
import 'package:task_manager/data/repository/tasks/tasks_impl.dart';

//************ Create Task Repository Provider ************
final createTaskRepositoryProvider = Provider<CreateTaskRepo>(
  (ref) => CreateTaskRepoImpl(ref: ref),
  );

//************ Update Task Repository Provider ************
final updateTaskRepositoryProvider = Provider<UpdateTaskRepo>(
  (ref) => UpdateTaskRepoImpl(ref: ref),
  );

//************ Delete Task Repository Provider ************
final deleteTaskRepositoryProvider = Provider<DeleteTaskRepo>(
  (ref) => DeleteTaskRepoImpl(ref: ref),
  );